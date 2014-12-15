ALTER TABLE time10 ADD COLUMN timestamp10 timestamp;

UPDATE time10
SET
timestamp10 = (timedate || ' ' || time10)::timestamp
;