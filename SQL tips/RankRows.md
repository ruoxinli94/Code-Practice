### ROW_NUMBER()
Returns a <b>unique sequential number</b> for each row within the partition of the specified window, starting at 1 for the first row in each partition and <b>without repeating or skipping numbers</b> in the ranking result of each partition
```SQL
ROW_NUMBER() OVER( ORDER BY Student_Score) AS RowNumberRank
```
### RANK()
Returns a unique rank number for each distinct row within the partition according to a specified column value, starting at 1 for the first row in each partition, with the same rank for duplicate values and leaving gaps between the ranks; this <b>gap appears</b> in the sequence after the duplicate values.
```SQL
 RANK ()  OVER( ORDER BY Student_Score) AS RankRank
```
### DENSE_RANK()
Same with Rank(). It does not skip any rank, leaving <b>no gaps</b> between the ranks
```sql
DENSE_RANK ()  OVER( ORDER BY Student_Score) AS Dense_RankRank
```
### NTILE()
Distribute the rows in the rows set into a <b>specified number of groups</b>, providing each row in the row set with a unique group number, starting with the number 1 that shows the group this row belongs to, where N is a positive number, which defines the number of groups you need to distribute the rows set into.
```sql
NTILE(4) OVER( ORDER BY Student_Score) AS NTILERank
```
