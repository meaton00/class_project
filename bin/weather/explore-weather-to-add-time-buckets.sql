-- shows both missing values and times where there are two values
select t10.timekey, w.timekey
from weather w
right outer join time10 t10 on t10.timekey = w.timekey
;

-- example of update query with insert
WITH upd AS (
  UPDATE employees SET sales_count = sales_count + 1 WHERE id =
    (SELECT sales_person FROM accounts WHERE name = 'Acme Corporation')
    RETURNING *
)
INSERT INTO employees_log SELECT *, current_timestamp FROM upd;

-- example of insert from query
INSERT INTO films SELECT * FROM tmp_films WHERE date_prod < '2004-05-07';