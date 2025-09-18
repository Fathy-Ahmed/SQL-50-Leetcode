select s.user_id,
      Round((CAST(SUM(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END) AS FLOAT) / NULLIF(COUNT(*), 0)), 2) AS confirmation_rate
from Signups s
left join Confirmations c on s.user_id = c.user_id
group by s.user_id;