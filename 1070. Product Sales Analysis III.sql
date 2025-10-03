with first_years as (
    select product_id, min(year) first_year from Sales group by product_id
)

select s.product_id, f.first_year, s.quantity, s.price
from first_years f
join Sales s
on f.product_id = s.product_id and f.first_year = s.year