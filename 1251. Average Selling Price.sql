select p.product_id, ISNULL(Round(SUM(p.price * u.units)*1.0 / SUM(u.units), 2), 0) as average_price
from Prices p
left join UnitsSold u 
on 
    p.product_id = u.product_id 
    and u.purchase_date BETWEEN p.start_date and p.end_date
group by p.product_id