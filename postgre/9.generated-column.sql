-- !generated columns

CREATE DATABASE talently;

-- Drop old tables and types if neede
DROP TABLE IF EXISTS conversations;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS employers;
DROP TYPE IF EXISTS employment_status;

-- Create ENUM
CREATE TYPE employment_status AS ENUM('self-employed', 'employed', 'unemployed');

-- Users table
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(200) NOT NULL,
  last_name VARCHAR(200) NOT NULL,
  yearly_salary INT CHECK (yearly_salary > 0),
  current_status employment_status,
  full_name VARCHAR(401) GENERATED ALWAYS AS (first_name || ' ' || last_name) STORED
);

-- Employers table
CREATE TABLE employers (
  id SERIAL PRIMARY KEY,
  company_name VARCHAR(300) NOT NULL,
  company_address VARCHAR(300) NOT NULL,
  yearly_revenue NUMERIC(12, 2) CHECK (yearly_revenue > 0),
  is_hiring BOOLEAN DEFAULT FALSE
);

-- Conversations table with foreign keys
CREATE TABLE conversations (
  id SERIAL PRIMARY KEY,
  user_id INT,
  employer_id INT,
  message TEXT NOT NULL
);

-- Insert sample data
INSERT INTO users (first_name, last_name, yearly_salary, current_status) 
VALUES ('Iza', 'Tejoso', 13000, 'self-employed');


