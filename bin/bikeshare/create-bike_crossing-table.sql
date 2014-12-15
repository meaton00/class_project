-- create new table with only the crossing data

CREATE TABLE bike_crossing
AS
(select * from bikeshare where bike_crossing in ('IN', 'OUT'));

