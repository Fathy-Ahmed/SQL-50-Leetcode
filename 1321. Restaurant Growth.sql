select c1.visited_on, SUM(c2.daily_amount) amount, round(avg(c2.daily_amount*1.0), 2) average_amount
from (
    select visited_on, SUM(amount) daily_amount from Customer group by visited_on
) c1
join (
    select visited_on, SUM(amount) daily_amount from Customer group by visited_on
) c2 
    on c2.visited_on between dateadd(day, -6, c1.visited_on) and c1.visited_on
group by c1.visited_on
having count(distinct c2.visited_on) = 7
order by c1.visited_on;
