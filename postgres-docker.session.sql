
-- ! SELECT VERSION 
-- SELECT version();


-- ! NORMALIZATIONS AND RELATIONS
-- * create database
-- CREATE DATABASE relations;
-- * create tables
-- CREATE TABLE users(
--   id SERIAL PRIMARY KEY ,
--   first_name VARCHAR(300) NOT NULL,
--   last_name VARCHAR(300) NOT NULL,
--   email VARCHAR(300) NOT NULL,
--   address_id INT NOT NULL
-- );
-- CREATE TABLE "addresses"(
--   id SERIAL PRIMARY KEY ,
--   street VARCHAR(300) NOT NULL,
--   house_number VARCHAR(300) NOT NULL,
--   city_id INT NOT NULL
-- );
-- CREATE TABLE cities(
--   id SERIAL PRIMARY KEY,
--   "name" VARCHAR(300) NOT NULL
-- );
 -- * showing all tables
-- SELECT tablename
-- FROM pg_catalog.pg_tables
-- WHERE schemaname = 'public';
-- * inserting a data to table 
-- INSERT INTO cities(name)
-- VALUES('Berlin'), ('New York'), ('London'), ('Manila');

-- INSERT INTO addresses(street, house_number, city_id)
-- VALUES
-- ('Teststreet', '8A', 3),
-- ('Some street', '12b', 1),
-- ('Some street again', 'L-a', 3),
-- ('Some street again and again', 'K-24', 2);

-- INSERT INTO users (first_name, last_name, email, address_id)
-- VALUES 
-- ('Jordan', 'Tanaliga', 'jordan@mail.com',2),
-- ('Chris', 'Martin', 'chris@mail.com',4),
-- ('Jonny', 'Buckland', 'jonny@mail.com',3);


-- * querying data (inner-join)
-- SELECT u.id as user_id, first_name, last_name, email, street, house_number , c.name AS city_name FROM users AS u
-- INNER JOIN addresses AS a ON u.address_id = a.id
-- INNER JOIN cities AS c ON a.city_id = c.id;

-- * can also do filtering in JOINS
-- SELECT u.id as user_id, first_name, last_name, email, street, house_number , c.name AS city_name FROM users AS u
-- INNER JOIN addresses AS a ON u.address_id = a.id
-- INNER JOIN cities AS c ON a.city_id = c.id
-- WHERE c.id = 1 OR c.id = 2 ORDER BY user_id DESC;

-- * using LEFT JOIN 
-- SELECT * FROM addresses AS a
-- LEFT JOIN users AS u ON a.id = u.address_id
-- LEFT JOIN cities AS c ON c.id = a.city_id
-- ;

-- * MORE EXAMPLES (data inserted)
-- SELECT CONCAT(first_name,' ',last_name) AS full_name , name AS city_name, a.street , a.house_number FROM cities AS c
-- LEFT JOIN addresses AS a ON a.city_id = c.id
-- LEFT JOIN users AS u ON u.address_id = a.id
-- ;





-- ! showing tables
-- SELECT tablename
-- FROM pg_catalog.pg_tables
-- WHERE schemaname = 'public';



-- ! show the list of database 
-- SELECT datname FROM pg_database;


