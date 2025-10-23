delete p from Person p
join (
    select email, min(id) mn_id 
    from Person 
    group by email
) keep_table
    on p.email = keep_table.email
where p.id <> keep_table.mn_id; -- !=