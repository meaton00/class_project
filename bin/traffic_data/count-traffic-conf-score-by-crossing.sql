select tmc_crossing, tmc_inout, traffic_conf_score, count(traffickey)
from tmc tm, traffic t
where tm.tmc_id = t.tmc_id
group by tmc_crossing, tmc_inout, traffic_conf_score
order by tmc_crossing, tmc_inout, traffic_conf_score
;