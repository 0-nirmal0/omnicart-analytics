-- ========================
-- OmniCart Analytics Schema (PostgreSQL)
-- ========================

CREATE TABLE customers (
    customer_id TEXT PRIMARY KEY,
    region TEXT,
    state TEXT,
    city TEXT,
    gender TEXT,
    age_bracket TEXT,
    signup_source TEXT,
    first_order_date DATE
);

CREATE TABLE inventory (
    product_id TEXT,
    warehouse_id TEXT,
    current_stock INTEGER,
    safety_stock INTEGER,
    primary_supplier_id TEXT,
    PRIMARY KEY (product_id, warehouse_id)
);

CREATE TABLE marketing_campaigns (
    campaign_id TEXT PRIMARY KEY,
    channel TEXT,
    campaign_name TEXT,
    start_date DATE,
    end_date DATE,
    spend NUMERIC
);

CREATE TABLE orders (
    order_id TEXT PRIMARY KEY,
    customer_id TEXT REFERENCES customers(customer_id),
    order_date DATE,
    channel TEXT,
    device TEXT,
    campaign_id TEXT REFERENCES marketing_campaigns(campaign_id),
    delivery_days INTEGER,
    status TEXT,
    ship_state TEXT,
    ship_city TEXT
);

CREATE TABLE order_items (
    order_item_id TEXT PRIMARY KEY,
    order_id TEXT REFERENCES orders(order_id),
    product_id TEXT,
    quantity INTEGER,
    unit_price NUMERIC,
    discount NUMERIC,
    estimated_cost NUMERIC
);

CREATE TABLE payments (
    payment_id TEXT PRIMARY KEY,
    order_id TEXT REFERENCES orders(order_id),
    payment_method TEXT,
    payment_status TEXT,
    amount NUMERIC,
    shipping_fee NUMERIC
);

CREATE TABLE products (
    product_id TEXT PRIMARY KEY,
    category TEXT,
    subcategory TEXT,
    brand TEXT,
    unit_cost NUMERIC,
    unit_price NUMERIC,
    launch_date DATE
);

CREATE TABLE returns (
    return_id TEXT PRIMARY KEY,
    order_item_id TEXT REFERENCES order_items(order_item_id),
    return_date DATE,
    reason TEXT,
    refund_amount NUMERIC
);

CREATE TABLE suppliers (
    supplier_id TEXT PRIMARY KEY,
    supplier_name TEXT,
    lead_time_days INTEGER,
    rating NUMERIC
);

CREATE TABLE web_sessions (
    session_id TEXT PRIMARY KEY,
    customer_id TEXT REFERENCES customers(customer_id),
    session_start TIMESTAMP,
    source TEXT,
    medium TEXT,
    campaign_id TEXT REFERENCES marketing_campaigns(campaign_id),
    device TEXT,
    pages_viewed INTEGER,
    duration_seconds INTEGER,
    bounced INTEGER
);
