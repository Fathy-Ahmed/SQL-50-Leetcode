select 
    b.category,
    COUNT(case 
              when b.category = 'Low Salary'     and a.income < 20000 then 1
              when b.category = 'Average Salary' and a.income between 20000 and 50000 then 1
              when b.category = 'High Salary'    and a.income > 50000 then 1
          end) as accounts_count
from (values ('Low Salary'), ('Average Salary'), ('High Salary')) AS b(category)
cross join Accounts a
group by b.category;
