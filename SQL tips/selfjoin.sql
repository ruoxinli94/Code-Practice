declare @flags table
(
	ID INT 
	,CreationDate DATE
	,SendFlag BIT
	,ReceiveFlag BIT
)

insert into @flags (ID, CreationDate, SendFlag, ReceiveFlag)
	select 1,'20160808',0,0
insert into @flags (ID, CreationDate, SendFlag, ReceiveFlag)
	select 2,'20161001',0,0
insert into @flags (ID, CreationDate, SendFlag, ReceiveFlag)
	select 3,'20161126',1,0
insert into @flags (ID, CreationDate, SendFlag, ReceiveFlag)
	select 4,'20161226',1,0
insert into @flags (ID, CreationDate, SendFlag, ReceiveFlag)
	select 5,'20170108',1,0
insert into @flags (ID, CreationDate, SendFlag, ReceiveFlag)
	select 6,'20170310',1,1
insert into @flags (ID, CreationDate, SendFlag, ReceiveFlag)
	select 7,'20170620',1,1
insert into @flags (ID, CreationDate, SendFlag, ReceiveFlag)
	select 8,'20170815',0,1

;with cte1 as 
(
SELECT f.*, ROW_NUMBER() OVER (ORDER BY f.ID) rnk
FROM @flags f 
left JOIN @flags f2 
on f.id + 1 = f2.id 
and f.SendFlag = f2.SendFlag 
and f.ReceiveFlag  = f2.ReceiveFlag
WHERE f2.ID IS NULL
),
cte2 as 
(
SELECT f2.*, ROW_NUMBER() OVER (ORDER BY f2.ID) rnk
FROM @flags f 
RIGHT JOIN @flags f2 
on f.id = f2.id-1
and f.SendFlag = f2.SendFlag 
and f.ReceiveFlag  = f2.ReceiveFlag
WHERE f.ID IS NULL)

select cte2.id as startid, cte1.id as endid,
cte1.SendFlag, cte2.ReceiveFlag
from cte1 inner join cte2
on cte1.rnk = cte2.rnk


