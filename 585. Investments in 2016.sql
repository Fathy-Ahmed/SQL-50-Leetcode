-- select round(sum(tiv_2016), 2) tiv_2016 
-- from Insurance i1
-- join (
--     select tiv_2015 from Insurance group by tiv_2015 having count(*) > 1
-- ) same_tiv on i1.tiv_2015 = same_tiv.tiv_2015
-- join (
--     select lat, lon from Insurance group by lat, lon having count(*) = 1
-- ) unique_loc on i1.lat = unique_loc.lat and i1.lon = unique_loc.lon;


-------------------------------------------------------------------

with Aggregated as (
    select 
        tiv_2015,
        lat,
        lon,
        tiv_2016,
        count(*) over (partition  by tiv_2015)  cnt_tiv2015,
        count(*) over (partition by lat, lon)  cnt_location
    from Insurance
)
select 
    round(sum(tiv_2016), 2)  tiv_2016
from Aggregated
where cnt_tiv2015 > 1
  and cnt_location = 1;