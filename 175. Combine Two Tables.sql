select firstName,lastName,city,state 
from Person p 
left outer join Address a
on p.personId=a.personId;