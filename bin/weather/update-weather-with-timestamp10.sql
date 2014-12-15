ALTER TABLE weather ADD COLUMN weather_timestamp10 timestamp;

UPDATE weather
SET
weather_timestamp10 = (weather_date || ' ' || weather_time_std)::timestamp
;