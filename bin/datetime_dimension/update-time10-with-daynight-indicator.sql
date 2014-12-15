ALTER TABLE time10 ADD COLUMN time_day boolean;

UPDATE time10 AS t
SET
    time_day = True
	FROM "DATES" AS d
	WHERE t.timedate = d."Date"
	AND t.time10 >= d."Date_Sunrise"
	AND t.time10 < d."Date_Sunset"
	;

UPDATE time10
SET
    time_day = False
    WHERE time_day is null;