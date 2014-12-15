-- DROP table time10;

CREATE table time10
   (timekey bigserial,
    timedate date,
     time10 time without time zone
	 );
	 
COPY time10 FROM 'C:\Users\mernie\GTProjects\timetable.csv' DELIMITER ',' CSV;
