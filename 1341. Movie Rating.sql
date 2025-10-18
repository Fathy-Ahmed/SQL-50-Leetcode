select *
from (
    select top(1) u.name as results
    from MovieRating m join Users u on m.user_id = u.user_id
    group by u.name
    order by count(*) desc, u.name
) as top_user

union all

select *
from (   select top(1) m.title as results
    from MovieRating r join Movies m on r.movie_id = m.movie_id
    where r.created_at >= '2020-02-01' and r.created_at < '2020-03-01'
    group by m.title
    order by avg(r.rating*1.0) desc, m.title
) as top_movie;