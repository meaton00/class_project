-- set glare to be sunrise +1.5 hours, and sunset - 1.5 hours

select 
-- , 
CASE WHEN time10 < "Date_Sunrise" OR time10 > "Date_Sunset" THEN 'False1'
     WHEN "Date_Sunrise"  <= time10 AND time10 <= "Date_Sunrise" + interval '1:30' 
        AND (min(weather_conds_std) IS NULL) THEN 'TrueAM'
     
     WHEN "Date_Sunrise"  <= time10 AND time10 <= "Date_Sunrise" + interval '1:30' 
        AND (min(weather_conds_std) = '2-Clear' OR min(weather_conds_std) IS NULL) THEN 'TrueAM'
     WHEN "Date_Sunset" >= time10 AND time10 >= "Date_Sunset" - interval '1:30' 
        AND (min(weather_conds_std) = '2-Clear' OR min(weather_conds_std) IS NULL) THEN 'TruePM'
     ELSE 'False2' END
     AS newglare,
     glare
     --,
     --CASE WHEN weather_conds_std <> '2-Clear' AND glare = True THEN 'NowFalse' ELSE 'Same' END AS NewGlare
     -- set the conditions, add condition that if any weather false then whole glare is also false 
     -- sunrise any date < noon group contains any not clear, set to false; sunset any date > noon with not clear, set to false 
     --,
    ,t10.time10, "Date", "Date_Sunrise", "Date_Sunset", max(weather_conds_std), count(*)
from "DATES" d
join time10 t10 on d."Date" = t10.timedate
left outer join weather w on t10.timestamp10 = w.weather_timestamp10 
-- where glare = True
-- and time10 < '12:00:00'
where glare is True
-- and newglare <> 'False2'
group by t10.time10, d."Date_Sunrise", d."Date_Sunset", d."Date", glare 
order by --newglare, 
      "Date", t10.time10

-- CASE WHEN boolval THEN 'value if true' ELSE 'value if false' END

-- problem -- still only updates the one row not the entire range