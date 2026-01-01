START TRANSACTION;

-- Example 1: add a new column if it doesn't exist
ALTER TABLE users
    ADD COLUMN last_login DATETIME NULL;

-- Example 2: update existing data
UPDATE users
SET last_login = NOW()
WHERE last_login IS NULL;

-- Example 3: create an index
CREATE INDEX idx_users_last_login
    ON users (last_login);

COMMIT;
