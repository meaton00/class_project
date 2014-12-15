--DROP table weather;
-- 'weatherkey', 'date','time_previous','time','tempi','conds','conds_standard','wspdi',
--'wgusti','visi','precipi','rain','snow','fog'

CREATE table weather
   (weatherkey serial,
    weather_date date,
    weather_time_orig time without time zone,
    weather_time_std time without time zone,
    weather_temp real,
    weather_conds_orig varchar(35),
    weather_conds_std varchar(15),
    weather_wind_speed real,
    weather_wind_gusts real,
    weather_viz real,
    weather_precip real,
    weather_rain boolean,
    weather_snow boolean,
    weather_fog boolean
     );
	 
COPY weather FROM 'C:\Users\mernie\GTProjects\weatherdata.csv' DELIMITER ',' CSV HEADER;
