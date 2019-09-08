-- table name INS_3
/*
D3_NAICS	Sector	RowNum	id
311	Food  	1	1
312	Beverage and tobacco products	2	2
313	Textile mills	3	3
314	Textile product mills	4	4
315	Apparel  	5	5
316	Leather and allied products	6	6
321	Wood products	7	7
322	Paper  	8	8
323	Printing	9	9
324	Petroleum and coal products	10	10
325	Chemicals	11	11
326	Plastics and rubber products	12	12
327	Nonmetallic minerals	13	13
331	Primary metals	14	14
332	Fabricated metals	15	15
333	Machinery	16	16
334	Computers and electronics	17	17
335	Electrical equipment	18	18
336	Transportation equipment	19	19
337	Furniture	20	20
*/

set @id = 0
update INS_3
set @id = ins_3.id = @id+1
go
-----------------------------------------------------------
-- when the dataset contains millions of millions rows, duplications may occur because the processing is runing in parallel. 
-- to solve this use maxdop 1 to limit the processor to one. 
declare @id int 
set @id = 0
update INS_3
set @id = ins_3.id = @id+1
option (MAXDOP 1)
go
--another way is to run the block of code within a transaction
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE

BEGIN TRANSACTION
	declare @id int 
	set @id = 0
	update INS_3
	set @id = ins_3.id = @id+1
COMMIT TRANSACTION 
-------------------------------------------------------------

--another approach using CTE (common table expression)
with INS_3Copy as (
select ROW_NUMBER() over (order by (select null)) as rn,* 
from INS_3)
update INS_3Copy set id=rn
option (MAXDOP 1)
