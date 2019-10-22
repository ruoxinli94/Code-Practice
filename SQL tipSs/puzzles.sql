DECLARE @Version TABLE
(
    a int,
    b int,
    c int,
    d int
)
 
INSERT INTO @Version(a, b, c, d)
    SELECT 1,1,1,23
INSERT INTO @Version(a, b, c, d)
    SELECT 1,2,1,1
INSERT INTO @Version(a, b, c, d)
    SELECT 1,2,2,4
INSERT INTO @Version(a, b, c, d)
    SELECT 2,1,1,1
INSERT INTO @Version(a, b, c, d)
    SELECT 3,1,1,2
INSERT INTO @Version(a, b, c, d)
    SELECT 2,1,2,8
INSERT INTO @Version(a, b, c, d)
    SELECT 2,1,3,4
INSERT INTO @Version(a, b, c, d)
    SELECT 2,2,1,2
INSERT INTO @Version(a, b, c, d)
    SELECT 2,2,3,1
INSERT INTO @Version(a, b, c, d)
    SELECT 2,2,4,6
INSERT INTO @Version(a, b, c, d)
    SELECT 2,3,1,7
INSERT INTO @Version(a, b, c, d)
    SELECT 3,2,1,5
--find the latest build for each major version. 
select a,b,c,d from (
select a,b,c,d,ROW_NUMBER() over (partition by a order by 
b desc, c desc, d desc) from @Version)  -- use as many as features in feature
as X(a,b,c,d,latest)
where latest = 1

-------------------------------------------------------------
declare @tbl_Orders table
(
	OrderID CHAR(5) 
	,Step INTEGER 
	,Status CHAR(1) 
)

 
INSERT INTO @tbl_Orders(OrderID, Step, Status)
    SELECT 'ABC', 0, 'D'
INSERT INTO @tbl_Orders(OrderID, Step, Status)
	select 'ABC', 1, 'P'
INSERT INTO @tbl_Orders(OrderID, Step, Status)
	select 'ABC', 2, 'P'
INSERT INTO @tbl_Orders(OrderID, Step, Status)
	select 'ABC', 3, 'P'
INSERT INTO @tbl_Orders(OrderID, Step, Status)
	select 'XYZ', 0, 'P'
INSERT INTO @tbl_Orders(OrderID, Step, Status)
	select 'XYZ', 1, 'D'
INSERT INTO @tbl_Orders(OrderID, Step, Status)
	select 'EFQ', 0, 'D'
INSERT INTO @tbl_Orders(OrderID, Step, Status)
	select 'EFQ', 1, 'D'
Go;

--find order which step is 0 with status D and for the same order other status are P
with ctetest as 
( 
SELECT OrderID,Step,Status FROM tbl_Orders WHERE Step = 0 and Status = 'D'
)
select distinct a.OrderID from ctetest a inner join tbl_Orders b on a.OrderID = b.OrderID and b.Status = 'P'


-- generate the group of sequences. 
;with cte as(
select b.orderid, cast(rnk*10+c.step as varchar(3)) rnk from
(select *, ROW_NUMBER()over (order by (select null)) rnk from 
(select distinct orderid from @tbl_Orders) a) as  b
inner join @tbl_Orders c on b.orderid = c.orderid
)
select distinct orderid, 
STUFF ((SELECT ',' + rnk FROM CTE w WHERE w.orderid = t.orderid FOR XML PATH('')) ,1,1,'') SequenceNo_Groups
FROM CTE t



