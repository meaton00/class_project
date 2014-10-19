# IngestWX
# Program to ingest weather data for class project, from wunderground's API
#
# Author: GU SCS Data Analytics Cohort 2, Team Godzilla
# Created: October 13, 2014
#

################################################################
#  CONSTANTS
################################################################

API_KEY = "92827660840d7850"   # should be put in separate file
DAYS_TO_RUN = 365	# start date hardwired to be October 1, 2013
					# do not set DAYS_TO_RUN > 365
month_offsets_2013 = [0,31,61,9999]
month_offsets_2014 = [0,31,59,90,120,151,181,212,243,273,9999]

################################################################
#  IMPORTS
################################################################

import urllib2
import json
import time
import math
		
################################################################
#  FUNCTIONS
################################################################

def build_date_string(ind):
	"""
	Build up the date string which is part of the API call
	Input arg "ind" is the index for the day
	Ind = 1 is the first day of our extract: October 1, 2013
	Format for the date needs to be YYYYMMDD
	"""

	if ind < 92:
		thisday = ind + 1
		mon = 0
		while thisday > month_offsets_2013[mon+1]: mon += 1
		monstr = str(mon+10)
		day = thisday - month_offsets_2013[mon]
		if day < 10:
			daystr = "0" + str(day)
		else:
			daystr = str(day)
		return "2013" + monstr + daystr
	else:
		thisday = ind - 91
		mon = 0
		while thisday > month_offsets_2014[mon+1]: mon += 1
		monstr = str(mon+1)
		day = thisday - month_offsets_2014[mon]
		if day < 10:
			daystr = "0" + str(day)
		else:
			daystr = str(day)
		return "20140" + monstr + daystr


################################################################
#  FILE HANDLING
################################################################

f_out = open('weather_ingest.json', 'a')
f_log = open('weather_ingest_log.txt', 'a')

################################################################
#  MAIN PROGRAM LOOP
################################################################

for i in range(DAYS_TO_RUN):
	
	myurl = "http://api.wunderground.com/api/" + API_KEY
	this_date = build_date_string(i)
	myurl +=  "/history_" + this_date + "/q/DC/Washington.json"
#	print myurl

#	"http://api.wunderground.com/api/92827660840d7850/history_20140601/q/DC/Washington.json"

	wurl = urllib2.urlopen(myurl)

	json_string = wurl.read()
	parsed_json = json.loads(json_string)
	date = parsed_json['history']['date']['pretty']

	f_out.write(json_string)
	f_out.write('\n')
	f_log.write(str(i+1) + ", " + this_date + ", " + date)
	f_log.write('\n')
		
	print str(i+1) + ", " + this_date + ", " + date
	print ('\n')
#	print parsed_json

	wurl.close()

	time.sleep(7)  # so as to not exceed max permitted API calls

###################################################################
#  FILE HANDLING
###################################################################

f_out.close()
f_log.close()
