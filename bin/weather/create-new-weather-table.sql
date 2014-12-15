-- create result set with new weather table of 52,560 rows

select t10.timekey, t10.timestamp10, t10.timedate, t10.time10, date_trunc('hour', t10.time10) AS hour_stump, t10.glare, 
       max(weather_temp) as w_temp, 
       max(weather_conds_std) as w_conds_std, max(weather_wind_speed) as w_wind_speed,
       max(weather_wind_gusts) as w_gusts, max(weather_viz) as w_visibility, max(weather_precip) as w_precip, 
       bool_or(weather_rain) as w_rain, bool_or(weather_snow) as w_snow, bool_or(weather_fog) as w_fog
from time10 t10
left outer join weather w on t10.timekey = w.timekey
group by t10.timekey, t10.timestamp10, t10.timedate, t10.time10, date_trunc('hour', t10.time10), t10.glare
order by t10.timekey
;
