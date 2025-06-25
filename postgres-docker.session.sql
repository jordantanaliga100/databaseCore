
-- ! SELECT VERSION 
-- SELECT version();

-- ! CRUD (postgres)

-- ! Task 1: Create a database
-- CREATE DATABASE sales_example;


-- ! Task 2: Create a table
-- CREATE TABLE sales (
--   id SERIAL PRIMARY KEY, 
--   date_created DATE DEFAULT (CURRENT_DATE),
--   date_fulfilled DATE,
--   customer_name VARCHAR(300) NOT NULL,
--   product_name VARCHAR(300) NOT NULL,
--   volume NUMERIC(12,3) NOT NULL CHECK(volume >= 0),
--   is_recurring BOOLEAN DEFAULT FALSE,
--   is_disputed BOOLEAN DEFAULT FALSE
-- );

-- ! Task 3: Insert data 
-- * INSERTING ONE RECORD
-- INSERT INTO sales (
--   customer_name,
--   product_name,
--   volume,
--   is_recurring

-- -- )
-- VALUES (
--   'Jordan Tanaliga',
--   'Piano',
--   12.99,
--   TRUE
-- )

-- * INSERTING MULITPLE RECORDS
-- INSERT INTO sales (
--   date_fulfilled,
--   customer_name,
--   product_name,
--   volume,
--   is_recurring,
--   is_disputed
-- )
-- VALUES (
--   NULL,
--   'Iza',
--   'Course bundle',
--   1599.99,
--   FALSE,
--   FALSE
-- ), (
--   '2020-06-20',
--   'abc inc',
--   'trucks',
--   400000.10,
--   FALSE,
--   TRUE
-- )

-- * MORE MORE DATA !
-- INSERT INTO sales (
--   date_created,
--   date_fulfilled,
--   customer_name,
--   product_name,
--   volume,
--   is_disputed,
--   is_recurring
-- )
-- VALUES (
--   '2022-01-18',
--   '2022-03-11',
--   'Company A',
--   'A Nice Product',
--   489.99,
--   FALSE,
--   TRUE
-- ), (
--   '2022-01-18',
--   '2022-05-01',
--   'Company B',
--   'Video Game Collection',
--   3859.12,
--   FALSE,
--   FALSE
-- ), (
--   '2021-12-05',
--   NULL,
--   'Company C',
--   'Daily News Summary',
--   4.99,
--   FALSE,
--   TRUE
-- ), (
--   '2021-12-05',
--   '2021-12-07',
--   'Company A',
--   'Good-looking carpet',
--   1099.82,
--   TRUE,
--   FALSE
-- ), (
--   '2022-02-21',
--   '2022-02-24',
--   'Max Schwarz',
--   'Lord of the Rings Collection',
--   69.99,
--   FALSE,
--   FALSE
-- ), (
--   '2021-10-14',
--   '2022-02-21',
--   'Max Schwarz',
--   'Lord of the Rings Movies',
--   25.99,
--   FALSE,
--   FALSE
-- ), (
--   '2022-06-01',
--   NULL,
--   'Max Schwarz',
--   'Another book',
--   8.99,
--   FALSE,
--   FALSE
-- ), (
--   '2021-08-17',
--   '2021-09-12',
--   'Company D',
--   'Vehicle Services',
--   4999.99,
--   TRUE,
--   TRUE
-- ), (
--   '2021-03-12',
--   '2022-06-19',
--   'Company D',
--   'Vehicle Fleet',
--   280000,
--   FALSE,
--   FALSE
-- );

-- ! INSERT WRONG ! 
-- INSERT INTO sales (
--   date_created,
--   date_fulfilled,
--   customer_name,
--   product_name,
--   volume
-- )
-- VALUES (
--   '2021-12-09',
--   '2021-12-17',
--   'Company Z',
--   'A Tuck',
--   109.0
-- );

-- ! UPDATE THE WRONG INSERTED DATA !
-- * UPDATING IN ACTION !!!
-- UPDATE sales
--   SET
--     product_name = 'A Truck',
--     volume = volume * 1000
--   WHERE id =  13;

-- ! DELETE DATA !
-- * DELETING IN ACTION 
-- DELETE FROM sales
--   WHERE id = 13;

-- ! SELECTING DATA !
-- * BASIC
-- SELECT * FROM sales;
-- * PICK COLUMNS (sequential)
-- SELECT
--   date_created, 
--   customer_name, 
--   product_name, 
--   volume
-- FROM 
--   sales;
-- * YOU CAN ALSO MAKE AN ALIAS FOR COLUMN NAME 
-- SELECT 
--   date_created,
--   customer_name, 
--   product_name, 
--   volume AS total_sales 
-- FROM sales;
-- * CAN ALSO ADD EXPRESSIONS HERE 
-- SELECT 
--   'HELLO WORLD',
--   100,
--   date_created,
--   customer_name, 
--   product_name, 
--   volume/1000 AS total_sales 
-- FROM sales;


-- ! BASIC FILTERING ! 
-- * using the WHERE clause
-- * check for equalitty 
-- SELECT * FROM sales
  -- WHERE volume > 1000; -- all values that is greater than 1000 
-- SELECT * FROM sales WHERE is_recurring IS TRUE;  -- all truethy values
-- SELECT * FROM sales  WHERE is_recurring = 't'; -- all truthy values (postgres and mysql)

-- * check for inequalitty
-- SELECT * FROM sales  WHERE is_recurring = 0; -- all falsy values (mysql only)

-- * check for range (between) eg. DATES
-- SELECT * FROM sales WHERE date_created > '2021-11-01' AND date_created < '2022-05-01';
-- SELECT * FROM sales WHERE date_created BETWEEN '2021-11-01' AND '2022-05-01';

-- * check for multiple conditions (combinations)
-- SELECT * FROM sales WHERE (is_disputed IS TRUE) AND (volume > 1000)  AND (id <= 10);

-- ! ADVANCE FILTERING !
-- * WORKING WITH TEXT 
-- SELECT * FROM sales WHERE customer_name = 'Jordan Tanaliga';
-- SELECT * FROM sales WHERE customer_name > 'Company A'; -- not optimal 

-- * WORKING WITH DATES AND DATE DIFFERENCES 
-- SELECT * , date_fulfilled - date_created AS working_days FROM sales;
-- SELECT * FROM sales WHERE date_fulfilled - date_created <= 5;

-- * ORDERING AND LIMITIG 
-- * SELECT + WHERE + ORDER BY + LIMIT
-- SELECT * FROM sales ORDER BY volume DESC; --the default is asc
-- SELECT * FROM sales ORDER BY volume DESC  LIMIT 10;
-- SELECT * FROM sales WHERE is_disputed IS FALSE ORDER BY volume DESC  LIMIT 10;
-- SELECT *,date_fulfilled - date_created AS WORKING_DAYS  FROM sales WHERE date_fulfilled - date_created <= 300  ORDER BY volume DESC  LIMIT 10;

-- * can have multiple "order by" but the first one always matters (IF THERE ARE THE SAME VALUES IT WILL GO TO THE NEXT "order by") 
-- SELECT * FROM sales WHERE is_disputed IS FALSE ORDER BY volume DESC, customer_name  LIMIT 10;

-- * can also use offset (means skipping the result depending on the value that is set)
-- SELECT * FROM sales ORDER BY volume DESC  LIMIT 5 OFFSET 3;

-- * GETTING A DISTINCT VALUES 
-- SELECT DISTINCT customer_name FROM sales; --the result set is the company name-- no duplicates
-- SELECT DISTINCT customer_name FROM sales ORDER BY customer_name;

-- * CAN ALSO CONTAINS SUB-QUERIES 
-- * Every derived table must have its own alias
-- SELECT customer_name, product_name FROM (SELECT * FROM sales WHERE volume > 1000) AS base_result;

-- * USING "CREATE VIEW" for reusability ((act like as a snippets))
-- CREATE VIEW AS high_value_sales AS SELECT * FROM sales WHERE volume > 1000;





-- ! EXERCISE !!! 
-- ! Task 1: create a database 
-- CREATE DATABASE online_shop; -- postgres

-- ! Task 2 + Task 3: create a table

-- CREATE TABLE IF NOT EXISTS products (
--   name VARCHAR(200),
--   price NUMERIC(10,2),
--   description TEXT,
--   amount_in_stock SMALLINT,
--   image_path VARCHAR(500) 
-- )


-- ! Task 4: inserting a dummy data

-- INSERT INTO products 
-- VALUES(
--   'Guitar',
--   12.99,
--   'This is a guitar',
--   5,
--   'uploads/products/123/pic.jpeg'
-- )

-- ! Task 5: add some constraints that make sense --postgres
-- Step 1: Modify column types and NOT NULL constraints
-- ALTER TABLE products
--   ALTER COLUMN name TYPE VARCHAR(200),
--   ALTER COLUMN name SET NOT NULL,
--   ALTER COLUMN price TYPE NUMERIC(10,2),
--   ALTER COLUMN price SET NOT NULL,
--   ALTER COLUMN description SET NOT NULL,
--   ALTER COLUMN amount_in_stock TYPE SMALLINT;

-- Step 2: Add CHECK constraints
-- ALTER TABLE products
--   ADD CONSTRAINT price_positive CHECK (price > 0),
--   ADD CONSTRAINT amount_positive_or_zero CHECK (amount_in_stock >= 0);




-- ! selecting all records
-- SELECT * FROM users;
-- SELECT * FROM employers;
-- SELECT AVG(yearly_salary) FROM users;

-- ! primary keys 
-- DROP TABLE users;
-- DROP TABLE employers;
-- DROP TABLE conversations;

-- CREATE TYPE employment_status as ENUM('self-employed', 'employed', 'unemployed')

-- CREATE TABLE users (
--   id SERIAL PRIMARY KEY 
--   full_name VARCHAR(300) NOT NULL,
--   yearly_salary INT CHECK (yearly_salary > 0),
--   current_status employment_status 
-- )



-- ! updating the tables and columns
-- * first the name of the table and then modified the column
-- ALTER TABLE employers
-- ALTER COLUMN yearly_revenue SET DATA TYPE FLOAT; -- postgresql
-- ALTER TABLE users
-- ALTER COLUMN full_name SET DATA TYPE VARCHAR(300) -- postgresql
-- ALTER TABLE users 
-- ALTER COLUMN full_name SET NOT NULL,
-- ALTER COLUMN current_status SET NOT NULL; -- postgresql

-- UPDATE users 
-- SET yearly_salary = NULL
-- WHERE full_name = 'Iza Tanaliga';
-- ALTER TABLE users
-- ADD CONSTRAINT yearly_salary_positive CHECK (yearly_salary > 0)


-- ! inserting data to the table conversations
-- INSERT INTO conversations (user_name, employer_name, message)
-- VALUES(
--   'Jordan Tanaliga',
--   'Learning Inc',
--   'Hi, I like learning'
-- );

-- ! creating conversations table
-- CREATE TABLE "conversations" (
--   user_name VARCHAR(255),
--   employer_name VARCHAR(250),
--   "message" TEXT,
--   date_sent TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- );

-- ! inserting data to the table employers
-- INSERT INTO employers (company_name, company_address, yearly_revenue, is_hiring)  VALUES (
--   'Learning Inc',
--     'Education St. London',
--     0.87, 
--     TRUE
-- );
-- INSERT INTO employers (company_name, company_address, yearly_revenue)  VALUES (
--   'Big Oil Inc',
--     'Slippery St. Manila',
--     112.55
-- );
-- INSERT INTO employers (company_name, company_address, yearly_revenue, is_hiring)  VALUES (
--   'Hipster Inc',
--     'Avocado St. Berlin',
--     5.12, 
--     TRUE
-- );


-- ! creating employer table 
-- CREATE TABLE employers (
--   company_name VARCHAR(250),
--   company_address VARCHAR(300),
--   -- yearly_revenue FLOAT(5,2) -- Approximation, Allowed: 123.12 , 12.1 | Not allowed: 1234.12, 1.123 
--   yearly_revenue NUMERIC(5, 2), -- Precission, -- Exact value
--   is_hiring BOOLEAN DEFAULT FALSE
-- );


-- ! dropping tables
-- DROP TABLE conversations;
-- DROP TABLE employers;


-- ! inserting data to the table user
-- INSERT INTO users (full_name, yearly_salary, current_status) VALUES (
--     'Jaby Tanaliga',
--     25000,
--     'self-employed'
-- );


-- ! creating table
-- * We have to create a custom time first --
-- CREATE TYPE employment_status as ENUM('employed', 'unemployed', 'self-employed');
-- CREATE TABLE IF NOT EXISTS users (
--   full_name VARCHAR(255),
--   yearly_salary INT,
--   current_status employment_status 
  
-- );

-- ! creating database 
-- CREATE DATABASE IF NOT EXISTS talently; 


-- ! show the list of database 
-- SELECT datname FROM pg_database;


