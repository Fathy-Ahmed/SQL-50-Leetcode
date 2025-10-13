--
    -- select p1.product_id, p1.new_price as price
    -- from Products p1
    -- where p1.change_date = (
    --     select max(p2.change_date)
    --     from Products p2
    --     where p2.product_id = p1.product_id
    --         and p2.change_date <= '2019-08-16'
    -- )

    -- union

    -- select distinct product_id, 10 as price
    -- from Products
    -- where product_id not in (
    --     select product_id
    --     from Products
    --     where change_date <= '2019-08-16'
    -- );


-- using OUTER APPLY
select p.product_id, isnull(latest.new_price, 10) as price
from (
    select distinct product_id
    from Products
) p
outer apply(
    select top(1) new_price
    from Products
    where product_id = p.product_id
        and change_date <= '2019-08-16'
    order by change_date desc
) as latest;


