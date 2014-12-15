-- creates dataset output for use as input to other analyses; creates combined traffic, weather info for one point in time; multiple records for time period as there
-- are multiple crossings; this version adds in traffic incidents

select t10.timekey, timedate, time10, timestamp10, 
      "Date_DOW", "Date_Holiday","Date_FedGovStatus", 
      time_day AS daytime, glare, 
      tm.tmc_crossing, tm.tmc_inout, incident_std_type, incident_duration_min, max(traffic_conf_score) as conf_score, avg(traffic_speed) as avg_speed,
      bool_or(weather_rain) as rain, bool_or(weather_snow) as snow, bool_or(weather_fog) as fog,
      max(weather_temp) as temp, max(weather_conds_std) as conds_std, 
      max(weather_viz) as visibility, max(weather_wind_speed) as wind_speed, max(weather_wind_gusts) as wind_gusts, 
      max(weather_precip) as precip,
      count(*) as obs
from traffic t
join tmc tm on t.tmc_id = tm.tmc_id
left outer join time10 t10 on t10.timekey = t.timekey
left outer join weather_all w on t10.timekey = w.weatherkey 
left outer join "DATES" d on d."Date" = t10.timedate
left outer join incident inc on (inc.incident_timestamp10 = t10.timestamp10) and tm.tmc_crossing = inc.tmc_crossing 
-- where  "Date_DOW" <> 'Sat' AND "Date_DOW" <> 'Sun' -- not needed as join to traffic removes all weekend days
where traffic_conf_score >=  20 --values under 20 are not reliable or were not observed
--and tmc_crossing = 'Key' and tmc_inout = 'Out'
group by t10.timekey, timedate, time10, timestamp10, 
      "Date_DOW", "Date_Holiday","Date_FedGovStatus", 
      time_day, glare, 
      tm.tmc_crossing, tm.tmc_inout, incident_std_type, incident_duration_min
order by t10.timekey
;
