# IngestWX
# Program takes ingested weather JSON file, and writes out
#    the data we're interested in to an output file in csv format
#
# Author: GU SCS Data Analytics Cohort 2, Team Godzilla
# Created: October 15, 2014
#

################################################################
#  IMPORTS
################################################################

import json
import csv

################################################################
#  FILE HANDLING
################################################################

f = open('weather_ingest4SEP.json', 'r')
g = open('weather_csv_out1.csv', 'wb')

################################################################
#  MAIN PROGRAM
################################################################

json_string = f.read()
parsed_data = json.loads(json_string)
head = 'date,time,tempi,conds,wspdi,wgusti,visi,precipi,rain,snow,hail,fog'
g.write(head)
g.write('\n')

for day in parsed_data:
	this_date = day['history']['date']['mon'] + "/" + day['history']['date']['mday'] + '/' + day['history']['date']['year']
	for hr in day['history']['observations']:
		outstr = this_date + ',' + hr['date']['hour'] + ':' + hr['date']['min']
		outstr += ',' + hr['tempi'] + ',' + hr['conds']
		outstr += ',' + hr['wspdi'] + ',' + hr['wgusti']
		outstr += ',' + hr['visi'] + ',' + hr['precipi']
		outstr += ',' + hr['rain'] + ',' + hr['snow']
		outstr += ',' + hr['hail'] + ',' + hr['fog']
		g.write(outstr)
		g.write('\n')

###################################################################
#  FILE HANDLING
###################################################################
		
f.close()
g.close()
