# VanAerde
# Program to solve for the Van Aerde model parameter vector
#
# Author: GU SCS Data Analytics Cohort 2, Team Godzilla
# Created: November 30, 2014
#

################################################################
#  CONSTANTS
################################################################

AVG_VEH_LEN = 16  # in feet

################################################################
#  IMPORTS
################################################################
import csv


# Read in the range of parameter values for this run
# substitute actuals read off a file, for what's below
kj0 = 270
kjincr = 10
kjiter = 5
qc0 = 2000
qcincr = 50
qciter = 5
uf0 = 54
ufincr = 3
ufiter = 5
uc0 = 30
ucincr = 5
uciter = 5

# read in the observed values from the detector
uobs = []   #factored up space-mean speed, miles per hour 
occobs = []  # lane occupancy, %
qobs = []    # flow, vehicles per hour per lane
j = 0
with open('model_input.csv', 'rU') as data_file:
	r = csv.reader(data_file)
	for row in r:
		uobs.append(float(row[2]))
		occobs.append(float(row[3]))
		qobs.append(float(row[4]))
		j += 1

# convert from occupancy (what the detector can measure)
# to density in veh/mile (parameter of interest)
kobs = [(x/100) * 5280 / AVG_VEH_LEN for x in occobs]

# find max values of the observed values, which is 
# used in the model to normalize each term in calculating
# the estimation error and make the error function unitless
uobs_max = max(uobs)
qobs_max = max(qobs)
kobs_max = max(kobs)

# Solve the optimization by iterating over a user-defined range of
# decision variable values and choosing the set that's closest to the
# observed range (closest defined as minimum sum of squared errors)
uc = uc0
minE = 10000000
for ucind in range(uciter):
	uf = uf0
	for ufind in range(ufiter):
		kj = kj0
		for kjind in range(kjiter):
			denominator = float(uc**2 * kj)
			c1 = uf * (2*uc - uf) / denominator
			c2 = (uf * (uf - uc)**2) / denominator
			qc = qc0
			for qcind in range(qciter):
				c3 = (1 / qc) - (uf / denominator)
				# now calculate k and q; then iterate to calculate sum of squared errors
				E = 0
				for i in range(len(uobs)):
					calc1 = c1 + (c2 / (uf - uobs[i])) + (c3 * uobs[i])
					if calc1 < .00001: calc1 = .00001  # div by zero check
					k = 1 / calc1
					q = k * uobs[i]
					E += ((q-qobs[i])/qobs_max)**2 + ((k-kobs[i])/kobs_max)**2
				if E<minE:
					minE = E
					bestkj = kj
					bestuc = uc
					bestuf = uf
					bestqc = qc
				qc += qcincr
			kj += kjincr
		uf += ufincr
	uc += ucincr

print 0, minE, bestkj, bestqc, bestuf, bestuc

