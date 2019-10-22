declare @accoutbalance table
(
TransactionDate DATE
	,AccName VARCHAR(10)
	,Type VARCHAR(2)
	,Amount MONEY
)
insert into @accoutbalance (TransactionDate,AccName,Type,Amount)
select '2017-01-01','Anvesh','CR','60000'
insert into @accoutbalance (TransactionDate,AccName,Type,Amount)
select '2017-02-01','Anvesh','DB','8000'
insert into @accoutbalance (TransactionDate,AccName,Type,Amount)
select '2017-03-01','Anvesh','CR','8000'
insert into @accoutbalance (TransactionDate,AccName,Type,Amount)
select '2017-04-01','Anvesh','DB','5000'
insert into @accoutbalance (TransactionDate,AccName,Type,Amount)
select '2017-01-01','Nupur','CR','10000'
insert into @accoutbalance (TransactionDate,AccName,Type,Amount)
select '2017-02-02','Nupur','CR','8000'
insert into @accoutbalance (TransactionDate,AccName,Type,Amount)
select '2017-03-03','Nupur','DB','8000'

;with cte as 
(select TransactionDate,AccName,Type,
case 
when Type = 'DB' then Amount*-1
else amount 
end amout, amount amt,
ROW_NUMBER() over (partition by accname order by (select null)) rnk
From @accoutbalance
)
select TransactionDate,AccName,Type,amt amount,
(select sum(amout) from cte c2
where c2.AccName = c1.AccName and 
c2.rnk <=c1.rnk) accountbalance ----sum up all value that priori or equal to the current row
--- can be use to calculate the summation of the two adjecent rows as well. C2.rnk = C1.rnk-1
from cte c1

