select g.timekey, glare, glarepotential, traffic_timestamp, tmc_crossing, avg(traffic_avg_speed)
from glare_explore g
join traffic t on t.timekey = g.timekey
join tmc tm on tm.tmc_id = t.tmc_id
where glarepotential like 'True%'
group by g.timekey, glare, glarepotential, traffic_timestamp, tmc_crossing