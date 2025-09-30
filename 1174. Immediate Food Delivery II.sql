-- First one using ROW_NUMBER()
    -- with cte as (
    --     select *,
    --         row_number() over (partition by customer_id order by order_date) as rn
    --     from Delivery
    -- )
    -- select 
    --     round(
    --         count(case when order_date = customer_pref_delivery_date then 1 end) * 100.0
    --         / count(*), 2
    --     ) as immediate_percentage
    -- from cte
    -- where rn = 1;


select 
    round(
            count(case when order_date = customer_pref_delivery_date then 1 end) * 100.0
            / count(*), 2
        ) as immediate_percentage
from Delivery d
join (
    select customer_id, min(order_date) as first_order_date
    from Delivery
    group by customer_id
) t
    on d.customer_id = t.customer_id
   and d.order_date = t.first_order_date;