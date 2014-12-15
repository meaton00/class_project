# generates time dimension table of 10 minute increments for one year, Oct 2013
#   Sep 2014;  also adds serial timekey ; writes out to csv file

import datetime

import csv
myfile = open('timetable.csv', 'wb')
wr = csv.writer(myfile, quoting=csv.QUOTE_ALL)

start = datetime.datetime.strptime("2013-10-01 00:00:00", "%Y-%m-%d %H:%M:%S")
end = datetime.datetime.strptime("2014-10-01 00:00:00", "%Y-%m-%d %H:%M:%S")

# date_generated2 = [start + datetime.timedelta(days=x) for x in range(0, (end-start).days)]
# date_generated2 = [start + datetime.timedelta(seconds=x) for x in range(0, (end-start).days, 600)]
date_generated2 = [start + datetime.timedelta(seconds=x) for x in range(0, 31536000, 600)]

timekey = 0

for date in date_generated2:
    timekey += 1
    wr.writerow((timekey, date.strftime("%Y-%m-%d"), date.strftime("%H:%M:%S")))
	

