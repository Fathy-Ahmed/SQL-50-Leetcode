-- First solution using subquery
    -- select v.customer_id, count(*) as count_no_trans
    -- from Visits v
    -- where v.visit_id not in (select visit_id from Transactions)
    -- group by v.customer_id

----------------------------------------------------------------------

-- Second solution using joining

    -- select v.customer_id, count(*) as count_no_trans
    -- from Visits v
    -- left join Transactions t on v.visit_id = t.visit_id
    -- where t.visit_id is null
    -- group by v.customer_id

----------------------------------------------------------------------

-- THird solution using NOT EXISTS

    select v.customer_id, count(*) as count_no_trans
    from Visits v
    where not exists(
        select 1
        from Transactions t
        where t.visit_id = v.visit_id
    )
    group by v.customer_id