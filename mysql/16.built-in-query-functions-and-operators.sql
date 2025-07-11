

-- Todo: BUILTIN QUERY FUNCTIONS
-- CREATE DATABASE gym;

CREATE TABLE memberships (
    id INT PRIMARY KEY AUTO_INCREMENT,
    membership_start DATE,
    membership_end DATE,
    last_checkin TIMESTAMP,
    last_checkout TIMESTAMP,
    consumption NUMERIC(5, 2),
    first_name VARCHAR(200),
    last_name VARCHAR(200),
    price NUMERIC(5, 2),
    billing_frequency INT,
    gender VARCHAR(200)
);

CREATE TABLE customers(
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(200),
    last_name VARCHAR(200),
    email VARCHAR(200)
);

CREATE TABLE orders(
    id INT PRIMARY KEY AUTO_INCREMENT,
    amount_billed NUMERIC(5, 2),
    customer_id INT REFERENCES customers
);

INSERT INTO memberships (
    membership_start,
    membership_end,
    last_checkin,
    last_checkout,
    consumption,
    first_name,
    last_name,
    price,
    billing_frequency,
    gender

)
VALUES (
    '2021-10-01',
    NULL,
    '2021-10-01 05:17:36',
    '2021-10-01 06:20:45',
    26.49,
    'Max',
    'Schwarz',
    19.99,
    12,
    'male'
),(
    '2020-05-10',
    '2022-05-09',
    '2021-11-03 10:01:56',
    '2021-11-03 14:30:00',
    100.26,
    'Manu',
    'Lorenz',
    199.99,
    1,
    'male'
),(
    '2021-02-18',
    '2022-02-17',
    '2021-10-29 15:26:05',
    '2021-10-29 17:01:33',
    5.10,
    'Julie',
    'Barnes',
    199.99,
    1,
    'female'
);

INSERT INTO customers(
    first_name,
    last_name,
    email
)
VALUES(
    'Max',
    'Schwarz',
    'max@test.com'
),(
    'Manu',
    'Lorenz',
    'manu@test.com'
),(
    'Julia',
    'Meyers',
    'juli@test.com'
);

INSERT INTO orders(
   amount_billed,
   customer_id 
)
VALUES(
    48.99,
    1
), (
    27.45,
    2
), (
    19.49,
    1
), (
    8.49,
    3
);

INSERT INTO customers(
    first_name,
    last_name,
    email
)
VALUES(
    'Ken',
    'Brooks',
    'ken@test.com'
);


-- Todo: SQL Functions

SELECT price * billing_frequency AS annual_revenue FROM memberships;


-- ! Number Functions
--  ceil() - rounds up 
--  floor() - round down
--  round() - standard round 
--  trunc() - remove decimals | always needs a seconds argument
SELECT ceil(consumption) FROM memberships;
SELECT consumption FROM memberships;

-- ! String Functions
-- concat -- combine strings
SELECT concat(first_name,' ',last_name) AS full_name FROM memberships;
SELECT concat('$', price) FROM memberships;

-- lower - turns all chars to lowecase text input
INSERT INTO memberships (
    membership_start,
    membership_end,
    last_checkin,
    last_checkout,
    consumption,
    first_name,
    last_name,
    price,
    billing_frequency,
    gender

)
VALUES (
    '2021-10-18',
    '2021-11-18',
    '2021-11-01 08:56:01',
    '2021-11-01 09:20:12',
    NULL,
    'John',
    'Doe',
    19.99,
    12,
    LOWER(
    'DivErs'
    )
);

-- filter 
SELECT * from memberships WHERE length(first_name) < 7;

-- remove unwanted chars | whitepsace
INSERT INTO memberships (
    membership_start,
    membership_end,
    last_checkin,
    last_checkout,
    consumption,
    first_name,
    last_name,
    price,
    billing_frequency,
    gender

)
VALUES (
    '2021-05-02',
    NULL,
    '2021-06-05 11:52:25',
    '2021-06-05 11:58:08',
    NULL,
    'Monti',
    'Durns',
    199.99,
      
    1,
    TRIM(
    BOTH ' ' from
    'male   '
    )
);


-- ! Date and Time Functions
SELECT * FROM memberships;
-- extract individually
SELECT 
  EXTRACT(MONTH FROM last_checkin) AS month,
  EXTRACT(YEAR FROM last_checkin) AS year,
  last_checkin
FROM memberships;


-- getting the day in the week | by numbers 
SELECT 
  WEEKDAY (last_checkin) + 1  AS week_day,
  last_checkin
FROM memberships;

-- extract amd convert 
SELECT CONVERT(last_checkin, DATE), 
       CONVERT(last_checkin, TIME)
        from memberships;

-- get intervals
SELECT TIMESTAMPDIFF(MINUTE, last_checkin, last_checkout) FROM memberships;

-- interval of dates
SELECT DATEDIFF(NOW(), membership_end) FROM memberships;

-- * ANOTHER LOOK AT INTERVALS
-- using plus operator doesnt work
SELECT membership_start + 7, membership_start FROM memberships;


-- ! LIKE and Patten matching
-- always returns booleans
SELECT first_name LIKE 'Max', first_name FROM memberships;
SELECT first_name LIKE '%o%', first_name FROM memberships;
-- LIKE works in mysql
SELECT first_name FROM memberships WHERE first_name LIKE 'm%';

-- ! Subquery Expressions
-- Todo: using EXISTS
-- usual query
SELECT first_name, last_name FROM customers WHERE email = 'max@test.com'

SELECT EXISTS(
  SELECT first_name, last_name FROM customers WHERE email = 'max@test.com'
)
-- the usual use case 
SELECT id FROM orders AS o  WHERE EXISTS(
  SELECT email FROM customers as c WHERE o.customer_id = c.id AND c.email = 'max@test.com'
)

-- Todo: using IN
-- using joins 
SELECT c.email, c.first_name FROM customers AS c  
INNER JOIN orders AS o ON c.id = o.customer_id;

-- usual query
SELECT id FROM customers where first_name = 'Max' or first_name 
= 'Manu'
-- using IN operator
SELECT id , first_name from customers where first_name  IN ('Max', 'Manu')
-- using IN in subquery
SELECT email FROM customers WHERE id IN(
  SELECT customer_id FROM orders
)

-- ! Introduction to Conditional Expressions
-- careful about the order
SELECT 
  amount_billed,
    CASE 
      WHEN amount_billed > 30  THEN 'Good Day'
      WHEN amount_billed < 30 AND amount_billed > 20 THEN 'Normal Day'
      ELSE 'Bad Day' 
    END 
  FROM orders;

  -- Todo: make the weekday numbers to become weekdays (literal) MYSQL
-- USUAL CODE 
SELECT 
    DAYNAME(last_checkin) AS weekday,  -- 👈 ito ang maglalabas ng literal na weekday
    last_checkin
FROM memberships;


-- 0 = Monday
  SELECT WEEKDAY(last_checkin) AS weekday, last_checkin FROM memberships;

-- using CASE and WHEN sa conditions
SELECT 
    CASE WEEKDAY(last_checkin) + 1
        WHEN 1 THEN 'Monday'
        WHEN 2 THEN 'Tuesday'
        WHEN 3 THEN 'Wednesday'
        WHEN 4 THEN 'Thursday'
        WHEN 5 THEN 'Friday'
        WHEN 6 THEN 'Saturday'
        WHEN 7 THEN 'Sunday'
    END AS weekday,
    last_checkin
FROM memberships;