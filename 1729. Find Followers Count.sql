select user_id, count(follower_id) AS followers_count
from followers
group by user_id