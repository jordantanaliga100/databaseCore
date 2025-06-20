
--  selecting all records
SELECT * FROM users;

--  creating employer table 
CREATE TABLE employers (
  company_name VARCHAR(250)
  company_address VARCHAR(300)
  -- yearly_revenue FLOAT(5,2)
  yearly_revenue NUMERIC(5,2)
);


-- inserting data to the table user
-- INSERT INTO users (full_name, yearly_salary, current_status)  VALUES (
--   'Kimmy Aguilar',
--     1000,
--     'self-employed'
-- );

-- creating table
-- CREATE TABLE users (
--   full_name VARCHAR(255),
--   yearly_salary INT,
--   current_status ENUM('employed', 'unemployed', 'self-employed')
-- );


-- creating database 
-- CREATE DATABASE IF NOT EXISTS talently; 

