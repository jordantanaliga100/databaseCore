
-- ! SELECT VERSION 
-- SELECT version();

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
--     'Lara Tanaliga',
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


