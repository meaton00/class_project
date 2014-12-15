ALTER TABLE traffic ADD COLUMN timekey bigint;

UPDATE traffic AS t
SET
    timekey = t10.timekey 
    FROM time10 t10
    where t10.timestamp10 = traffic_timestamp
;

