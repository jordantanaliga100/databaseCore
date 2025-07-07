
-- ! SELECT VERSION 
-- SELECT version();

-- ! showing tables
-- SHOW TABLES;


-- ! show the list of the database
-- SHOW DATABASES;

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
  INNER JOIN tables AS t ON b.table_id = t.id
  ;

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
