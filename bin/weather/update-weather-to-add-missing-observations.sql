select t10.timekey, t10.timestamp10, w.*
from weather w
right outer join time10 t10 on t10.timekey = w.timekey
order by t10.timekey
;

--select 
--from weather
--order by weatherkey;