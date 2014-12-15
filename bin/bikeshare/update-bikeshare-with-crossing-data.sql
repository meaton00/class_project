-- ALTER TABLE bikeshare ADD COLUMN bike_start_state char(2);
ALTER TABLE bikeshare ADD COLUMN bike_crossing varchar(3);


-- update bike_crossing with inbound and outbound values

update bikeshare
set bike_crossing = 
      (select
      CASE WHEN bike_start_station_code < '31100' AND bike_end_station_code >= '31100' THEN 'IN'
           WHEN bike_start_station_code >= '31100' AND bike_end_station_code < '31100' THEN 'OUT'
	   ELSE 'NOT' END
      )
