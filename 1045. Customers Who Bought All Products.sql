-- with productCount as (
--     select count(*) cnt from Product  
-- )
-- select customer_id
-- from Customer
-- group by customer_id
-- having count(distinct product_key) = (select cnt from productCount)

-------------------------------------------------------------------------------

-- select customer_id
-- from Customer
-- group by customer_id
-- having count(distinct product_key) = (select count(*) from Product)

-------------------------------------------------------------------------------

declare @totalProducts int;
select @totalProducts = count(*) from Product;
select customer_id
from Customer
group by customer_id
having count(distinct product_key) = @totalProducts;