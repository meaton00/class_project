

WITH upd AS (
	SELECT weather_date, weather_hour_stump, weather_temp, weather_conds_std, weather_wind_speed, weather_wind_gusts, weather_viz, 
          weather_precip, weather_rain, weather_snow, weather_fog
	FROM weather_all 
	where COALESCE(weather_rain, ' ') > ' '  
	
	)
    UPDATE weather_all wa2
     SET (weather_temp, weather_conds_std, weather_wind_speed, weather_wind_gusts, weather_viz, 
          weather_precip, weather_rain, weather_snow, weather_fog) =  
          (u.weather_temp, u.weather_conds_std, u.weather_wind_speed, u.weather_wind_gusts, u.weather_viz, u.weather_precip, 
                     u.weather_rain, u.weather_snow, u.weather_fog)
           FROM upd u
           WHERE wa2.weather_date = u.weather_date
              AND wa2.weather_hour_stump = u.weather_hour_stump
              
             