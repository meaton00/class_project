#import the incidents data, read the duration in minutes, calculate how many
#  10-min buckets are in the duration and create new rows for each; these rows will
#  each have a different standardized time bucket; writes out to new csv; 
#  note that original csv file had no headers

import csv
import datetime

with open('incidents.csv', 'rb') as incsv:
    with open('upd_incidents.csv', 'wb') as outcsv:
        reader = csv.reader(incsv)
        writer = csv.writer(outcsv)

        for row in reader:
            dur_rows = int(row[6])/10 #row[n] is index value of the duration column
            test_date = datetime.datetime.strptime(row[5], '%Y-%m-%d %H:%M') #row[nn] is index value of the start_timestamp column
            if dur_rows > 1:
                for i in range(dur_rows + 1): 
                    row[5] = test_date + datetime.timedelta(minutes=(10*i))  #update value of time_std by 10 min* iteration count
                    writer.writerow(row)
            else:
                writer.writerow(row)