SELECT
	datum AS Date,
	extract(year FROM datum) AS Year,
	extract(month FROM datum) AS Month,
	-- Localized month name
	to_char(datum, 'TMMonth') AS MonthName,
	extract(day FROM datum) AS Day,
	extract(doy FROM datum) AS DayOfYear,
	-- Localized weekday
	to_char(datum, 'TMDay') AS WeekdayName,
	-- ISO calendar week
	extract(week FROM datum) AS CalendarWeek,
	to_char(datum, 'dd. mm. yyyy') AS FormattedDate,
	'Q' || to_char(datum, 'Q') AS Quartal,
	to_char(datum, 'yyyy/"Q"Q') AS YearQuartal,
	to_char(datum, 'yyyy/mm') AS YearMonth,
	-- ISO calendar year and week
	to_char(datum, 'iyyy/IW') AS YearCalendarWeek,
	-- Weekend
	CASE WHEN extract(isodow FROM datum) IN (6, 7) THEN 'Weekend' ELSE 'Weekday' END AS Weekend,
	-- Fixed holidays 
        -- for America - this is Oct 2013 thru Sep 2014
        CASE WHEN to_char(datum, 'MMDD') IN ('0101', '0120', '0217', '0526', '0704', '0901', '1014', '1111', '1128','1225')
		THEN 'Holiday' ELSE 'No holiday' END
		AS AmericanHoliday,
	CASE WHEN to_char(datum, 'MMDD') BETWEEN '1001' AND '1016' THEN 'FedGov Shutdown'
	     WHEN to_char(datum, 'MMDD') IN ('1126', '0103', '0205','0226') THEN 'FedGov OpenLeave'
		 WHEN to_char(datum, 'MMDD') IN ('1209', '0122', '0214', '0304') THEN 'FedGov 2hrdelay'
		 WHEN to_char(datum, 'MMDD') IN ('1210', '0121', '0213', '0303', '0317') THEN 'FedGov Closed'
		 ELSE 'Open' END
		 AS FedGovStatus,
	-- Some periods of the year, adjust for your organisation and country
	CASE WHEN to_char(datum, 'MMDD') BETWEEN '0701' AND '0831' THEN 'Summer break'
	     WHEN to_char(datum, 'MMDD') BETWEEN '1115' AND '1225' THEN 'Christmas season'
	     WHEN to_char(datum, 'MMDD') > '1225' OR to_char(datum, 'MMDD') <= '0106' THEN 'Winter break'
		ELSE 'Normal' END
		AS Period,
	-- ISO start and end of the week of this date
	datum + (1 - extract(isodow FROM datum))::integer AS CWStart,
	datum + (7 - extract(isodow FROM datum))::integer AS CWEnd,
	-- Start and end of the month of this date
	datum + (1 - extract(day FROM datum))::integer AS MonthStart,
	(datum + (1 - extract(day FROM datum))::integer + '1 month'::interval)::date - '1 day'::interval AS MonthEnd
FROM (
	-- Sample had multiple years - There are 3 leap years in this range, so calculate 365 * 10 + 3 records
	SELECT '2013-10-01'::DATE + sequence.day AS datum
	FROM generate_series(0,364) AS sequence(day)
	GROUP BY sequence.day
     ) DQ
ORDER BY 1
