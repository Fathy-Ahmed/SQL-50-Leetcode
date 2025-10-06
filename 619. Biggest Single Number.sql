-- First solution using CTE (Common Table Expression)
    -- with cnts as (select num, count(num) as cnt
    -- from MyNumbers
    -- group by num)

    -- select max(c.num) as num
    -- from cnts c
    -- where c.cnt = 1;


-- Second solution using Inline query
select(
    select top(1) num
    from MyNumbers
    group by num
    having count(*) = 1
    order by num desc
) as num