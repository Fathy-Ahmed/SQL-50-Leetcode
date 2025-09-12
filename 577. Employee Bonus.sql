-- first solution using left join
    -- select e.name, b.bonus
    -- from Employee e
    -- left join Bonus b on e.empId = b.empId
    -- where b.bonus < 1000 or b.bonus is null;


-- second solution join to get emps that have bonus and union emps that don't have (optimize)
    select e.name, b.bonus
    from Employee e
    join Bonus b on e.empId = b.empId and b.bonus < 1000

    union all

    select e.name, null as bonus
    from Employee e
    where not exists(
        select 1 from Bonus b where b.empId = e.empId
    );