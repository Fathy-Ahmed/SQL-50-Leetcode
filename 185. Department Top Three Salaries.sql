select d.name as Department, e.name as Employee, e.salary as Salary
from Employee e
join Department d on d.id = e.departmentId 
where e.salary in (
    select distinct top(3) salary
    from Employee
    where departmentId = d.id
    order by salary desc
);