-- Insert sample data into customers
INSERT INTO customers (first_name, last_name, email, phone_number) VALUES
('Haroon', 'Khurram', 'haroon@email.com', '03351234567'),
('Ibrahim', 'Khurram', 'ibrahim@email.com', '02351234567'),
('Rutab', 'Fatima', 'rutab@email.com', '03121234567'),
('Khurram', 'Gulzar', 'khurram@email.com', '03341234567'),
('Farhat', 'Khurram', 'farhat@email.com', '03311234567'),
('Ahmad', 'Arslan', 'ahmad@email.com', '03321234567'),
('Ali', 'Abdul', 'ali@email.com', '03371234567');

-- Insert sample data into riders
INSERT INTO riders (rider_name, phone_number, is_available) VALUES
('Bilal Khan', '03001234567', TRUE),
('Usman Ali', '03011234567', TRUE),
('Hassan Raza', '03021234567', FALSE),
('Saad Ahmed', '03031234567', TRUE),
('Zeeshan Malik', '03041234567', TRUE),
('Imran Shah', '03051234567', FALSE),
('Noman Tariq', '03061234567', TRUE);

-- Insert sample data into menu_items
INSERT INTO menu_items (item_name, item_category, item_price) VALUES
('Chicken Burger', 'Fast Food', 350.00),
('Beef Pizza', 'Fast Food', 1200.00),
('French Fries', 'Snacks', 250.00),
('Biryani', 'Main Course', 450.00),
('Zinger Roll', 'Fast Food', 300.00),
('Cold Drink', 'Beverage', 120.00),
('Chocolate Cake', 'Dessert', 600.00);

-- Insert sample data into orders
INSERT INTO orders (customer_id, rider_id, order_total, order_status) VALUES
(1, 1, 600.00, 'Placed'),
(2, 2, 450.00, 'Delivered'),
(3, 3, 1200.00, 'Cancelled'),
(4, 4, 370.00, 'Delivered'),
(5, 5, 1500.00, 'Placed'),
(6, 6, 700.00, 'Delivered'),
(7, 7, 300.00, 'Placed');

-- Insert sample data into order_items
INSERT INTO order_items (order_id, item_id, quantity, line_total) VALUES
(1, 1, 2, 700.00),
(2, 4, 1, 450.00),
(3, 2, 1, 1200.00),
(4, 3, 1, 250.00),
(5, 2, 1, 1200.00),
(6, 5, 2, 600.00),
(7, 6, 2, 240.00);

-- Insert sample data into order_tracking
INSERT INTO order_tracking (order_id, departure_time, arrival_time, is_delivered) VALUES
(1, NOW(), NULL, FALSE),
(2, NOW() - INTERVAL '40 minutes', NOW() - INTERVAL '10 minutes', TRUE),
(3, NOW() - INTERVAL '1 hour', NULL, FALSE),
(4, NOW() - INTERVAL '30 minutes', NOW() - INTERVAL '5 minutes', TRUE),
(5, NOW(), NULL, FALSE),
(6, NOW() - INTERVAL '50 minutes', NOW() - INTERVAL '15 minutes', TRUE),
(7, NOW(), NULL, FALSE);

-- Insert sample data into cancelled_orders
INSERT INTO cancelled_orders (order_id, cancelled_by, reason) VALUES
(3, 'Customer', 'Changed mind before delivery'),
(5, 'System', 'Rider not available'),
(7, 'Customer', 'Incorrect address'),
(1, 'System', 'Payment failed'),
(2, 'Customer', 'Duplicate order'),
(4, 'Customer', 'Late delivery'),
(6, 'System', 'Restaurant closed early');

-- Insert sample data into order_reviews
INSERT INTO order_reviews (order_id, customer_review, rating) VALUES
(2, 'Delicious biryani, hot and fresh!', 5),
(4, 'Fries were a bit cold but tasty.', 3),
(6, 'Zinger rolls were amazing!', 5),
(1, 'Still waiting for delivery', 2),
(3, 'Cancelled, no food received.', 1),
(5, 'Didn’t arrive, disappointed.', 1),
(7, 'Waiting for order.', 2);

-- Insert sample data into rider_reviews
INSERT INTO rider_reviews (rider_id, order_id, customer_review, rating) VALUES
(2, 2, 'Fast delivery, polite rider.', 5),
(4, 4, 'Rider was friendly.', 4),
(6, 6, 'Quick delivery, great service.', 5),
(1, 1, 'Did not deliver yet.', 1),
(3, 3, 'Order cancelled, no review.', 1),
(5, 5, 'Could not deliver, system cancelled.', 2),
(7, 7, 'Still waiting for rider.', 1);