```sql
DO NOT FORGET THE SEMI-COLON ";" AT THE END OF EVERY QUERY!

-- Default login as PostgreSQL superuser (postgres)
sudo -u postgres psql

-- Sign in as a different user or database
-- -U: Specifies the username.
-- -d: Specifies the database to connect to.
psql -U your_username -d your_database

-- Logging in to Postgres as a user
psql -U colelamersdotcom -h 127.0.0.1 -d colelamersdotcom

/* When signed in and you see this
postgres=#
Then you are logged in.
*/

-- Commands
\l or \list -- List all databases
\c -- Shows the active database
\c name_of_database or \connect name_of_database -- Switch database
\dt -- List all tables in the current database
\d name_of_table -- Show columns and details of a table
\d name_of_table name_of_column -- Show details of specific column
\d+ name_of_table -- Show more info of columns and details of table
\di -- Show all indexes
\dv -- Show all views
\dn -- List all available schemas
\du -- Show all users and their roles
\x -- Toggle for showing query results in expanded or regular mode
    -- ERROR: \dt did not find any relations means that there are no tables
\q -- Quit the shell
\dn -- View all schemas
\conninfo -- Shows connection info of database, user, running from, and port
\? -- Show all commands
\e -- Allows writing a query in an editor and when you exit and save it runs the query
\copy -- Associated with copying data from a csv
\z -- Check permissions on database and table

-- Grant Permissions

-- Adding new user
sudo -u postgres psql
CREATE USER your_user WITH PASSWORD 'your_password';
-- Access to DB
GRANT CONNECT ON DATABASE database_name TO your_user;
-- Access to Tables
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO your_user;
-- Access to all new Tables
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO your_user;

-- colelamersdotcom is the username!
-- Read permissions
GRANT SELECT ON TABLE quotes TO colelamersdotcom;

-- Full access
GRANT ALL PRIVILEGES ON TABLE quotes TO colelamersdotcom;

-- Insert only
GRANT INSERT ON TABLE quotes TO colelamersdotcom;

-- Permissions on all tables in a schema/database
GRANT SELECT ON ALL TABLES IN SCHEMA public TO colelamersdotcom;

-- Permissions on all tables in a schema/database and all new ones as well!
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO colelamersdotcom;

-- Grants permissions on a database
GRANT CONNECT, CREATE, TEMPORARY ON DATABASE database_name TO user_name;
GRANT ALL PRIVILEGES ON DATABASE database_name TO user_name;

-- Gives the user additional access to the table
ALTER USER colelamersdotcom WITH SUPERUSER;

  ------------/
 -- Queries --
------------/
CREATE DATABASE my_database; -- Creates a database

-- Show Query Execution Plan
EXPLAIN SELECT * FROM table;

-- Show more details
EXPLAIN ANALYZE SELECT * FROM table;


-- To select the top items in PostgreSQL 
SELECT TOP 10 id 
FROM quotes 
ORDER BY id ASC;
-- You need to do this:
SELECT id 
FROM quotes 
ORDER BY id ASC 
LIMIT 10

-- How to import/copy data from a CSV to PostgreSQL, import csv
\copy quotes (quote, author)
from '/tmp/quotes.csv'
WITH CSV DELIMITER '~' HEADER FORCE NULL author; -- FORCE NULL author means if empty, just put null


-- Delete data from a table
DELETE from table_name;

-- Reset the increment value back to 1
TRUNCATE TABLE table_name RESTART IDENTITY;

-- Reset ID SEQUENCE AT 1 right after creating a table
-- To find the sequence ('table', 'column')
SELECT pg_get_serial_sequence('quotes', 'id');
-- That will return something like
public.quotes_id_seq
-- Then run this to reset the sequence back to start at "1"
ALTER SEQUENCE quotes_id_seq RESTART WITH 1;


-- Transactions
-- DO NOT FORGET ABOUT THESE!
BEGIN;
COMMIT;
ROLLBACK;

-- Create database
CREATE DATABASE db_name;

-- Create table
CREATE TABLE table_name;
-- Creating Tables with types available
CREATE TABLE example_table (
id SERIAL PRIMARY KEY, -- Auto-incremented primary key
name VARCHAR(100), -- Variable length string (max 100 characters
name VARCHAR UNIQUE, -- No value specified basically means VARCHAR(MAX), unique values in the table too
email VARCHAR(255), -- Variable length string (max 255 characters)
short_code CHAR(10), -- Fixed length string (exactly 10 characters)
description TEXT, -- A large text field with no specific length limit
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Datetime without timezone information
updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP, -- Datetime with timezone
birth_date DATE, -- Only the date part (year, month, day)
appointment_time TIME, -- Only the time part (hours, minutes, seconds)
event_time TIMETZ, -- Time with timezone info
price NUMERIC(10, 2), -- Numeric value with precision (total digits) and scale (digits after decimal point)-- Example: 12345678.90
quantity INT, -- Integer type (whole number)
status_code SMALLINT, -- Small integer, smaller range than INT
population BIGINT, -- Larger integer than INT
rating REAL, -- Floating point number
score DOUBLE PRECISION, -- Double precision floating point number
is_active BOOLEAN, -- Boolean value (TRUE/FALSE)
file_data BYTEA, -- Binary data (e.g., images, files)
user_uuid UUID DEFAULT uuid_generate_v4(), -- Automatically generates a UUID (Universally Unique Identifier)
json_data JSON, -- JSON data type (stores JSON objects)
jsonb_data JSONB, -- JSONB (binary format of JSON, more efficient for some operations)
xml_data XML, -- Store XML data
tags TEXT[], -- Store arrays of text
numbers INT[], -- Store arrays of integers
shirt_size VARCHAR(10) CHECK (shirt_size IN ('small', 'medium', 'large')), -- Enum type for predefined values (e.g., 'small', 'medium', 'large')
user_id INT REFERENCES users(id), -- Reference to another table (foreign key constraint)
date_range TSRANGE, -- Store a range of values (for date range in this case)
int_range INT4RANGE, -- Store a range of integers
ip_address INET, -- Store an IP address (IPv4)
subnet INET, -- Store an IP address with subnet (IPv6)
mac_address MACADDR, -- Store a MAC address
time_difference INTERVAL, -- Store an interval (e.g., for time differences)
amount MONEY, -- Store a monetary amount
location POINT, -- Store geographical points (latitude, longitude)
line geometry(Line), -- Store a line (in 2D)
shape geometry(Polygon) -- Store a polygon (in 2D)
);
VALUES (
  'John Doe',                             -- VARCHAR
  'johndoe@example.com',                  -- VARCHAR (Unique)
  'SC12345678',                           -- CHAR(10)
  'This is a sample for the TEXT field.', -- TEXT
  '2024-11-25 14:35:00',                  -- TIMESTAMP
  '2024-11-25 14:35:00+00',               -- TIMESTAMPTZ
  '1990-05-20',                           -- DATE
  '14:35:00',                             -- TIME
  '14:35:00+00',                          -- TIMETZ
  12345.67,                               -- NUMERIC
  42,                                     -- INT
  2,                                      -- SMALLINT
  1000000000,                             -- BIGINT
  4.5,                                    -- REAL
  12345.6789,                             -- DOUBLE PRECISION
  TRUE,                                   -- BOOLEAN
  E'\\x89504e470d0a1a0a',                 -- BYTEA (example binary data)
  uuid_generate_v4(),                     -- UUID
  '{"key": "value"}',                     -- JSON
  '{"key": "value"}',                     -- JSONB
  '<root><item>Value</item></root>',      -- XML
  ARRAY['tag1', 'tag2', 'tag3'],          -- TEXT[]
  ARRAY[1, 2, 3],                         -- INT[]
  'medium',                               -- VARCHAR with CHECK
  1,                                      -- Foreign key to users table
  '[2024-11-01,2024-11-30]',              -- TSRANGE
  '[1,100]',                              -- INT4RANGE
  '192.168.1.1',                          -- INET
  '192.168.1.0/24',                       -- INET with subnet
  '00:1A:2B:3C:4D:5E',                    -- MACADDR
  '1 day 2 hours 30 minutes',             -- INTERVAL
  99.99,                                  -- MONEY
  '(40.7128, -74.0060)',                  -- POINT
  'LINESTRING(0 0, 1 1)',                 -- Line geometry
  'POLYGON((0 0, 1 0, 1 1, 0 1, 0 0))'    -- Polygon geometry
);

-- Delete table
DROP TABLE table_name;

-- Delete database
DROP DATABASE db_name;

-- Insert data into table
INSERT INTO tablename (name, email)      -- TYPES
VALUES ('John Doe', 'john@example.com'); -- DATA

INSERT INTO blogs (title, filename, date)
VALUES ('First Blog', 'first_blog.txt', '2024-11-23'),
('Second Blog', 'second_blog.txt', '2024-11-24'),
('Third Blog', 'third_blog.txt', '2024-11-25');

-- TIMESTAMP example
VALUES (TIMESTAMP '2024-11-23 14:30:00');
VALUES (TIMESTAMP '2024-11-23 14:30:00+02:00'); -- With Timezone Info

-- Inserts basically the "NOW()" time
VALUES (CURRENT_TIMESTAMP);
-- Or
VALUES (NOW());

-- Inserts date and time without a timezone
VALUES (LOCALTIMESTAMP);

-- Alter columns in PostgreSQL
ALTER TABLE blogs
ALTER COLUMN id SET DATA TYPE INTEGER, -- Change data type if needed
ALTER COLUMN id SET NULL, -- nullable
ALTER COLUMN id SET NOT NULL, -- not nullable
ALTER COLUMN column_name DROP NOT NULL, -- Removes NOT NULL constraint
ALTER COLUMN salary SET DEFAULT 50000, -- If entry is blank it'l make it this value
ALTER COLUMN status SET DEFAULT 'info',
ALTER COLUMN salary DROP DEFAULT, -- Removes default constraint
DROP COLUMN middle_name, -- Get rid of column
RENAME COLUMN current_table TO new_table_name,
ADD CONSTRAINT check_column_name CHECK (column_name > 0), -- Ensure entry is correct
ADD CONSTRAINT constraint_name UNIQUE (id),
ADD COLUMN new_column TEXT,
DROP CONSTRAINT unique_id;

-- Copy data from CSV
COPY blogs (title, filename, date)
FROM '/path/to/your/file.csv'
WITH CSV HEADER;

-- Update data in a table
UPDATE tablename
SET column_name = 'new_value'
WHERE condition;

-- Delete data from table
DELETE FROM tablename WHERE condition;

-- Get top results, limit results
SELECT * FROM tablename LIMIT 10;

-- Join
SELECT a.column1, b.column2
FROM table1 a
LEFT JOIN table2 b ON a.common_column = b.common_column;

-- New user, privileges and roles
CREATE ROLE username WITH LOGIN PASSWORD 'password';
GRANT ALL PRIVILEGES ON TABLE tablename TO username;
REVOKE ALL PRIVILEGES ON TABLE tablename FROM username;
ALTER ROLE username WITH PASSWORD 'newpassword';

-- Backup and restore database
pg_dump dbname > dbname_backup.sql
psql -U username -d dbname -f dbname_backup.sql

-- Backup table
pg_dump -t tablename dbname > tablename_backup.sql

-- Set variables in query
SET work_mem TO '4MB';

-- Import Data from a CSV File:
COPY tablename FROM '/path/to/input.csv' WITH CSV HEADER;

-- Export Data to a CSV File:
COPY (SELECT * FROM tablename) TO '/path/to/output.csv' WITH CSV HEADER;

-- .pgpass
You can automatically sign in with a .pgpass file. Use this command to create the file, give only the logged in user read-write access, and then add the following info on line 1 in the file:
touch ~/.pgpass; chmod 600 ~/.pgpass; nano ~/.pgpass
127.0.0.1:5432:colelamersdotcom:colelamersdotcom:$h32x$GwLE

-- The template system in postgres is as:/
host:port:database:username:password
-- * 127.0.0.1: The host (localhost).
-- * 5432: The port (default PostgreSQL port).
-- * colelamersdotcom: The database name.
-- * colelamersdotcom: The username.
-- * your_password: The password for the colelamersdotcom user.

The running this command:
psql -U colelamersdotcom -h 127.0.0.1 -d colelamersdotcom
Will auto log you in to postgres, allowing you access to sql via bash

```
