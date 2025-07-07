

-- Todo: Create tables


CREATE TABLE payment_methods (
    id SERIAL PRIMARY KEY,
    name VARCHAR(200)
);

CREATE TABLE tables (
 id SERIAL PRIMARY KEY,
    num_seats INT,
    category VARCHAR(200)
);

CREATE TABLE bookings (
 id SERIAL PRIMARY KEY,
    booking_date DATE NOT NULL,
    num_guests INT NOT NULL,
    amount_billed NUMERIC(6, 2)  NOT NULL,
    amount_tipped NUMERIC(6, 2),
    payment_id INT REFERENCES payment_methods,
    table_id INT REFERENCES tables
);



-- TODO: Insert 

INSERT INTO payment_methods (
    name
)
VALUES (
    'Cash'
),
(
    'Credit Card'
);

INSERT INTO tables (
    num_seats,
    category
)
VALUES (
    2,
    'small'
),
(
    2,
    'small'
),
(
    4,
    'medium'
),
(
    6,
    'large'
),
(
    8,
    'large'
);

INSERT INTO bookings (
    booking_date,
    num_guests,
    amount_billed,
    amount_tipped,
    payment_id,
    table_id
)
VALUES(
    '2021-11-04',
    2,
    19.90,
    0.10,
    2,
    1
), (
    '2021-11-04',
    1,
    12.90,
    0.00,
    2,
    2
), (
    '2021-11-05',
    2,
    15.50,
    NULL,
    1,
    1
), (
    '2021-11-05',
    7,
    113.40,
    6.60,
    1,
    5
), (
    '2021-11-05',
    6,
    140.90,
    10.10,
    1,
    4
), (
    '2021-11-05',
    7,
    98.60,
    1.40,
    1,
    5
), (
    '2021-11-05',
    4,
    60.50,
    4.50,
    2,
    3
), (
    '2021-11-06',
    5,
    86.10,
    4.90,
    2,
    4
), (
    '2021-11-06',
    3,
    49.70,
    5.30,
    2,
    4
), (
    '2021-11-06',
    1,
    15.90,
    2.10,
    1,
    2
), (
    '2021-11-06',
    7,
    242.60,
    12.40,
    1,
    5
), (
    '2021-11-06',
    6,
    180.00,
    20.00,
    1,
    5
), (
    '2021-11-06',
    3,
    38.70,
    11.30,
    2,
    3
), (
    '2021-11-06',
    2,
    25.60,
    9.40,
    1,
    1
), (
    '2021-11-06',
    3,
    60.50,
    14.50,
    1,
    4
), (
  '2021-11-07',
    2,
    26.40,
    1.60,
    2,
    1
), (
  '2021-11-07',
    2,
    35.50,
    4.50,
    2,
    2
), (
  '2021-11-07',
    5,
    101.90,
    NULL,
    1,
    4
), (
  '2021-11-07',
    6,
    130.10,
    10,
    1,
    5
), (
  '2021-11-08',
    2,
    38.60,
    0.40,
    2,
    2
);


-- * COUNT(*)
SELECT COUNT(*) FROM bookings;
SELECT COUNT(*) FROM payment_methods;
SELECT COUNT(*) FROM tables;

SELECT COUNT(amount_tipped) FROM bookings
SELECT COUNT(DISTINCT booking_date) FROM bookings;

-- * MIN() and MAX()
SELECT MAX(num_seats) FROM tables;
SELECT MIN(num_seats) FROM tables;
SELECT MAX(amount_billed) AS billed, MAX(amount_tipped) AS tipped 
FROM bookings;

SELECT MIN(category) AS big, MAX(category) AS small 
FROM  tables;
SELECT MIN(booking_date) AS big, MAX(booking_date) AS small 
FROM  bookings;

-- * SUM(), AVG(), and ROUND()
SELECT SUM(num_guests) AS total_guests FROM bookings;
SELECT AVG(num_guests) AS average_guests FROM bookings;
SELECT ROUND(AVG(num_guests), 2) AS average_guests FROM bookings;
SELECT SUM(amount_billed) AS total_billed FROM bookings;
SELECT AVG(amount_billed) AS average_billed FROM bookings;
SELECT ROUND(AVG(amount_billed), 2) AS average_billed FROM bookings;
SELECT SUM(amount_tipped) AS total_tipped FROM bookings;
SELECT AVG(amount_tipped) AS average_tipped FROM bookings;
SELECT ROUND(AVG(amount_tipped), 2) AS average_tipped FROM bookings;  
SELECT MAX(b.num_guests) AS number_of_guests, MAX(num_seats) AS number_of_seats 
  FROM bookings AS b
    INNER JOIN tables AS t ON b.table_id = t.id;

SELECT MAX(b.num_guests) AS number_of_guests, MAX(num_seats) AS number_of_seats 
  FROM bookings AS b
    INNER JOIN tables AS t ON b.table_id = t.id
    INNER JOIN payment_methods AS p ON b.payment_id = p.id 
      WHERE t.num_seats < 5 AND p.name = 'Cash';

-- * GROUP BY
SELECT booking_date, SUM(num_guests) AS total_guests 
  FROM bookings 
    GROUP BY booking_date;

SELECT booking_date, SUM(num_guests) AS total_guests 
  FROM bookings 
    INNER JOIN payment_methods AS p ON p.name = 'Cash'
    GROUP BY booking_date

SELECT booking_date, SUM(num_guests) AS total_guests, payment_methods.name  AS payment_method,
SUM(amount_billed) AS higher_than_20
FROM bookings 
INNER JOIN payment_methods ON payment_methods.id = bookings.payment_id
WHERE amount_billed > 100.00
GROUP BY booking_date, payment_methods.name
;

SELECT *
FROM payment_methods AS p 
  INNER JOIN bookings AS b ON p.id = b.payment_id
  INNER JOIN tables AS t ON b.table_id = t.id;

SELECT 
    b.booking_date,
    p.name AS payment_method,
    t.category AS table_size,
    COUNT(*) AS total_bookings,
   COALESCE(ROUND(AVG(amount_tipped), 2),0) AS tipped
FROM payment_methods AS p
INNER JOIN bookings AS b ON p.id = b.payment_id
INNER JOIN tables AS t ON b.table_id = t.id
GROUP BY b.booking_date, p.name, t.category
ORDER BY booking_date;

--* WHERE
SELECT booking_date, COUNT(booking_date)
  FROM bookings 
    WHERE amount_billed > 30 
      GROUP BY booking_date;

-- * HAVING 
SELECT 
    b.booking_date,
    p.name AS payment_method,
    t.category AS table_size,
    t.num_seats AS num_of_seats,
    COUNT(*) AS total_bookings,
    COALESCE(ROUND(AVG(amount_tipped), 2),0) AS tipped
FROM payment_methods AS p
INNER JOIN bookings AS b ON p.id = b.payment_id
INNER JOIN tables AS t ON b.table_id = t.id
GROUP BY b.booking_date, p.name, t.category,   t.num_seats,  b.amount_tipped
HAVING t.num_seats = 8 AND b.amount_tipped < 5
ORDER BY booking_date;

-- * NESTED SUB QUERIES 

SELECT booking_date, SUM(amount_billed) as TOTAL_AMOUNT_BILLED 
  FROM bookings
  GROUP BY booking_date

SELECT MIN(daily_sum)
FROM
(
    SELECT booking_date, SUM(amount_billed) AS daily_sum
    FROM bookings
    GROUP BY booking_date
) AS daily_table


SELECT MIN(TOTAL_AMOUNT_BILLED) AS min_billed, 
       MAX(TOTAL_AMOUNT_BILLED) AS max_billed
FROM
(
    SELECT booking_date, SUM(amount_billed) as TOTAL_AMOUNT_BILLED 
    FROM bookings
    GROUP BY booking_date
);


SELECT booking_date 
FROM bookings 
GROUP BY booking_date 
HAVING SUM(amount_billed) =  (

      SELECT MIN(daily_sum)
    FROM
    (
        SELECT booking_date, SUM(amount_billed) AS daily_sum
        FROM bookings
        GROUP BY booking_date
    ) AS daily_table
)


-- * WINDOW FUNCTIONS
SELECT booking_date, amount_tipped, SUM(amount_tipped) OVER() FROM bookings;

SELECT booking_date, amount_tipped, SUM(amount_tipped) OVER(PARTITION BY booking_date) FROM bookings;

SELECT booking_date, amount_tipped, SUM(amount_tipped) OVER(PARTITION BY booking_date ORDER BY amount_billed) 
FROM bookings;

SELECT booking_date, amount_tipped, RANK() OVER(PARTITION BY booking_date ORDER BY amount_tipped DESC) 
FROM bookings;
