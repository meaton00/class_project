-- queries to test dtemp table and joins, then update DATES table with 
-- sunrise and sunset_time
-- comment out tests when run update 


-- select * from dtemp;

-- select d."Date", t.sunrise_date, t.sunrise_time
--from "DATES" d
-- inner join dtemp t on d."Date" = t.sunrise_date
-- order by d."Date";

UPDATE "DATES"
SET
  "Date_Sunrise" = dtemp.sunrise_time,
  "Date_Sunset" = dtemp.sunset_time
 FROM dtemp
 WHERE "DATES"."Date" = dtemp.sunrise_date;
   
--