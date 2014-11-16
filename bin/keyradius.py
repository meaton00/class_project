
import csv
from numpy import sqrt

# Midpoint for Key Bridge
x1 = 38.902543
y1 = -77.069830

# Threshold marker 
x2 = 38.900122
y2 = -77.071176


radius_squared = (x2 - x1)**2 + (y2 - y1)**2
radius = sqrt(radius_squared)

data_file = open("IncidentData_24OCT14.csv", "rU")
data = csv.DictReader(data_file)

results = []

for row in data:
	lat = float(row["Latitude"])
	lon = float(row["Longitude"])

	distance_squared = ((lat) - x1)**2 + ((lon) - y1)**2
	distance = sqrt(distance_squared)

	if distance <= radius:
		results.append({"Location": row["Location"], "Type": row["Standardized Type"], 
			"Start Time": row["Time Opened"], "End Time": row["Time Closed"], 
			"Latitude": row["Latitude"], "Longitude": row["Longitude"]})

f = open('radiuskeybridge.csv','wb')
w = csv.DictWriter(f, fieldnames = ["Location", "Type", "Start Time", "End Time", "Latitude", "Longitude"])
w.writeheader()
w.writerows(results)	




