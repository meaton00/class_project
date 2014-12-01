import csv
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

AVG_VEH_LEN = 16  # in feet
x = []
y = []
z = []
xalt = []
yalt = []
zalt = []

qc = 2083.0   #1843
kj = 287.0   #113.0
uf = 51.0  #51
uc = 26.0  #42

uobs = []
occobs = []
qobs = []
j = 0
with open('MySCSProjects/model_input.csv', 'rU') as data_file:
	r = csv.reader(data_file)
	for row in r:
		uobs.append(float(row[2]))
		occobs.append(float(row[3]))
		qobs.append(float(row[4]))
		j += 1

# convert from occupancy (what the detector can measure)
# to density in veh/mile (parameter of interest)
kobs = [(n/100) * 5280 / AVG_VEH_LEN for n in occobs]

xalt = kobs
yalt = uobs
zalt = qobs

denominator = float(uc**2 * kj)
c1 = uf * (2*uc - uf) / denominator
c2 = (uf * (uf - uc)**2) / denominator
c3 = (1 / qc) - (uf / denominator)
for uiter in range(51):
	calc1 = c1 + (c2 / (uf - uiter)) + (c3 * uiter)
	if calc1 < .00001: calc1 = .00001  # div by zero check
	k = 1 / calc1
	q = k * uiter
	x.append(k)
	y.append(uiter)
	z.append(q)
	#xalt.append(k+24)
	#yalt.append(uiter-1.5)
	#zalt.append(q*.9)

fig = plt.figure()
ax = fig.gca(projection='3d')
#ax.plot(x, y, z, label='I395 North Mainline', linewidth=5.0)
#ax.plot(x, y, z, 'r--',
#	xrain, yrain, zrain, 'bs', linewidth=5.0)
ax.set_xlabel('density')
ax.set_ylabel('speed')
ax.set_zlabel('flow')

ax.plot(x, y, z, 'r-', label='Model', linewidth=5.0)
ax.plot(xalt, yalt, zalt, '.', label='Observed', linewidth=4.0)
ax.legend(loc='upper right')
plt.title('I395 North Mainline')
plt.show()
