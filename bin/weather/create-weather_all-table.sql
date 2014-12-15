--DROP table weather_all;
-- 'weatherkey', 'date','time_previous','time','tempi','conds','conds_standard','wspdi',
--'wgusti','visi','precipi','rain','snow','fog'

CREATE table weather_all
   (weatherkey serial,
    weather_timestamp10 timestamp,
    weather_date date,
    weather_time_std time without time zone,
    weather_hour_stump time without time zone,
    weather_glare boolean,
    weather_temp varchar(5), --real,
    weather_conds_std varchar(20),
    weather_wind_speed varchar(5), --real,
    weather_wind_gusts varchar(5), --real,
    weather_viz varchar(5), -- real,
    weather_precip varchar(5), -- real,
    weather_rain varchar(1), -- boolean,
    weather_snow varchar(1), --boolean,
    weather_fog varchar(1) --boolean
     );
	 
COPY weather_all FROM 'C:\Users\mernie\Desktop\ClassProjectData\new-weather.csv' DELIMITER ',' CSV NULL '0' HEADER;
