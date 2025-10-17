-- if id is odd select next if not fount select itself and if even select before
    -- select s1.id,
    -- (case
    -- when s1.id%2=0 then isnull((select s2.student from Seat s2 where s2.id = s1.id-1), s1.student)
    -- else isnull((select s2.student from Seat s2 where s2.id = s1.id+1), s1.student) end
    -- ) 
    -- as student
    -- from Seat s1
    -- order by s1.id;



-- using joining
    select s1.id,
        coalesce(s2.student, s1.student) as student
    from Seat s1
    left join Seat s2
        on s2.id = case
                        when s1.id%2=0 then s1.id-1
                        else s1.id+1
                    end
    order by s1.id;



            