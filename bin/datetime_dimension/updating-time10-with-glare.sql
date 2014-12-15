-- set glare to be sunrise +1.5 hours, and sunset - 1.5 hours
-- want to store, so will try with alter table add column and update

ALTER TABLE time10 ADD COLUMN glare boolean;

UPDATE time10 as t10
SET
    glare = 
    (select  
     CASE WHEN time10 < "Date_Sunrise" OR time10 > "Date_Sunset" THEN False
     WHEN "Date_Sunrise"  <= time10 AND time10 <= "Date_Sunrise" + interval '1:30' THEN True
     WHEN "Date_Sunset" >= time10 AND time10 >= "Date_Sunset" - interval '1:30' THEN True
     ELSE False END
     -- AS Glare
from "DATES" d
where d."Date" = t10.timedate)
--order by timekey

