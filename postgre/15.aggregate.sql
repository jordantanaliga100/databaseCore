

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