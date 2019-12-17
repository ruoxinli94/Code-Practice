## 5 steps of decision making 
#### Step1: Define questions. 
The question needs to be measurable, clear and concise. Starting form the faced problem and define the metrics.  
The question should either qualify or disqualify the solution to the problem. 
#### Step2: Set measurement.
* What to measure: the related data that is needed to answer the defined question.
* How to measure: the key factors, time scale, unit of measure. Should be cristal clear to avoid misinterpretation of the data. 
#### Step3: Collect Data.
One principle is cost efficiency. Consider the existing datasets before collect new data.  
Determine a file storing and naming system before collecting the data to avoid replicate work from different team members.  
If the collected data is qualitative, define the interview or the observation template first such as the travel diary.  
Add the metadata of the collected datasets such as the date, source notes to keep track. 
#### Step4: Analyze data 
Start with the basic statistic of the data. Analyze the tends, correlations, variations and outliers. This is process, may need to repeat step 1 to 3 to adjust the dataset to match the inital questions. 
#### Step5: Interpret results
Warning: cannot ever prove a hypothesis is true, can only fail to reject the hypithesis.  
Key questions when interpreting:
* How does the result anser the initial questions?
* How does the data defend against other objections?
* The limitation fo the conclusion.


## Clustered and Non-Clustered Index
#### Clustered Index
A clustered index defines the order in which data is physically stored in a table.Table data can be sorted in only way, therefore, there can be only one clustered index per table.   In SQL Server, the primary key constraint automatically creates a clustered index on that particular column.
Below is an example:
```sql 
CREATE DATABASE schooldb
          
CREATE TABLE student
(
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    gender VARCHAR(50) NOT NULL,
    DOB datetime NOT NULL,
    total_score INT NOT NULL,
    city VARCHAR(50) NOT NULL
 )
 ```
 When creating the primary key constrain in the table, a clustered index is automatically generated. Use the code below to check the keys on the table.
 ``` sql
 USE schooldb
          
EXECUTE sp_helpindex student
 ```
If the code below is executed, the input record will be reorder by the ID column.
``` sql
USE schooldb
          
INSERT INTO student
 
VALUES  
(6, 'Kate', 'Female', '03-JAN-1985', 500, 'Liverpool'), 
(2, 'Jon', 'Male', '02-FEB-1974', 545, 'Manchester'),
(9, 'Wise', 'Male', '11-NOV-1987', 499, 'Manchester'), 
(3, 'Sara', 'Female', '07-MAR-1988', 600, 'Leeds'), 
(1, 'Jolly', 'Female', '12-JUN-1989', 500, 'London'),
(4, 'Laura', 'Female', '22-DEC-1981', 400, 'Liverpool'),
(7, 'Joseph', 'Male', '09-APR-1982', 643, 'London'),  
(5, 'Alan', 'Male', '29-JUL-1993', 500, 'London'), 
(8, 'Mice', 'Male', '16-AUG-1974', 543, 'Liverpool'),
(10, 'Elis', 'Female', '28-OCT-1990', 400, 'Leeds');
```
To create a new clustered Index, first make sure the table does not have an existing clustered index. Run the code below to add clustered index.
``` sql
use schooldb
 
CREATE CLUSTERED INDEX IX_tblStudent_Gender_Score
ON student(gender ASC, total_score DESC)
```

#### Non-Clustered Index
A non-clustered index doesn’t sort the physical data inside the table. In fact, a non-clustered index is stored at one place and table data is stored in another place.This allows for more than one non-clustered index per table. The index contains column values on which the index is created and the address of the record that the column value belongs to.  Non-Clustered Index requires extra storage. 
Two steps happen when quering the data on the indexed column. The db will first go to the index and look for the address of the corresponding row in the table. Than it will go the the address of the selected row and fetch the other column values. Non-clustered indexes are slower than clustered indexes due to this process. 
Use the code below to create a Non-Clusted index.
``` sql 
use schooldb
 
CREATE NONCLUSTERED INDEX IX_tblStudent_Name
ON student(name ASC)
```

