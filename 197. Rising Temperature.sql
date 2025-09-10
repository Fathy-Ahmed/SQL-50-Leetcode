-- First solution using joining
    -- select w1.id
    -- from Weather w1
    -- join Weather w2 
    -- on datediff(day, w2.recordDate, w1.recordDate) = 1
    -- where w1.temperature > w2.temperature


-- Second solution using subquery
    select w1.id
    from Weather w1
    where w1.temperature > (
        select w2.temperature
        from Weather w2
        where w2.recordDate = dateadd(day, -1, w1.recordDate)
    )
    

    

