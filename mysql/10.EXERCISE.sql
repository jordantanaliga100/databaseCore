
-- ! Task 1: create a database 
-- CREATE DATABASE online_shop; --mysql

-- ! Task 2 + Task 3: create a table
-- CREATE TABLE IF NOT EXISTS products (
--   name VARCHAR(200),
--   price NUMERIC(10,2),
--   description TEXT,
--   amount_in_stock SMALLINT,
--   image_path VARCHAR(500) 
-- );

-- ! Task 4: inserting a dummy data

-- INSERT INTO products 
-- VALUES(
--   'Piano',
--   12.99,
--   'This is a piano',
--   5,
--   'uploads/products/123/pic.jpeg'
-- );

-- ! Task 5: add some constraints that make sense --mysql
  -- step 1: Modify column types and NOT NULL constraints
-- ALTER TABLE products
--   MODIFY COLUMN name VARCHAR(200) NOT NULL,
--   MODIFY COLUMN price NUMERIC(10,2) NOT NULL,
--   MODIFY COLUMN description TEXT NOT NULL,
--   MODIFY COLUMN amount_in_stock SMALLINT ;

  -- Step 2: Add CHECK constraints
-- ALTER TABLE products
--   ADD CONSTRAINT price_positive CHECK (price > 0),
--   ADD CONSTRAINT amount_positive_or_zero CHECK(amount_in_stock >= 0);


-- ! Task 6: Add id as primary key --mysql
-- ALTER TABLE products
--   ADD COLUMN id INT PRIMARY KEY AUTO_INCREMENT;