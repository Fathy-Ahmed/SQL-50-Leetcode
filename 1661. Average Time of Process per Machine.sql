select a.machine_id, round(avg(b.timestamp-a.timestamp), 3) as processing_time
from Activity a
join Activity b
on a.machine_id = b.machine_id and a.process_id = b.process_id and a.activity_type = 'start' and b.activity_type = 'end'
group by a.machine_id;

-- anthor solution

    -- select machine_id,
    -- round(sum(case when activity_type='start' then timestamp*-1 else timestamp end)*1.0
    -- / (select count(distinct process_id)), 3) as processing_time
    -- from Activity
    -- group by machine_id;