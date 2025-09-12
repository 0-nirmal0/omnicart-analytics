-- Types & parsing — convert date & money columns:
-- date column (if strings are ISO YYYY-MM-DD)
ALTER TABLE orders
  ALTER COLUMN order_date TYPE DATE USING (order_date::date);

ALTER TABLE marketing_campaigns
  ALTER COLUMN start_date TYPE DATE USING (start_date::date),
  ALTER COLUMN end_date TYPE DATE USING (end_date::date);

ALTER TABLE products
  ALTER COLUMN launch_date TYPE DATE USING (launch_date::date);

ALTER TABLE returns
  ALTER COLUMN return_date TYPE DATE USING (return_date::date);

-- timestamp column
ALTER TABLE web_sessions
  ALTER COLUMN session_start TYPE TIMESTAMP USING (session_start::timestamp);

-- money
ALTER TABLE payments
  ALTER COLUMN amount TYPE NUMERIC(12,2) USING (amount::numeric);


