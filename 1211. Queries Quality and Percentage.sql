-- First sol using subquery
    -- select query_name,
    --         ROUND(AVG(rating*1.0/position), 2)  quality,
    --         ROUND((select count(*) from Queries where q.query_name = query_name and rating < 3)*100.0/count(*), 2) poor_query_percentage
    -- from Queries q
    -- group by query_name


-- Second sol using CASE
    select query_name,
            ROUND(AVG(rating*1.0/position), 2) quality,
            ROUND(SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END)*100.0/count(*), 2) poor_query_percentage
    from Queries q
    group by query_name