# read the downloaded csv files from capital bikeshare website
# concatenate the quarterly data
# note that data not programmatically obtained as file names changed, not all 
#   data was available at the same time, and 3Q 2014 had to be re-downloaded
#   when initial download had incomplete dataset  


import glob  #find pathnames following certain pattern
import pandas as pd
# Set some Pandas options
pd.set_option('html', False)
pd.set_option('max_columns', 30)

# point to set of files of quarterly bikeshare data downloads
path = r'C:/Users/mernie/Desktop/ClassProjectData/Rawbikedata'
allFiles = glob.glob(path + "/*.csv")
list = []

#read and concatenate all csv files, add column indicating original source file of data
for files in allFiles:
    df = pd.read_csv(files, index_col=None, header=0)
    df['Sourcefile'] = files
    list.append(df)

#ignore_index = True so that new serial row counter of all files can be created
frame = pd.concat(list, ignore_index = True)

#check output - comment out in final
#frame.head()
#frame.shape

#add column bikekey for concatenated file serial file to use as key value in db; start with 1
frame['bikekey'] = frame.index + 1

# order dataframe in desired order (not the default alphabetical)
frame[['bikekey','Duration','Start date','Start Station','Start terminal','End date','End Station', 'End terminal','Bike#','Subscription type','Sourcefile']]

#write new concatenated csv out to file
frame.to_csv("bikedata5.csv")