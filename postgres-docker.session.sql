
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




-- ! showing tables
-- SELECT tablename
-- FROM pg_catalog.pg_tables
-- WHERE schemaname = 'public';



-- ! show the list of database 
-- SELECT datname FROM pg_database;


