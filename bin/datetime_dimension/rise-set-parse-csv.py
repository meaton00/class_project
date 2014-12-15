# this program calculates sunrise-sunset based on coded lat/long and outputs 
#   values for each date in given range
# updated to add more comments
# This version writes output to csv file
# Adds sunrise sunset in UTC for each day - converts to localtime (EST, EDT)
# These times match to those downloaded from Naval site


import csv
myfile = open('rise-set.csv', 'wb')
wr = csv.writer(myfile, quoting=csv.QUOTE_ALL)

import ephem
sun = ephem.Sun()
dca = ephem.Observer()   #define observer as lat/long of national airport to match weather observations
dca.lat = '38:51:06'
dca.lon = '-77:02:25'
dca.horizon = '-0:34'   #standard horizon offset
dca.pressure = 0

import datetime
start = datetime.datetime.strptime("Tue Oct 2013-10-01 00:00:00", "%a %b %Y-%m-%d %H:%M:%S")
end = datetime.datetime.strptime("Wed Oct 2014-10-01 00:00:00", "%a %b %Y-%m-%d %H:%M:%S")

date_generated = [start + datetime.timedelta(days=x) for x in range(0, (end-start).days)]
# date_generated2 = [start + datetime.timedelta(seconds=x) for x in range(0, (end-start).days, 600)]
# date_generated2 = [start + datetime.timedelta(seconds=x) for x in range(0, 31536000, 600)]

for date in date_generated:
    dca.date = date
    r1 = ephem.localtime(ephem.Date(dca.next_rising(sun)))
    r2 = ephem.localtime(ephem.Date(dca.next_setting(sun))) 
    wr.writerow(('%s' %r1, '%s' %r2))
	
