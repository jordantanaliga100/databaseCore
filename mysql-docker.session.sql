
-- ! SELECT VERSION 
-- SELECT version();

-- ! Task 1: create a database 
-- CREATE DATABASE online_shop; --mysql

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

-- ! Task 5: add some constraints that make sense --mysql
  -- step 1: Modify column types and NOT NULL constraints
-- ALTER TABLE products
--   MODIFY COLUMN name VARCHAR(200) NOT NULL,
--   MODIFY COLUMN price NUMERIC(10,2) NOT NULL,
--   MODIFY COLUMN description TEXT NOT NULL,
--   MODIFY COLUMN amount_in_stock SMALLINT ;

  -- Step 2: Add CHECK constraints
-- ALTER TABLE products
--   ADD CONSTRAINT price_positive CHECK (price > 0),
--   ADD CONSTRAINT amount_positive_or_zero CHECK(amount_in_stock >= 0);








-- ! selecting all records
-- SELECT * FROM users;
-- SELECT * FROM employers;
-- SELECT AVG(yearly_salary) FROM users;


-- ! primary keys 
-- DROP TABLE users;
-- DROP TABLE employers;
-- DROP TABLE conversations;


-- CREATE TABLE users (
--   id INT PRIMARY KEY AUTO_INCREMENT,
--   full_name VARCHAR(300) NOT NULL,
--   yearly_salary INT CHECK (yearly_salary > 0),
--   current_status ENUM('self-employed', 'employed', 'unemployed')
-- )




-- ! updating the tables and columns
-- * first the name of the table and then modified the column
-- ALTER TABLE employers 
-- MODIFY COLUMN yearly_revenue FLOAT(5,2); -- mysql
-- ALTER TABLE users
-- MODIFY COLUMN full_name VARCHAR(300); --mysql
-- ALTER TABLE users 
-- MODIFY COLUMN full_name VARCHAR(300 ) NOT NULL,
-- MODIFY COLUMN current_status ENUM('employed', 'unemployed', 'self-employed') NOT NULL; -- mysql

-- UPDATE users 
-- SET yearly_salary = NULL
-- WHERE full_name = 'Kyla Montas';
-- ALTER TABLE users
-- ADD CONSTRAINT yearly_salary_positive CHECK (yearly_salary > 0)


-- ! inserting data to the table conversations
-- INSERT INTO conversations (user_name, employer_name, message)
-- VALUES(
--   'Kimmy Aguilar',
--   'Learning Inc',
--   'Hi, I like learning'
-- );


-- ! creating conversations table
-- CREATE TABLE `conversations` (
--   user_name VARCHAR(255),
--   employer_name VARCHAR(250),
--   `message` TEXT,
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
-- INSERT INTO users (full_name, yearly_salary, current_status)  VALUES (
--   'Kimmy Aguilar',
--     1000,
--     'self-employed'
-- );


-- ! creating table
-- CREATE TABLE users (
--   full_name VARCHAR(255),
--   yearly_salary INT,
--   current_status ENUM('employed', 'unemployed', 'self-employed')
-- );


-- ! creating database 
-- CREATE DATABASE IF NOT EXISTS talently; 

