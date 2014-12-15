

select 
traffic_conf_score, count(*)
--t.timekey, traffic_timestamp, tmc_crossing, tmc_inout, avg(traffic_speed) as avg_speed, max(traffic_speed), min(traffic_speed), max(traffic_avg_speed) as max_avg_speed, 
-- min(traffic_avg_speed) as min_avg_speed , max(traffic_ref_speed) as max_ref_speed, min(traffic_ref_speed) as min_ref_speed, count(*) as obs
from traffic t, tmc tm
where t.tmc_id = tm.tmc_id
-- and traffic_conf_score > 10
-- group by traffic_speed
-- order by count(*) desc
group by traffic_conf_score
order by traffic_conf_score
;