
-- creating table
-- * We have to create a custom time first --
CREATE TYPE employment_status as ENUM('employed', 'unemployed', 'self-employed');
CREATE TABLE users (
  full_name VARCHAR(255),
  yearly_salary INT,
  current_status employment_status 
);

