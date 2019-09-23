#### Use the Sys.objects table to find:
1. [u] User-defined table
2. [PK]Primary keys
3. [uq]Unique keys
4. [f]Foreign keys
5. [tr]Triggers
6. [it]Internal tables
7. [p]Procedures
```SQL
SELECT * FROM Sys.objects WHERE Type= '[keywords for the type here]'
```

#### Any and All
All is used for checking if the column is meet the requirement of the comparison_operator of all elements int he subquery.
For example:
- column > ALL(select ...) means the value in the column needs to be greater than the greatest value in the subquery. 
- use column <> All(...) to select values that not not exist in the subquery.
- column = ALL(...) returns true when column value is equal to all the values returen by the subquery
```SQL
SELECT * FROM TABLE WHERE COLUMN </<=/>/>=/<>/= ALL (subquery)
```

Any is the oposite of the all:
- column > ANY (select ...) means the value in the column needs to be greater than the smallest value in the subquery
- column < ANY (select ...) means the value in the column needs to be smaller than the greatest value in the subquery
- column <> ANY(...) is always true unless the subquery only returns one value and the value is equal to be value in the column
- column = ANY(...) works similar with the IN statement. If any of the value return by the subquery is matched with the column value, return ture. 
```SQL
SELECT * FROM TABLE WHERE COLUMN </<=/>/>=/<>/= ANY (subquery)
```
