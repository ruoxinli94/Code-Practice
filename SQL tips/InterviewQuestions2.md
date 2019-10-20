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
  
 
  

