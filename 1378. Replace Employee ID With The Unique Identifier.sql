select eUNI.unique_id, e.name
from Employees e
left join EmployeeUNI eUNI
on e.id = eUNI.id