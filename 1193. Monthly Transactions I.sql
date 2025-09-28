-- select 
--     FORMAT(trans_date, 'yyyy-MM') as month,
--     country,
--     count(*) as trans_count,
--     SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) as approved_count,
--     SUM(amount) as trans_total_amount,
--     SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) as approved_total_amount

-- from Transactions t
-- group by FORMAT(trans_date, 'yyyy-MM'), country


-- More optimized query for performance

-- CONCAT -> Combine the year and month
-- CAST -> Converts the numeric month into a string
-- RIGHT -> Takes the rightmost 2 characters

select 
    CONCAT(YEAR(trans_date), '-', RIGHT('0' + CAST(MONTH(trans_date) AS VARCHAR(2)), 2)) month,
    country,
    count(*) as trans_count,
    SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) approved_count,
    SUM(amount) trans_total_amount,
    SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) approved_total_amount

from Transactions t
group by 
    YEAR(trans_date),
    MONTH(trans_date),
    country