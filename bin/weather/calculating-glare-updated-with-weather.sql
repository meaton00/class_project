-- set glare to be sunrise +1.5 hours, and sunset - 1.5 hours

select t10.timekey, time10, timestamp10, "Date_Sunrise", "Date_Sunset"
, 
--CASE WHEN time10 < "Date_Sunrise" OR time10 > "Date_Sunset" THEN 'False1'
--     WHEN "Date_Sunrise"  <= time10 AND time10 <= "Date_Sunrise" + interval '1:30' THEN 'TrueAM'
 --    WHEN "Date_Sunset" >= time10 AND time10 >= "Date_Sunset" - interval '1:30' THEN 'TruePM'
  --   ELSE 'False2' END
  --   AS glare
     glare,
     CASE WHEN weather_conds_std <> 'Clear' AND glare = True THEN 'NowFalse' ELSE 'Same' END AS NewGlare
     -- set the conditions, add condition that if any weather false then whole glare is also false 
     -- sunrise any date < noon group contains any not clear, set to false; sunset any date > noon with not clear, set to false 
     ,weather_conds_std
from "DATES" d
join time10 t10 on d."Date" = t10.timedate
left outer join weather w on t10.timestamp10 = w.weather_timestamp10 
where glare = True
order by timekey

-- CASE WHEN boolval THEN 'value if true' ELSE 'value if false' END