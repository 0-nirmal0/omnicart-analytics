-- Trim / canonicalize IDs & strings

UPDATE customers SET customer_id = TRIM(customer_id);
UPDATE products  SET product_id  = TRIM(product_id);

-- optionally uppercase IDs
UPDATE customers SET customer_id = UPPER(customer_id);
UPDATE products  SET product_id  = UPPER(product_id);

