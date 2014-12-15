select -- t10.timekey, t10.timestamp10, 
       t10.timedate, date_trunc('hour', t10.time10) AS hour_stump,  bool_or(t10.glare) as maxglare, max(weather_temp) as temp, 
       max(weather_conds_std) as conds_std, max(weather_wind_speed) as wind_speed,
       max(weather_wind_gusts) as gusts, max(weather_viz) as viz, max(weather_precip) as precip, 
       bool_or(weather_rain) as rain, bool_or(weather_snow) as snow, bool_or(weather_fog) as fog
from time10 t10
left outer join weather w on t10.timekey = w.timekey
group by t10.timedate, date_trunc('hour', t10.time10)
order by t10.timedate, date_trunc('hour', t10.time10)
;

-- look at set of rows with same date + hour_stump (6 values);
-- if any row in this set has existing associated row (by timekey) in weather data (note:  all have at least one)
--     create new weather row for all timekeys in this set that not yet exist (have no associated weather record), and 
--     copy the weather from that same date + hour_stump to the newly created rows
--        note a few cases have more than one in the hour; in this case select max, bool_or for boolean