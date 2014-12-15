--DROP table traffic;
-- 'traffickey', 'tmc_code','measurement_tstamp','speed','average_speed','reference_speed','travel_time_minutes','confidence_score','cvalue'

CREATE table traffic
   (traffickey serial,
    tmc_id varchar(9),
    traffic_timestamp timestamp without time zone,
    traffic_speed real,
    traffic_avg_speed real,
    traffic_ref_speed real,
    traffic_travel_time_min real,
    traffic_conf_score real,
    traffic_cvalue real
     );
	 
COPY traffic FROM 'C:\Users\mernie\GTProjects\trafficdata.csv' DELIMITER ',' CSV HEADER;
