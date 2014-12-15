select t10.timekey, timedate, time10, timestamp10, 
      "Date_DOW", "Date_Holiday","Date_FedGovStatus", 
      time_day AS daytime, glare, 
      tmc_crossing, tmc_inout, max(traffic_conf_score) as conf_score, avg(traffic_speed) as avg_speed,
      bool_or(weather_rain) as rain, bool_or(weather_snow) as snow, bool_or(weather_fog) as fog,
      max(weather_temp) as temp, max(weather_conds_std) as conds_std, 
      max(weather_viz) as visibility, max(weather_wind_speed) as wind_speed, max(weather_wind_gusts) as wind_gusts, 
      max(weather_precip) as precip,
      count(*) as obs
from traffic t
join tmc tm on t.tmc_id = tm.tmc_id
left outer join time10 t10 on t10.timekey = t.timekey
left outer join weather w on t10.timekey = w.timekey 
left outer join "DATES" d on d."Date" = t10.timedate
-- where  "Date_DOW" <> 'Sat' AND "Date_DOW" <> 'Sun' -- not needed as join to traffic removes all weekend days
where traffic_conf_score >=  20
--and tmc_crossing = 'Key' and tmc_inout = 'Out'
group by t10.timekey, timedate, time10, timestamp10, 
      "Date_DOW", "Date_Holiday","Date_FedGovStatus", 
      time_day, glare, 
      tmc_crossing, tmc_inout
order by t10.timekey
;
