### What is Null value
Null means 'Unknown' value which is not equal to itself. 
* Null <> Null
* Null + AnyValue = Null
* Comparison between values that contain Null will return unkown. Null value is not comparable

### Operations for Handling Null Values
<b>ISNULL(Expression, Alternative)</b> return alternative if the expression is null</br>
<b>COALESCE(argument1,2...n)</b> return the first non-null argument, return null if all argument are null
<b>NULLIF(expression1, expression2)</b> returns null if the two specified expressions are equal

### Null in Conditional Operatiors
* <b>IN</b> returns no match with NULL 
* <b>NOT IN</b> return false if NULL exist in the list
* <b>BETWEEN; NOT BETWEEN</b> return false if one of the limits value is NULL
* <b>ORDER BY</b> NULL is the smallest value in the sorting order 
* <b>GROUP BY</b> NULL is consider as equal in group by. All records with NULL value will be aggregate in one group
* <b>Aggregation functions</b> COUNT, SUM, AVG, MAX, MIN, LIST ignore NULL. Only COUNT(*) will consider row with NULL value


