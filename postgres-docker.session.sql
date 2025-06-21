
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
