--DROP table tmc;

CREATE table tmc
   (tmckey serial,
    tmc_id varchar(9),
    tmc_crossing varchar(15),
	tmc_inout varchar(3),
	tmc_description varchar(25),
	tmc_direction varchar(10),
	tmc_intersection varchar(35),
	tmc_state varchar(2),
	tmc_county varchar(25),
	tmc_zip varchar(5),
	tmc_start_lat numeric(11,7),
	tmc_start_lon numeric(11,7),
	tmc_end_lat numeric(11,7),
	tmc_end_lon numeric(11,7),
	tmc_miles float(8),
	tmc_road_order smallint
	 );
	 
COPY tmc FROM 'C:\Users\mernie\GTProjects\tmc-ident.csv' DELIMITER ',' CSV HEADER;
