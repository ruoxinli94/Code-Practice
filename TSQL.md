### Window Functions
```sql
#ROW_NUMBER() FUNCTION CAN BE REPLACED BY THE FUNCTIONS LISTED BELOW
[ROW_NUMBER()] OVER(PARTITION BY ... ORDER BY ...)
```
Ranking functions 
- ROW_NUMBER
- RANK
- DENSE_RANK
- NTILE

Aggregate functions
- SUM
- MIN
- MAX
- COUNT
- AVG

##### Framing
Rows(force data to the memory) and Range (run in the worktable)
Keywords:
1. Preceding
2. Following 
3. Unbounded
4. Current
* Unbounded preceding:(this is the default behavior) everything within the current window within the current partition up until the current row.(see example 1) 

Performance 
- windows spool
- table spool

#### Example 1:
```sql
SUM(Price) OVER(ORDER BY CustomerID RANGE UNBOUNDED PRECEDING) TotalPrice
#RANGE UNBOUNDED PRECEDING is the default and can be omit here
SUM(Price) OVER(ORDER BY CustomerID ROWS UNBOUNDED PRECEDING) TotalPrice
```
##### Explanation: </br>
An partition by is not included here which means the incrementation of the total price will not group by any field.</br>
*For the first row of the code:</br>
<b>Occation1:</b> if the CustomerID is unique across the table. The TotalPrice will be incremented during the process of quiring. In the first record, the TotalPrice will be equal to Price, and the second record of TotalPrice will be the summation of Price of the record 1 and 2. </br>
<b>Occation2:</b> if multiple records have the same CustomerID, they will have the same value in TotalPrice. The value is equal to the summation of all Price priori to the last record of the same CustomerID.</br>
*For the second row of the code:</br>
<b>ROWS UNBOUNDED PRECEDING</b> allows you to run the query through memory which will increase the performance. 
It also eliminate the happending of the occation 2 since the unbounded preceding means go untill the current row. the TotalPrice will increment row by row regardless the group of the CustomerID. </br>

To reverse what we have in the query above, which is to count down the TotalPrice row by row:
```sql
SUM(Price) OVER(ORDER BY CustomerID ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) TotalPrice
# unbounded following means the last row of the partition that the current row falls in. 
#In this example, it will be the last row of the table since the partition by is used specified. 
```
![image](https://user-images.githubusercontent.com/26484899/65741468-2329ed80-e0ba-11e9-91f7-1ac0e343cb75.png)

We can even specify the number of rows that we are interested 
```sql
SUM(Price) OVER(ORDER BY CustomerID ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) TotalPrice
# this will return the summation of the current row, one row above the current row, and 1 row follow the current row. 
# and this will only work for ROWS rather than RANGE
```
In conclusion, the Range framing is taking the aggregated field as the unit (if they are the same just aggregate them all) while the Row framing is taking the row a the unit (if the aggragated field has same value still aggregate them one by one). This happens because the ROW framing force the calculation to the memory where it catch the records one by one. 


#### Analytical functions 
- FIRST_VALUE : the first value in the partition group
- LAST_VALUE: the last value in the partition group
![image](https://user-images.githubusercontent.com/26484899/65820589-1364f300-e1f9-11e9-889f-cea912b5597f.png)
The highlight change the defaul from UNBOUNDED PRECEDENDING TO CURRENT to CURRENT TO UNBOUNDED FOLLOWING. 

* LAG and LEAD: this can be used for across row calculation to avoid self join
  * LAG: get the previous row
  * LEAD: get the row below
```sql
SELECT *, LAG(ClosePrice) OVER (ORDER BY DATE) ProvClosePrice, 
       ClosePrice-LAG(ClosePrice) OVER (ORDER BY DATE) ClosePriceDifference
FROM TBL
ORDER BY DATE
```
- CUME_DIST
- PERCENTILE_COUT
- PERCENTILE_DISC
- PERCENT_RANK


### Common Table Expression (CTEs)
The statement before the CTEs needs to be end by a semi-colon. To ensure this, start the CTEs with a semi-colon.
```sql
;WITH CTE(External Alias) AS (
    SELECT ... ,ROW_NUMBER() OVER (PARTITION BY ... ORDER BY...) AS RN
    FROM ... 
)SELECT ...,RN FROM CTE
WHERE RN = 5 #the alias in the CTEs can be used in the where clasue. 
```
- Avoid replication of the manipulations in the group by clause
- Solve the confliction of window function and where clause
- Increase the readability
- Standardized the alias 

The CTEs can not be nested. However, we can list several CTEs together and use one in another:
```sql
;WITH CTE1 AS (
  SELECT ... FROM TBL 
), CTE2 AS (
      SELECT ... FROM CTE1 
  )
```

### Apply
- Use with dynamic management functions (DMFs)
- Improving query performance
<B>CROSS APPLY: </B> for each row in the left table, pass the expression to the right table. Similar to the inner join but is able to pass parameters to functions. 
<b> OUTER APPLY</b> similar with the left outer join </br>
[a great vedio comparing the performance of different ways of solving the same questions, 1:58:00 - 2:16:00](https://www.youtube.com/watch?v=vE8UcS8U_xE)



### XML
- Fragments: a piece of XML
- Documents: has a single root node at the top, and a closing root at the bottom.
- Well-Formed: the nested clause need to be closed properly
- XSD: XML schema description
- Attribute Centric XML: similar to tabular format but in plain text
- Element Centric XML: similar to json

Add ```FOR XML RAW('column name'), (ELEMENTS,) ROOT ('root node') ``` at the bottom of the query that will transfer the query result to an xml file display in Attribute Centerc XML is the ```ELEMENTS``` is not added. </br>
XML RAW will take every record as an element regards list the repeated infomation in the row. Therefore, we will have a lot of redundancy with in the XML file. XML AUTO can solve this. 

XML AUTO:
* Aliasing Rows
* Nested Elements
* Column Order matters
* Column Selection matters
* Order By
* XMLSCHEMA



