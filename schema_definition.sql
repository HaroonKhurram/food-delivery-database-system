-- 1. Customers
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    phone_number CHAR(11) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Riders
CREATE TABLE riders (
    rider_id SERIAL PRIMARY KEY,
    rider_name VARCHAR(50) NOT NULL,
    phone_number CHAR(11) NOT NULL UNIQUE,
    is_available BOOLEAN DEFAULT TRUE
);

-- 3. Menu Items
CREATE TABLE menu_items (
    item_id SERIAL PRIMARY KEY,
    item_name VARCHAR(50) NOT NULL,
    item_category VARCHAR(30) NOT NULL,
    item_price DECIMAL(8,2) NOT NULL CHECK (item_price > 0)
);

-- 4. Orders
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    rider_id INT,
    order_total DECIMAL(10,2) NOT NULL DEFAULT 0,
    order_status VARCHAR(20) DEFAULT 'Placed',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (rider_id) REFERENCES riders(rider_id)
);

-- 5. Order Items (junction table)
CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    item_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    line_total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (item_id) REFERENCES menu_items(item_id)
);

-- 6. Order Tracking
CREATE TABLE order_tracking (
    order_tracking_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL UNIQUE,
    departure_time TIMESTAMP,
    arrival_time TIMESTAMP,
    is_delivered BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE
);

-- 7. Cancelled Orders
CREATE TABLE cancelled_orders (
    cancellation_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL UNIQUE,
    cancelled_by VARCHAR(10) NOT NULL,
    reason TEXT,
    cancelled_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- 8. Order Reviews
CREATE TABLE order_reviews (
    review_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL UNIQUE,
    customer_review TEXT NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- 9. Rider Reviews
CREATE TABLE rider_reviews (
    review_id SERIAL PRIMARY KEY,
    rider_id INT NOT NULL,
    order_id INT NOT NULL,
    customer_review TEXT NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (rider_id) REFERENCES riders(rider_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);