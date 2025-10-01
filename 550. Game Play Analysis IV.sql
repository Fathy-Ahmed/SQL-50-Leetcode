-- with first_login as (
--     select player_id, min(event_date) as first_date
--     from Activity 
--     group by player_id
--)
-- select round(
--     count(
--         distinct f.player_id)*1.0
--         /(select count(distinct player_id) from Activity),
--          2) as fraction
-- from first_login f
-- join Activity a 
--     on a.player_id = f.player_id 
--     and a.event_date = DATEADD(day, 1, f.first_date)


with first_login as (
    select player_id, min(event_date) as first_date
    from Activity
    group by player_id
)
, flagged as (
    select f.player_id,
           case when exists (
                select 1 
                from Activity a 
                where a.player_id = f.player_id
                  and a.event_date = dateadd(day, 1, f.first_date)
           ) then 1 else 0 end as has_next_day
    from first_login f
)
select round(
           sum(has_next_day) * 1.0 / count(*), 
           2
       ) as fraction
from flagged;
