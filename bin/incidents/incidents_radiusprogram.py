#Program to capture incidents within a specified radius. Example below
#for Theodore Roosevelt Bridge - Input to be modified as appropriate for 
#each other bridge crossing. 
#x1, y1: Lat/Long coordinates of mid-point location of bridge
#x2, y2: Lat/Long coordinates of threshold radius within which to capture incident observations

import csv
from numpy import sqrt

x1 = 38.892335
y1 = -77.059549


x2 = 38.892493
y2 = -77.066340

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

f = open('radiusrooseveltbridge.csv','wb')
w = csv.DictWriter(f, fieldnames = ["Location", "Type", "Start Time", "End Time", "Latitude", "Longitude"])
w.writeheader()
w.writerows(results)	
