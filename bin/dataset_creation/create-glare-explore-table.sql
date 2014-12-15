-- set glare to be sunrise +1.5 hours, and sunset - 1.5 hours

CREATE TABLE glare_explore
AS
(
select timekey, time10, timestamp10, "Date_Sunrise", "Date_Sunset", glare
, 
CASE WHEN time10 < "Date_Sunrise" OR time10 > "Date_Sunset" THEN 'False1'
     WHEN "Date_Sunrise"  <= time10 AND time10 <= "Date_Sunrise" + interval '1:30' THEN 'TrueAM'
     WHEN "Date_Sunset" >= time10 AND time10 >= "Date_Sunset" - interval '1:30' THEN 'TruePM'
     ELSE 'False2' END
     AS GlarePotential
from "DATES" d
join time10 t10 on d."Date" = t10.timedate
order by timekey
)
