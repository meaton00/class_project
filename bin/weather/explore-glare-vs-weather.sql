select t10.timekey, "Date_Sunrise","Date_Sunset", t10.timestamp10, glare, weather_conds_std
from "DATES" d, time10 t10
join weather_all w on weatherkey = t10.timekey
where d."Date" = t10.timedate
and glare = True