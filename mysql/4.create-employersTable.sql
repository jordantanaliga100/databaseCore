-- ! creating employer table
-- * with default clauses 
CREATE TABLE employers (
  company_name VARCHAR(250),
  company_address VARCHAR(300),
  -- yearly_revenue FLOAT(5,2) -- Approximation, Allowed: 123.12 , 12.1 | Not allowed: 1234.12, 1.123 
  yearly_revenue NUMERIC(5, 2), -- Precission, -- Exact value
  is_hiring BOOLEAN DEFAULT FALSE
);