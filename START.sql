
 /*
 Create the Processing table
 */
 
DROP TABLE IF EXISTS working;
 
  CREATE TABLE working AS
     SELECT COLUMN_NAME AS ColumnName,
	 0 AS Processed,
     0 AS PK

    FROM
      INFORMATION_SCHEMA.`COLUMNS` AS a
    WHERE
      a.TABLE_SCHEMA = SCHEMA() AND
      a.`TABLE_NAME` = 'shopify_all_customers' AND
      a.`COLUMN_NAME` NOT LIKE '%_BATCH_%' AND
      a.`COLUMN_NAME` NOT IN ('DOMO_INSTANCE', 'Batch Id', 'Batch Date');
      
      
      
CALL Processing();

SELECT * FROM working;



   