--DROP table bikeshare;

CREATE table bikeshare
   (    bike_orig_index bigint,
        bike_duration varchar(20),
	bike_start_datetime timestamp,
	bike_start_station_name varchar(100),
	bike_start_station_code varchar(10),
	bike_end_datetime timestamp,
        bike_end_station_name varchar(100),
	bike_end_station_code varchar(10),
	bike_id_num varchar(10),
	bike_subscription_type varchar(25),
	bike_source_path varchar(300),
	bikekey bigint
	);
	 
COPY bikeshare FROM 'C:\Users\mernie\GTProjects\bikedata5.csv' DELIMITER ',' CSV HEADER;


