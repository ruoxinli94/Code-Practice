#### Q1..What is the difference between DELETTE and TRUNCATE statements?
	Delete: 
		1. Delete command is used to delete a row in a table 
		2. You can rollback data aster using delete statement 
			i. Need to begin a transaction in order to rollback 
		3. It is a DML command 
		4. It is slower than truncate statement 
	Truncate:
		1. Truncate is used to delete all the rows from a table 
		2. You cannot rollback data 
		3. It is a DDL command
		4. It is faster
```SQL
Begin {transaction} Delete {statement}
Rollback {transaction}
```
- DML is Data Manipulation Language: used to manipulate data itself 
- DDL is Data Definition Language: used to define data structures 
	
	
	
#### Q2..What are the different subsets of SQL?
	1. DDL: Consists of the commands that can be used to define the database schema
	2. DML: Consists of commands that deals with the manipulation of data present in database
	3. DCL: Includes commands which deal with the rights, permissions and other controls of the database system
	4. TCL: Includes the commands which mainly deal with the transaction of database 


#### Q3..What do you mean by DBMS? What are its different types?

<b>Definition:</b> A database management system is a software application that interacts with the user aplications and the database itself to capture and analyze data. The data stored in the database can be modified retrieved and deleted, and can be of any type like strings, numbers, images etc.
![image](https://user-images.githubusercontent.com/26484899/65394169-2cccf180-dd58-11e9-9bf1-f0752f7c8eeb.png)

#### Q4..What do you mean by table and field in SQL?

	1. Table: refers to a collection of data in an organized manner in form of rows and columns.
	2. Field: refers to the number of columns in a table 
	

#### Q5..What are joins in SQL?

A JOIN clause is used to combine rows from two or more tables, based on a related column between them. It is used to merge two tables or retrieve data from there.
- (INNER) JOIN: Returns records that have matching values in both tables
- LEFT JOIN : Returns all records from the left table, and the matched records from the right table 
- RIGHT JOIN: Returns all records from the right table, and the matched records from the left table 
- FULL JOIN :  Returns all records when there is a match in either left or right table 

#### Q6..What is the difference between CHAR and VARCHAR2 datatype in SQL?
- Char is used for strings of fixed length. 
- Varchar2 is used for character strings of variable length. 

#### Q7..What is a Primary Key?

A set of attributes that can be used to uniquely identify every tuple is a primary key. 

#### Q8..What are constrains?

Constraints are used to specify the limit on the data type of the table. It can be specified while creating or altering the table statement.
- NOT NULL: Ensures that a NULL value cannot be stored in a column
- UNIQUE: This constraint makes sure that all the values in a column are different 
- CHECK: This constraint ensures that all the values in a column satisfy a specific condition 
- DEFAULT: consists of a set of default values for a column when no value is specified 
- INDEX: is used to create and retrieve data from the database very quickly


#### Q9..What is the difference between SQL and MySQL?

	1. SQL is a standard language which stands for structured query language based on the english language. SQL is the core of relational database which is used for accessing and managing database
	2. MySQL is an open-source relational database management system that works on many platforms. It provides multi-user access to support many storage engines and is backed by Oracle. 

#### 10..What is a Unique Key?

Uniquely identifies a single row in the table. Multiple values allowed per table, null values are allowed, duplication is not allowed

#### Q11..What is a Foreign Key?

<b>Foreign key</b> maintains referential integriity by enforcing a link between the data in two tables. The foreign key in the child table references the primary key in the parent table. The foreign key constraint prevents actions that would destroy links between the child and parent tables. 

#### Q12..What do you mean by data integrity?

Data Integrity defines Accuracy and consistency of data. Integrity constraints to enforce business rules on data.

#### Q13..What is the difference between clustered and non-clustered index in sql?

<b>Clustered index:</b></br>
Defines the order in which data is physically stored in the table. Table data can be sorted in only way, therefore, there can be only one clustered index per table. In SQL Server, the primary key constraint automatically creates a clustered index on that particular column.
```SQL
USE schooldb
CREATE CLUSTERED INDEX IX_tblSrudent_Gender_Score
ON student(gender, total_score DESC)
```

<b>Non-Clustered Indexes:</b></br>
Doesn't sort the physical data inside the table.  This allows for more than one non-clustered index per table. 
When a query is issued against a column on which the index is created, the database will first go to the index and look for the address of the corresponding row in the table. It will then go to that row address and fetch other column values.
```SQL
CREATE NONCLUSTED INDEX IX_tblStudent_Name ON student(name)
```
[Source](https://www.sqlshack.com/what-is-the-difference-between-clustered-and-non-clustered-indexes-in-sql-server/)



#### Q14..
Write a SQL query to display the current date?
```SQL
Select GETDATE();
```

#### Q15..What do you mean by Denormalization?

Refers to a technique which is used to access data from higher to lower forms of a database. 
Increase the performance of the entire infrastructure as it introduces redundancy into a table.
Adds the redundant data into a table by incorporating database queries that combine data from various tables into a single table. 

In many cases, denormalization involves creating separate tables or structures so that queries on one piece of information will not affect any other information tied to it. For instance, where more global data variables such as customer names are tied together with single purchases in a purchase history, a database administrator will want to make sure that work done on an item purchased will not incorrectly affect the entire customer account. Therefore, database handlers will separate the two pieces of information, sometimes with redundant data, so that they can be worked on separately.

From <https://www.techopedia.com/definition/29168/denormalization> 


#### Q16..What are Entities and Relationships?
 
<b>Entities:</b> a person, place, or thing in the real world about which data can be stored in a database. Tables store data that represents one type of entity.</br>
<b>Relationships:</b> relation or links between entities that have something to do with each other. The relationship might be in the same table or separate tables. 

#### Q17..What is an index?
Index is a performance tuning method, it allows faster retrieval of records from the table. It creates an entry for each value. 

#### Q18..Explain different types of index

	1. Unique index: This index does not allow the field to have duplicate values if the column is unique indexed. If a primary key is defined. A unique index can be applied automatically
	2. Clustered index: this index reorders the physical order of the table and searches based on the basis of key values. Each table can only have one clustered index.
	3. Non-clustered index: does not alter the physical order of the table and maintains a logical order of the data. Each table may have many non-clustered indexes. 


#### Q19..What is Normalization and what are the advantages of it? (compare with Q16)

Normalization is the process of organizing data to avoid duplication and redundancy.
Advantages: 
- Better database organization
- More tables with smaller rows
- Efficient data access
- Greater flexibility for queries
- Quickly find the information
- Easier to implement security
- Allows easy modification
- Reduction of redundant and duplicate data
- More compact database
- Ensure consistent data after modification



#### Q20..What is the difference between DROP and TRUNCATE commands?

Drop removes a table and it cannot be rolled back from the database:
```SQL
DROP object object_name 
```
Truncate removes all rows from the table and cannot be rolled back into the database:
```SQL
TRUNCATE TABLE table_name
```

#### Q21..Explain different types of Normalization.

- 1NF: Each table cell should have a single value. Basically all the records must be unique. 
- 2NF: Database should be 1NF and should also have single column primary key. 
- 3NF: the database should be in 2NF and must not have any transitive functional dependencies
- BCNF: If your database is in 3rd normal form, there would be some scenarios where anomalies would be present. If you have more than one candidate key. Then BCNF comes into role, where you divide your tables further so that there would be only one candidate key present. 


#### Q22..What is ACID property in a database?
Atomicity; Consistency; Isolation; Durability

#### Q23..What do you mean by trigger in sql?

Trigger in sql is a special type of stored procedures that are defined to execute automatically in place or after data modifications. It allows you to execute a batch of code when an insert, update, or any other query is executed against a specific table. 
Before/after  inset/update/delete


#### Q24..What are the different operators available in SQL?
- Arithmetic operators
- Bitwise operators: &,|,^
		Convert the number to binary value and operate, then convert to a number in output. 
- Comparison operators
- Compound operators: are operated where variables are operated upon and assigned in the same line.
		A=A+2 --> A+=2
- Logical operators

![image](https://user-images.githubusercontent.com/26484899/65394205-b977af80-dd58-11e9-946c-38bc77049c6c.png)

#### Q25..Are NULL values same as that of zero or a blank space?

A NULL value is not at all same as that of zero or a blank space. NULL value represents a value which is unavailable, unknown, assigned or not applicable whereas a zero is a number and blank space is a character. 


#### Q26..What is the difference between cross join and natural join?

	• Cross join produces the cross product or cartesian product of two tables
	• Natural join based on all the columns having the same name and data types in both the tables.
	• Condition join. The condition is not necessarily be an equality. 


#### Q27..What is subquery in sql?

A query side another query where a query is defined to retrieve data or information back from the database. 
Subqueries are always executed first and the result of the subquery is passed on to the main query. 


#### Q28..What are the different type of a subquery?

<b>Correlated subquery:</b>
These are queries which select the data from a table referenced in the outer query. It is not considered as an independent query as it refers to another table and refers the column in a table.

<b>Non-Correlated Subquery</b>
This query is an independent query where the output of subquery is substituted in the main query. 


#### Q29..List the ways to get the count of records in a table.

	1. Select * from tbl;
	2. Select count(*) from tbl;
	3. Select rows from sysindexes where id = object_id(tbl) and indid <2;


#### Q30..What is the need for group functions in SQL?

- AVG
- COUNT
- MAX
- MIN
- SUM
- VARIANCE
 

#### Q31..What is a relationship and what are the different type of relationships?

Relationships are defined as the connection between the tables in a database .
- One to one 
- One to many
- Many to one 
- Self-referencing relationship
A cross-referencing table needs to be created when the relationship is many to many.


#### Q32..Inset null value in table 

	1. Implicitly by omitting column from column list
	2. Explicitly by specifying null keyword in the values clause


#### Q33..What is the main difference between BETWEEN and IN condition operators

	1. Between .. And ..
	Used to display rows based on a range of values in a row:
	```SQL
  SELECT * FROM student WHERE roll_no between 10 and 50;
  ```
	2. In 
	Used to check for values contained in a specific set of values
	```SQL
  SELECT * FROM students WHERE roll_no in (8, 15, 25);
  ```
	
#### Q34..Why are sql functions used?
	1. To perform some calculations on the data
	2. To convert the data types
	3. To modify individual data items
	4. To format dates and numbers
	5. To manipulate the output 
	

#### Q35..What is the need of MERGE statement

Merge allows conditional update or insertion of data into a table.
It performs an update if a row exist, or an inset if the row does not exist.
```SQL
MERGE [target] as T 
USING [source] as s
	ON [join_condition]
WHEN MATCHED THEN [UPDATE STATEMENT]
WHEN NOT MATCHED BY TARGET
	THEN [INSERT STATEMENT]
WHEN NOT MATCHED BY SOURCE 
	THEN [DELETE STATEMENT]
```

#### Q36..What do you mean by recursive stored procedure?
Recursive stored procedure refers to a stored procedure which calls by itself until it reaches some boundary condition.
This recursive function or procedure helps the programmers to use the same set of code n number of times. 


#### Q37..Differences between having and where. 

	1. Having clause can be used only with select statement. It is usually used in a group by clause.
	2. Where clause is applied to each row before they are a part of the group by function in a query.  
	

#### Q38..Ways in which dynamic sql can be executed.
	• Write a query with parameters
	• Using exec
	• Using sp_executesql
	
	
#### Q39..Various levels of constraints 
Column and table level

#### Q40..How can you fetch common records from two tables 

Fetch common records from two tables using intersect 
```SQL 
SELECT column1, column2,...
FROM tbl1
WHERE condition 

INTERSECT

SELECT field1, field2,...
FROM tbl2
WHERE condition 
```


#### Q41..Case manipulation functions in SQL.

	1. LOWER: this function returns the string in lowercase. 
	2. UPPER: this function returns the string in uppercase.
	3. INITCAP: this function returns the string with the first letter in uppercase and rest of the letters in lowercase


#### Q42..Set operators
- Union
- Intersect
- Minus


#### Q43..Aggregate and scalar functions

	1. Aggregate functions used to evaluate mathematical calculation and returns a single value. These calculations are done from the columns in a table
	2. Scalar functions return a single value based on the input value. UCASE(), NOW()

#### Q44..How can you fetch alternate records from a table?
<b>Even:</b>
```SQL
select * from Business where rowno%2 =0
```
<b>Odd:</b>
```SQL
select * from Business where rowno%2 =1
```

#### Q45..Fetch first 5 characters of a string
```SQL
Select substring(studentname, 1,5) as studentname from student
Select right(studentname, 5) as studentname from student
```
#### Q46..What are views used for?
	1. Restricting access to data
	2. Making complex queries simple 
	3. Ensuring data independence
	4. Providing different views of same data
	

#### Q47..Advantages and disadvantages of stored procedure:
<b>Adv:</b> can be used as modular programming which means create once, store and call for several times whenever it is required. This supports faster execution. It also reduces network traffic and provides better security to the data.</br>
<b>Dis:</b> it can be executed only in the database and utilizes more memory in the database server


#### Q48..What do you mean by collation?
- Collation is defined as a set of rules that determine how data can be sorted as well as compared.
- Character data is sorted using the rules that define the correct character sequence along with options for specifying case sensitivity, character width etc.

#### Q49..Local and Global variables 

- Local variables can be used or exist only inside the function. 
- Global variables are the variables which can be accessed throughout the program. 


#### Q50..What is auto increment in sql 

Auto increment keyword can be used in Oracle
Identity keyword can be used in SQL Server


#### Q51..Stuff and replace 
- Stuff function: - This function is used to replace string from the given start position, passed as 2nd argument with string passed as last argument. In Stuff function, 3rd argument defines the number of characters which are going to be replaced.
```SQL
STUFF ( character_expression , start , length , replaceWith_expression )
```
- Replace Function :- Replace function is used to replace all occurrence of a specified with the string passed as last argument.
Syntax :-
```SQL
REPLACE ( string_expression , string_pattern , string_replacement )
```
From <https://www.sqlservercentral.com/blogs/stuff-vs-replace-function-in-sql-server> 
