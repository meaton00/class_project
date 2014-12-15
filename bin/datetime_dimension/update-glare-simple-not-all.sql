--glare update, revised to join to weather_all

update time10 t10
set
glare = False
from weather_all w
where t10.timekey = w.weatherkey
and weather_conds_std <> '2-Clear'
and glare = True
;