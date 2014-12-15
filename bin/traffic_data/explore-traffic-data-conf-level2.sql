-- max speed 75, min 0 (75)
-- max avg speed 60, min avg 10
-- max reference 60, min ref 30
-- modal speed 35 (26218)


select 
-- traffic_speed, count(*)
t.timekey, traffic_timestamp, tmc_crossing, tmc_inout, avg(traffic_speed) as avg_speed, max(traffic_speed), min(traffic_speed), 
-- max(traffic_avg_speed) as max_avg_speed, min(traffic_avg_speed) as min_avg_speed , max(traffic_ref_speed) as max_ref_speed, 
-- min(traffic_ref_speed) as min_ref_speed, 
count(*) as obs
from traffic t
join tmc tm on t.tmc_id = tm.tmc_id
left outer join time10 t10 on t10.timekey = t.timekey 
where traffic_conf_score >=  20
-- group by traffic_speed
-- order by count(*) desc
group by t.timekey, traffic_timestamp, tmc_crossing, tmc_inout
order by t.timekey, traffic_timestamp, tmc_crossing, tmc_inout
;