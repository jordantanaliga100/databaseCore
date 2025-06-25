-- ! NORMALIZATIONS AND RELATIONS
-- * create database
-- CREATE DATABASE relations;
-- * create tables
-- CREATE TABLE users(
--   id INT PRIMARY KEY AUTO_INCREMENT,
--   first_name VARCHAR(300) NOT NULL,
--   last_name VARCHAR(300) NOT NULL,
--   email VARCHAR(300) NOT NULL,
--   address_id INT NOT NULL
-- );
-- CREATE TABLE `addresses` (
--   id INT PRIMARY KEY AUTO_INCREMENT,
--   street VARCHAR(300) NOT NULL,
--   house_number VARCHAR(300) NOT NULL,
--   city_id INT NOT NULL
-- );
-- CREATE TABLE `cities`(
--   id INT PRIMARY KEY AUTO_INCREMENT,
--   `name` VARCHAR(300) NOT NULL
-- );
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

-- * CROSS JOIN
-- SELECT * FROM users CROSS JOIN addresses;

-- * UNION (works with the same number of columns and tables)
-- SELECT * FROM users WHERE id < 4
-- UNION 
-- SELECT * FROM users WHERE id > 5
-- ;

-- ! MORE JOINS 

-- INSERT INTO cities (name)
-- VALUES ('Munich'), ('Rome'), ('Tokyo'), ('Washington, D.C.');

-- INSERT INTO addresses (street, house_number, city_id)
-- VALUES 
--   ('Beerstreet', '91', 4),
--   ('Beerstreet', '12', 4),
--   ('Pizzastreet', '1', 5),
--   ('Burgerstreet', '9', 2),
--   ('Anotherstreet', '12', 1),
--   ('Smallstreet', '11', 3);


-- INSERT INTO users (first_name, last_name, email, address_id)
-- VALUES 
--   ('Marina', 'Marks', 'marina@test.com', 2),
--   ('Hans', 'Mayer', 'hansm@test.com', 5),
--   ('Maria', 'Marionatti', 'maria@test.com', 7),
--   ('Michael', 'Smith', 'michael@test.com', 8);


-- DROP TABLE cities;
-- DROP TABLE addresses;
-- DROP TABLE users;
