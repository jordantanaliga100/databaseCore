
-- ! SELECT VERSION 
-- SELECT version();


-- !  A BIGGER EXAMPLE

-- TODO: create tables and links them 
CREATE TABLE projects(
  id SERIAL PRIMARY KEY,
  title VARCHAR(300) NOT NULL,
  deadline DATE
)

CREATE TABLE company_buildings (
  id SERIAL PRIMARY KEY,
  name VARCHAR(300) NOT NULL
);
CREATE TABLE teams (
  id SERIAL PRIMARY KEY,
  name VARCHAR(300) NOT NULL,
  building_id INT,
    FOREIGN KEY (building_id) REFERENCES company_buildings(id) ON DELETE SET NULL
);

-- * if the employee is deleted the intranet_accounts associated with the employee will also be deleted 
CREATE TABLE employees (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(300) NOT NULL,
  last_name VARCHAR(300) NOT NULL,
  birthdate DATE NOT NULL,
  email VARCHAR(300) UNIQUE NOT NULL,
  team_id INT DEFAULT 1,
    FOREIGN KEY (team_id) REFERENCES teams(id) ON DELETE SET DEFAULT
);
-- * if the employee is deleted this will also be deleted
CREATE TABLE intranet_accounts ( 
  id SERIAL PRIMARY KEY,
  email VARCHAR(300),
  password VARCHAR(300) NOT NULL,
    FOREIGN KEY (email) REFERENCES employees (email) ON DELETE CASCADE
);
-- * create a intersection table (many-to-many) - projects and employees
CREATE TABLE projects_employees (
  id SERIAL PRIMARY KEY,
  employee_id INT,
    FOREIGN KEY (employee_id) REFERENCES employees(id) ON DELETE CASCADE,
  project_id INT,
    FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE
)


-- TODO: insert data to employees table
INSERT INTO company_buildings (name)
VALUES 
  ('Main Building'), 
  ('Research Lab'), 
  ('Darkroom');

INSERT INTO teams (name, building_id)
VALUES 
  ('Admin', 1), 
  ('Data Analysts', 3),
  ('R&D', 2);

INSERT INTO employees 
  (first_name, last_name, birthdate, email, team_id)
VALUES 
  ('Julie', 'Barnes', '1988-10-01', 'julie@test.com', 3),
  ('Max', 'Schwarz', '1989-06-10', 'max@test.com', 1),
  ('Manuel', 'Lorenz', '1987-01-29', 'manu@test.com', 2),
  ('Michael', 'Smith', '1977-05-12', 'michael@test.com', 2);

INSERT INTO intranet_accounts (email, password)
VALUES 
  ('max@test.com', 'abcae1'),
  ('manu@test.com', 'fdasfdas1'),
  ('julie@test.com', 'adsfsaf3'),
  ('michael@test.com', 'adsfsaf3');

INSERT INTO projects (title, deadline)
VALUES 
  ('Mastering SQL', '2024-10-01'),
  ('New Hire Onboarding', '2022-02-28'),
  ('New Course Evaluation', '2022-01-01');

INSERT INTO projects_employees (employee_id, project_id)
VALUES 
  (1, 2),
  (2, 2),
  (1, 3),
  (3, 1),
  (3, 3),
  (2, 3);

-- TODO: Querying data
-- ? BASICS
SELECT * FROM employees;
SELECT * FROM intranet_accounts;
SELECT * FROM teams;
SELECT * FROM company_buildings;

-- ? ABOUT THE MODULE
-- * getting all the employees with projects 
SELECT e.id AS emp_id, e.first_name, e.last_name, p.title, p.deadline 
FROM employees AS e
LEFT JOIN projects_employees AS pe ON pe.employee_id = e.id
LEFT JOIN projects AS p ON pe.project_id = p.id
; 

-- * getting all the employees with or without projects projects 
SELECT e.id AS emp_id, e.first_name, e.last_name, p.title, p.deadline 
FROM employees AS e
INNER JOIN projects_employees AS pe ON pe.employee_id = e.id
INNER JOIN projects AS p ON pe.project_id = p.id
; 

-- * adding WHERE clause
SELECT e.id AS employee_id, e.first_name, e.last_name, t.name 
FROM employees AS e 
INNER JOIN teams AS t ON e.team_id = t.id
WHERE t.id = 2
;

-- * find emp with building no. 3
SELECT  e.id AS employee_id,e.email, e.first_name, e.last_name,  t.id AS team_id, t.name AS team_name, b.id  AS building_id, b.name AS building_name 
FROM employees AS e 
INNER JOIN teams AS t ON e.team_id = t.id
INNER JOIN company_buildings AS b ON t.building_id = b.id
WHERE b.id = 3
ORDER BY e.email
; 


-- * deleting some data (referential-integrity)
DELETE FROM company_buildings
WHERE id = 2 ;

DELETE FROM teams
WHERE id = 2;

DELETE FROM employees
WHERE id = 1;


-- ! DELETING ROWS AND START THE ID TO 1 
TRUNCATE intranet_accounts, employees, teams, company_buildings RESTART IDENTITY CASCADE;


-- ! showing tables
-- SELECT tablename
-- FROM pg_catalog.pg_tables
-- WHERE schemaname = 'public';


-- ! show the list of database 
-- SELECT datname FROM pg_database;


