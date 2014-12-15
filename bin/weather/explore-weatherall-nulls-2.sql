SELECT weather_date, weather_hour_stump, weather_temp, weather_conds_std, weather_wind_speed, weather_wind_gusts, weather_viz, 
          weather_precip, weather_rain, weather_snow, weather_fog
	FROM weather_all 
	where COALESCE(weather_rain, ' ') > ' '  