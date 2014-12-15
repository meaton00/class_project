
update weather_all
set
weather_fog = 'f'
where COALESCE(weather_fog, ' ') < ' '
and weather_fog <> '-9999'
;
-- ALTER TABLE weather_all ALTER COLUMN weather_fog TYPE boolean USING cast(weather_fog AS boolean);

