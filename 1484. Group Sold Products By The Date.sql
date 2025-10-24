select sell_date, 
       count(distinct product) as num_sold,
       STRING_AGG(product, ',') within group (order by product) as products
from (
    select distinct sell_date, product from Activities
) as distinct_products
group by sell_date
order by sell_date;


