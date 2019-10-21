### Q1. Difference betwwen stored procedure and functions:
* stored procedure: 
  * a set of pre-compiled SQL statements. 
  * compile only one time
  * have an execution plan
  * [support DML and TCL commands](https://explainjava.com/dml-ddl-dcl-tcl-sql-commands/)
  * may not have input parameters
  * accept both input and out parameters
  * call the stored procedure in another stored procedure
  * supports exception handling [@@ERROR ](https://www.youtube.com/watch?v=xgpyqxKuta0)[/TRY CATCH](https://www.youtube.com/watch?v=VLDirfx_OQg)
  * call functions in stored procedures
  
* functions:
  * take inputs and return only one value
  * compile every time
  * does not have an execution plan
  * does not support DML and TCL
  * must have at least one input
  * does not have output parameter
  * call a function in a function
  * does not support exception handling
  * cannot call stored procedure in function 


 ### Q2. Avoid duplication
 * when create the database, ceate primary key to avoid identical rows
 * when query, select distinct to select only the unique rows
 * use window function to identify the duplications and deleted if neeeded.
 
 
 ### Q3. Types of indexes
 * [Unique Index](https://www.tutorialspoint.com/sql/sql-indexes.htm)
 * Clustered Index
 * [Non-Clustered Index](https://stackoverflow.com/questions/1251636/what-do-clustered-and-non-clustered-index-actually-mean)
 
 
### Q4. difference between delete and truncate
* delete:
  * DML command
  * used to delete all records row by row
  * can be used to delete specific record
  * use where clause with the delete commands
  * slower than truncate
  * will not reset auto-generated id 
 
* truncate
  * DDL command
  * delete all records at a time
  * cannot be used to delete specific record
  * cannot work with where clause
  * faster than delete
  * reset auto-generate id
 
### Q5. some string manipulation functions 
* LOWER
* UPPER
* INITCAP
* LPAD
* RPAD
* LTRIM
* RTRIM
* TRIM

### Q6. nvl() and Coalesce()
* NVL is an oracle function, Coalesce is an ANSI function. Coalesce performes faster than NVL.
* NVL does not require same datatype for the two inputs. Coalesce requires the same datatype for all inputs(no limits to the number)


