
select 
-- traffic_speed, count(*)
-- tmc_crossing, tmc_inout, avg(traffic_speed) as avg_speed, max(traffic_speed), min(traffic_speed), max(traffic_avg_speed) as max_avg_speed, 
-- min(traffic_avg_speed) as min_avg_speed , max(traffic_ref_speed) as max_ref_speed, min(traffic_ref_speed) as min_ref_speed, count(*) as obs
tmc_crossing, tmc_inout, traffic_speed, traffic_timestamp, count(*)
from traffic t, tmc tm
where t.tmc_id = tm.tmc_id
and traffic_speed = 0
and traffic_conf_score > 10
-- group by traffic_speed
-- order by count(*) desc
group by tmc_crossing, tmc_inout, traffic_speed, traffic_timestamp
order by tmc_crossing, tmc_inout, traffic_speed, traffic_timestamp
;