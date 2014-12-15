select weather_date, count(distinct weather_conds_std)
from weather
group by weather_date
having count(distinct weather_conds_std) > 1
order by weather_date
;

-- most days have changes, so can't base glare update on overall day value
-- other non-saved versions of query had examples of what these were -- lots of cloudy - clear pairings