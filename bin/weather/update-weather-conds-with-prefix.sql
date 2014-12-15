-- ALTER TABLE weather ADD COLUMN weather_score int;

UPDATE weather
SET
weather_conds_std = '2-Clear'  where weather_conds_std = 'Clear'
;

select weather_conds_std, count(*)
from weather
group by weather_conds_std
order by weather_conds_std desc
;