-- from visual inspection of station names and station codes, appears there is
-- usable patter to determine which trips crossed from VA to DC/MD or vice versa;
-- email to capital bikeshare to confirm not answered

-- find bike crossings, inbound
select bike_start_station_code, bike_end_station_code, count(*)
from bikeshare
where bike_start_station_code < '31100' AND bike_end_station_code >= '31100'
group by bike_start_station_code, bike_end_station_code 
order by bike_start_station_code

-- 4089 IN pairs, total rows = 45,260

-- find bike crossings, outbound
select bike_start_station_code, bike_end_station_code, count(*)
from bikeshare
where bike_start_station_code >= '31100' AND bike_end_station_code < '31100'
group by bike_start_station_code, bike_end_station_code 
order by bike_start_station_code

-- 3693 OUT pairs, total rows = 38,747; combined crossings is 2.9% of total dataset (crossings = 84007)