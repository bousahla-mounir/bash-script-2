
-- Disable FK checks
SET FOREIGN_KEY_CHECKS = 0;

-- Build list of tables
SET @tables := (
    SELECT GROUP_CONCAT(CONCAT('`', table_name, '`'))
    FROM information_schema.tables
    WHERE table_schema = DATABASE()
);

-- Only drop if there is at least one table
SET @drop_sql := IF(@tables IS NULL,
                    'SELECT "No tables to drop";',
                    CONCAT('DROP TABLE IF EXISTS ', @tables, ';')
);

PREPARE stmt FROM @drop_sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Re-enable FK checks
SET FOREIGN_KEY_CHECKS = 1;




