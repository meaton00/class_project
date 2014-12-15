# this script reads the weather_data csv file, adds a serial number column,
# and rearranges so that this serial number is at the beginning

import pandas as pd

fn = pd.read_csv('C:\Users\mernie\Desktop\ClassProjectData\weather_data.csv')

#create new column with serial key value
fn['weatherkey'] = fn.index + 1

#used in testing only
#fn.head()
#fn.shape

#reorder frame to desired order
frame = fn[['weatherkey', 'date','time_previous','time','tempi','conds','conds_standard','wspdi','wgusti','visi','precipi','rain','snow','fog']]
	
# write to csv for load to database
frame.to_csv("weatherdata.csv", index=False)




