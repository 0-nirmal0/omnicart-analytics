-- Nulls & defaults
-- set discount NULL -> 0
UPDATE order_items SET discount = 0 WHERE discount IS NULL;

-- refunds NULL -> 0
UPDATE returns SET refund_amount = 0 WHERE refund_amount IS NULL;

-- normalize campaign_id as NULL or 'none' (choose one)
UPDATE orders SET campaign_id = NULL WHERE campaign_id = 'none' OR TRIM(campaign_id) = '';
