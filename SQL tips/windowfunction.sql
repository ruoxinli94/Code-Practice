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

select a,b,c,d from (
select a,b,c,d,ROW_NUMBER() over (partition by a order by 
b desc, c desc, d desc) from @Version)  -- use as many as features in feature
as X(a,b,c,d,latest)
where latest = 1

