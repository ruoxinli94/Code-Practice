-- using mod function to fetch the even or odd records 
--mysql
--even
Select field1 from (Select rownumber,field1 from tbl) where mod(rownumber,2)=0
--odd
Select field1 from (Select rownumber,field1 from tbl) where mod(rownumber,2)=1


--get the rownumber from window function
--alternative as below/ use the table INS_3
-- mod is not build in function in MS sql, use the % operator instead
Select Sector from 
(Select row_number() over (order by (select null)) rn ,Sector 
from INS_3) tbl 
where rn%2 = 1
go
