declare @ColumnDynamicSQL nvarchar(MAX),
@ColumnList nvarchar(MAX),
@FinalDynamicSQL nvarchar(MAX),
@TableSchema nvarchar(128)='enb',
@TableName nvarchar(128) = 'Valve_evw',
@WhereClause nvarchar(128) = 'RouteEventID = ''90c0f2d2-2891-44e3-bf23-e3cf06ee1cc9'''

SELECT @ColumnDynamicSQL = 'SELECT @ColumnList = ''''' + char(10)

SELECT @ColumnDynamicSQL = @ColumnDynamicSQL + '+ MAX(CASE WHEN ' + COLUMN_NAME + ' IS NOT NULL THEN '',' + COLUMN_NAME + ''' ELSE '''' END)' + CHAR(10)
  FROM INFORMATION_SCHEMA.COLUMNS
 WHERE 1=1
   AND TABLE_NAME   = @TableName
   AND TABLE_SCHEMA = @TableSchema

SELECT @ColumnDynamicSQL = @ColumnDynamicSQL + '  FROM ' + @TableSchema + '.' + @TableName

--SELECT @ColumnDynamicSQL -- TESTING
EXEC sp_executesql @statement   = @ColumnDynamicSQL
                  ,@parameters  = N'@ColumnList varchar(4000) OUTPUT'
                  ,@ColumnList  = @ColumnList OUTPUT


IF (@ColumnList = '')
  BEGIN
    SELECT 'No Data'
  END
ELSE
  BEGIN
    SELECT @ColumnList = RIGHT(@ColumnList, LEN(@ColumnList) - 1) -- Strip off the first comma

    SELECT @FinalDynamicSQL = 'SELECT ' + @ColumnList + ' FROM ' + @TableSchema + '.' + @TableName where @WhereClause

    EXEC sp_executesql @FinalDynamicSQL
END
