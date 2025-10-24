select *
from Users
where 
    mail collate Latin1_General_BIN like '%@leetcode.com'
    and mail collate Latin1_General_BIN like '[A-Za-z]%@leetcode.com'
    and mail not like '%@%@%'
    and left(mail, charindex('@', mail) - 1) not like '%[^A-Za-z0-9._-]%'
    