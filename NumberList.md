### Create a list of sequential numbers in sql 
* Create a number table
```sql
select top(1000000) convert(int,row_number()over(order by s1.object_id)) n into dbo.Numbers
from sys.all_objects as s1 cross join sys.all_objects as s2
option(maxdop 1)
```

* spt_values
```sql
select top(1000) row_number() over (order by number) n
from master..spt_values order by n
```

* sys.all_objects
```sql
select top(1000) row_number() over (order by object_id) n from sys.all_objects order by n
```

* stacked CTEs
```sql
;WITH e1(n) AS
(
    SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL 
    SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL 
    SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1
),
e2(n) AS (SELECT 1 FROM e1 CROSS JOIN e1 AS b),
e3(n) AS (SELECT 1 FROM e1 CROSS JOIN e2 AS b)
SELECT ROW_NUMBER() OVER (ORDER BY n) n FROM e3 ORDER BY n
```

* Recursive CTEs
```sql 
;with n(n) as 
(
  select 1 
  union all 
  select n+1 from n where n<1000
)
```
