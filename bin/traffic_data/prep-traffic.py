# this script reads the VPP-download (traffic) csv file, adds a serial number column,
# and rearranges so that this serial number is at the beginning

import pandas as pd

fn = pd.read_csv('C:/Users/mernie/GTProjects/class_project/docs/VPP-download.csv')

#create new column with serial key value
fn['traffickey'] = fn.index + 1

#used in testing only
fn.head()
fn.shape

#reorder frame to desired order
frame = fn[['traffickey', 'tmc_code','measurement_tstamp','speed','average_speed','reference_speed','travel_time_minutes','confidence_score','cvalue']]
	
# write to csv for load to database
frame.to_csv("trafficdata.csv", index=False)




