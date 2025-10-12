-- using 2 join
    -- select distinct l1.num as ConsecutiveNums
    -- from Logs l1
    -- join logs l2 on l1.num = l2.num and l1.id = l2.id+1
    -- join logs l3 on l2.num = l3.num and l2.id = l3.id+1;


-- using Window Function
select distinct num as ConsecutiveNums
from (
    select num,
           lag(num, 1) over (order by id) as prv1,
           lag(num, 2) over (order by id) as prv2
    from Logs
) as t
where num = prv1 and num = prv2;