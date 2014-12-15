# this script reads the updated incident csv file, adds a serial number column,
# and rearranges so that this serial number is at the beginning

import pandas as pd

fn = pd.read_csv('C:\Users\mernie\GTProjects\upd_incidents.csv')

#create new column with serial key value
fn['incidentkey'] = fn.index + 1

#used in testing only
#fn.head()
#fn.shape

#reorder frame to desired order
# this file has no headers, so commenting out this row
"""frame = fn[['incidentkey', 'tmc_crossing','incident_description','incident_std_type', 
            'incident_start_timestamp','incident_end_timestamp','incident_timestamp10', 
			'incident_duration_min','tmc_inout','incident_latitude','incident_longtitude']]
	
# write to csv for load to database"""
fn.to_csv("incidentdata.csv", index=False)




