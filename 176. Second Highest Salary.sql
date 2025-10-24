declare @max_salary int;
select @max_salary = max(salary) from Employee;

select 
    (select max(salary)
     from Employee
     where salary < @max_salary)  SecondHighestSalary;
	