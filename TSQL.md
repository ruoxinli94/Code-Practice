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
* Unbounded preceding: everything within the current window within the current partition up until the current row.(see example 1) 

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


