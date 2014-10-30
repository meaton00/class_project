import csv 
import sys 

data_file = open("ritis-eventsdec13.csv", "rU")
data = csv.DictReader(data_file)

results = []

for item in data:
	print item
	if sys.argv[1] in item["Location"]:

		t = item["Location"].split("@")
		m = ""
		if len(t) == 2:
			m = t[1]

		results.append({"Location": t[0], "Mile Marker": m,  "Type": item["Standardized Type"], 
			"Start Time": item["Time Opened"], "Duration": item["Duration"], 
			"Latitude": item["Latitude"], "Longitude": item["Longitude"]})

for item in results:
	print item

f = open('interstateincidents.csv','wb')
w = csv.DictWriter(f, fieldnames = ["Location", "Mile Marker", "Type", "Start Time", "Duration", "Latitude", "Longitude"])
w.writeheader()
w.writerows(results)	
