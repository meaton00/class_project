
-- ALTER TABLE weather ADD COLUMN timekey bigint;

UPDATE weather AS w
SET
    timekey = t.timekey 
    FROM time10 t
    where t.timestamp10 = weather_timestamp10
;
