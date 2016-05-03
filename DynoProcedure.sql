DROP PROCEDURE IF EXISTS args;

DELIMITER $$

CREATE PROCEDURE args()
BEGIN

	-- build sql
	SET @selectedColumn = CONCAT('COUNT(', columnName, ')');
	SET @selectedTable = 'shopify_all_customers';
	SET @sql = CONCAT('SELECT ', @selectedColumn, ' INTO @possibleKey FROM ', @selectedTable);
    
	-- executing sql
	PREPARE stmt FROM @sql;
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;
    
END$$
DELIMITER ;


