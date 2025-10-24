select p.product_name, sum(o.unit) as unit
from Products p
join Orders o on o.product_id = p.product_id
where o.order_date like '2020-02-%'
group by p.product_name
having sum(o.unit) >= 100;