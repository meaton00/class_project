# this script reads the tmc_identification csv file, adds a serial number column,
# and rearranges so that this serial number is at the beginning

import pandas as pd

fn = pd.read_csv('C:/Users/mernie/GTProjects/class_project/tmc_identification.csv')

#create new column with serial key value
fn['tmckey'] = fn.index + 1

#used in testing only
#fn.head()
#fn.shape

#reorder frame to desired order
frame = fn[['tmckey', 'tmc', 'Crossing', 'Direction', 'road', 'direction', 'intersection', 'state', 'county', 'zip', 'start_latitude', 'start_long', 'end_latitude', 'end_longitude', 'miles', 'road_order']]
	
# write to csv for load to database
frame.to_csv("tmc-ident.csv", index=False)



