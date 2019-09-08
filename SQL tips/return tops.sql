select top 10 * from Business order by Annual_Payroll desc

-- select top 5 to 10 annual payroll
select * from Business
order by Annual_Payroll desc
offset 5 rows
FETCH NEXT 5 ROW ONLY;

--select highest annual payroll in each manufacturer sector
select b.*, i.*
from Business b
inner join INS_3 i on b.D3_NAICS = i.D3_NAICS
where Annual_Payroll in (select max(Annual_Payroll) from Business group by D3_NAICS)
