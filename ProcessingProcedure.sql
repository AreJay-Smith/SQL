DROP PROCEDURE IF EXISTS Processing;

DELIMITER $$
CREATE PROCEDURE Processing()
BEGIN

WHILE EXISTS (SELECT * FROM working WHERE Processed = 0) DO
  
    -- get column name
    SELECT
      a.ColumnName
    INTO
      @columnName
    FROM
      working AS a
    WHERE 
      a.Processed = 0
    LIMIT 1;

/* -----------------------------------------------------------------
     Work with column
-- -----------------------------------------------------------------  
*/

	-- find out if the column is a possible primary key

	CALL args(@columnName);
		
	-- get total possible rows
	SELECT COUNT(*)
	INTO
	   @totalRows
	FROM
	 shopify_all_customers;
     
     
     
	-- If it's a match we've found  a PK!

	IF @totalRows = @possibleKey THEN
	UPDATE
		working
	SET
		PK = 1
	WHERE
		ColumnName = @columnName AND PK = 0;
	END IF;
     
     
    -- UPDATE FOR LOOP - CRITICAL TO AVOID INFINITE LOOP
    UPDATE
      working
    SET
      Processed = 1
    WHERE
      ColumnName = @columnName;
      
  
END WHILE;
END $$

DELIMITER ;
