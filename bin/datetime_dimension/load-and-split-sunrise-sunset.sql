-- sql query to convert datetime output for sunrise and sunset to time only
DROP table "dtemp"; 

CREATE table "dtemp"
 (
  "dt_sunrise" timestamp,
  "dt_sunset" timestamp
   );
   
COPY "dtemp" from 'C:\Users\mernie\gtprojects\class_project\rise-set.csv' Delimiter ',' csv;

SELECT * FROM "dtemp";

ALTER table "dtemp" ADD COLUMN sunrise_date date;
ALTER table "dtemp" ADD COLUMN sunrise_time time;
ALTER table "dtemp" ADD COLUMN sunset_date date;
ALTER table "dtemp" ADD COLUMN sunset_time time;

UPDATE "dtemp"
SET
   Sunrise_Date = dt_sunrise::date,
   Sunrise_Time = dt_sunrise::time,
   Sunset_Date = dt_sunset::date,
   Sunset_Time = dt_sunset::time;
   
 