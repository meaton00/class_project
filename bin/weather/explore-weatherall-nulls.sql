SELECT * --weatherkey
	FROM weather_all as wa1
	where COALESCE(wa1.weather_rain, ' ') > ' ' 
order by weatherkey

	-- 11128 vs 10699; ignores neg values