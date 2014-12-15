-- THIS IS THE ONE USED TO BUILD THE DATES TABLE

SELECT
	to_char(datum, 'J') AS DateKey,
	datum AS Date,
	to_char(datum, 'Dy') AS Date_DOW,
	to_char(datum, 'Mon') AS Date_Month,
	CASE WHEN to_char(datum, 'MMDD') BETWEEN '1001' AND '1102' OR to_char(datum, 'MMDD') BETWEEN '0310' AND '0930' THEN 'EDT'
	     WHEN to_char(datum, 'MMDD') = '1103' THEN 'EST1'
		 WHEN to_char(datum, 'MMDD') BETWEEN '1104' AND '1231' OR to_char(datum, 'MMDD') BETWEEN '0101' AND '0308' THEN 'EST'
		 WHEN to_char(datum, 'MMDD') = '0309' THEN 'EDT1'
		 ELSE 'Oops' END
		 AS Date_DS_Indicator,
	'Q' || to_char(datum, 'Q') AS Date_Quarter,
	CASE WHEN to_char(datum, 'MMDD') IN ('0101', '0120', '0217', '0526', '0704', '0901', '1014', '1111', '1128','1225')
		THEN 'True' ELSE 'False' END
		AS Date_Holiday,
	CASE WHEN to_char(datum, 'MMDD') BETWEEN '1001' AND '1016' THEN 'Shutdown'
	     WHEN to_char(datum, 'MMDD') IN ('1126', '0103', '0205','0226') THEN 'OpenLibLeave'
		 WHEN to_char(datum, 'MMDD') IN ('1209', '0122', '0214', '0304') THEN '2HrDelay'
		 WHEN to_char(datum, 'MMDD') IN ('1210', '0121', '0213', '0303', '0317') THEN 'Closed'
		 WHEN to_char(datum, 'MMDD') IN ('0101', '0120', '0217', '0526', '0704', '0901', '1014', '1111', '1128','1225') THEN 'Closed'
		 ELSE 'Open' END
		 AS Date_FedGovStatus,
	-- create empty placeholder columns for sunrise and sunset
	'00:00:00' AS Date_Sunrise,
	'00:00:00' AS Date_Sunset
	
FROM (
	SELECT '2013-10-01'::DATE + sequence.day AS datum
	FROM generate_series(0,364) AS sequence(day)
	GROUP BY sequence.day
     ) DQ
ORDER BY 1
