-- the pivot table to create cross tab
-- use the cte to create the table to be selected on.
With cte_EmployeePay as
(
   SELECT D.GroupName,
          IIF(E.MaritalStatus = 'M','Married','Single') + '-' + 
          IIF(E.Gender = 'M', 'Male', 'Female') as LifeStatus,  -- concat the fields 
          P.Rate * 40 * 52 / P.PayFrequency as AnnualPay,
          ROW_NUMBER() OVER(PARTITION BY E.BusinessEntityID
                       ORDER BY P.RateChangeDate Desc) RowNumber -- window function to group the identical rows
   FROM   HumanResources.Employee E
          INNER JOIN HumanResources.EmployeePayHistory P ON
                     E.BusinessEntityID = p.BusinessEntityID
          INNER JOIN HumanResources.EmployeeDepartmentHistory H ON
                     E.BusinessEntityID = H.BusinessEntityID
                     AND H.EndDate is NULL
          INNER JOIN HumanResources.Department D ON
                     H.DepartmentID = D.DepartmentID
   WHERE  E.CurrentFlag = 1
)
SELECT *
FROM   (SELECT GroupName,
               LifeStatus,
               AnnualPay
        FROM   cte_EmployeePay
        WHERE  RowNumber = 1) as SourceTable
PIVOT    -- pivot the table 
(
   Avg(AnnualPay)    -- aggragated function, the annual payment is aggregate by the groups
   FOR LifeStatus IN ([Married-Male],   -- the label was generated in CTE
                      [Married-Female],
                      [Single-Male],
                      [Single-Female])
) AS AvgSales
ORDER BY GroupName

--tps://www.essentialsql.com/create-cross-tab-query-summarize-data-sql-server/
