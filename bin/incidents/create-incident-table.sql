--DROP table incident;

CREATE table incident
   (    tmc_crossing varchar(15),
        incident_description varchar(75),
        incident_std_type varchar(30),
        incident_start_datetime timestamp,
	incident_end_datetime timestamp,
        incident_timestamp10 timestamp,
	incident_duration_min int,
	tmc_inout varchar(3),
	incident_lat numeric(11,7),
	incident_long numeric(11,7),
	incidentkey bigint
	);
	 
COPY incident FROM 'C:\Users\mernie\GTProjects\incidentdata.csv' DELIMITER ',' CSV HEADER;


