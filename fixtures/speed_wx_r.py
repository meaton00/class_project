#Generate plot for Outbound Bridge Crossing file
#Shows % change in speed under precipitation conditions


import csv
import matplotlib.pyplot as plt

bar_width = .75

fig = plt.figure(1)
plt.subplot(2,3,1)
plt.bar([1,2,3,4],[0.1,-2.2,-5.5,-3.7],width=bar_width, color=['k','r','g','b'])
plt.tick_params(bottom='off',top='off',labelbottom='off')
plt.axis([1,5,-10,10])
plt.axhline(0, color='black')
plt.grid(True,axis='y')
plt.yticks([-10,-8,-6,-4,-2,0,2,4,6,8,10])
plt.xlabel('I395 HOV')

fig = plt.figure(1)
plt.subplot(2,3,2)
plt.bar([1,2,3,4],[0.1,-4.6,-10,-0.1],width=bar_width, color=['k','r','g','b'])
plt.tick_params(bottom='off',top='off',labelbottom='off')
plt.axis([1,5,-10,10])
plt.axhline(0, color='black')
plt.grid(True,axis='y')
plt.yticks([-10,-8,-6,-4,-2,0,2,4,6,8,10])
plt.xlabel('I395 Main')

fig = plt.figure(1)
plt.subplot(2,3,3)
plt.bar([1,2,3,4],[0.1,-3.8,-5.8,-0.5],width=bar_width, color=['k','r','g','b'])
plt.tick_params(bottom='off',top='off',labelbottom='off')
plt.axis([1,5,-10,10])
plt.axhline(0, color='black')
plt.grid(True,axis='y')
plt.yticks([-10,-8,-6,-4,-2,0,2,4,6,8,10])
plt.xlabel('Roosevelt')

fig = plt.figure(1)
plt.subplot(2,3,4)
plt.bar([1,2,3,4],[0.1,-0.6,-4.0,-0.7],width=bar_width, color=['k','r','g','b'])
plt.tick_params(bottom='off',top='off',labelbottom='off')
plt.axis([1,5,-10,10])
plt.axhline(0, color='black')
plt.grid(True,axis='y')
plt.yticks([-10,-8,-6,-4,-2,0,2,4,6,8,10])
plt.xlabel('Memorial')

fig = plt.figure(1)
plt.subplot(2,3,5)
plt.bar([1,2,3,4],[0.1,-1.6,0.5,-5.5],width=bar_width, color=['k','r','g','b'])
plt.tick_params(bottom='off',top='off',labelbottom='off')
plt.axis([1,5,-10,10])
plt.axhline(0, color='black')
plt.grid(True,axis='y')
plt.yticks([-10,-8,-6,-4,-2,0,2,4,6,8,10])
plt.xlabel('Key Bridge')

fig = plt.figure(1)
plt.subplot(2,3,6)
plt.bar([1,2,3,4],[0.1,-3.2,1.0,-6.7],width=bar_width, color=['k','r','g','b'])
plt.tick_params(bottom='off',top='off',labelbottom='off')
plt.axis([1,5,-10,10])
plt.axhline(0, color='black')
plt.grid(True,axis='y')
plt.yticks([-10,-8,-6,-4,-2,0,2,4,6,8,10])
plt.xlabel('Chain Bridge')

#plt.tight_layout()
plt.show()

#fig = plt.figure()
#ax = fig.gca(projection='3d')
#ax.plot(x, y, z, label='I395 North Mainline', linewidth=5.0)
#ax.plot(x, y, z, 'r--',
#	xrain, yrain, zrain, 'bs', linewidth=5.0)
#ax.set_xlabel('density')
#ax.set_ylabel('speed')
#ax.set_zlabel('flow')

#ax.plot(x, y, z, 'r-', label='Model', linewidth=5.0)
#ax.plot(xalt, yalt, zalt, '.', label='Observed', linewidth=4.0)
#ax.legend(loc='upper right')
#plt.title('I395 North Mainline')
#plt.show()
