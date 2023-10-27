-- Create a new database for your store
CREATE DATABASE IF NOT EXISTS store_db;
USE store_db;

-- Create a table to store product information
CREATE TABLE IF NOT EXISTS products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL
);

-- Create a table to store customer information
CREATE TABLE IF NOT EXISTS customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone_number VARCHAR(15),
    address TEXT
);

-- Create a table to store orders
CREATE TABLE IF NOT EXISTS orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Create a table to store order details (products in each order)
CREATE TABLE IF NOT EXISTS order_details (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Create a table to store categories for products (optional)
CREATE TABLE IF NOT EXISTS categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

-- Create a table to associate products with categories (optional)
CREATE TABLE IF NOT EXISTS product_categories (
    product_id INT,
    category_id INT,
    PRIMARY KEY (product_id, category_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- Create a table to store user accounts for employees (optional)
CREATE TABLE IF NOT EXISTS users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'employee') NOT NULL
);

-- Insert sample data (optional)
INSERT INTO categories (category_name) VALUES ('Electronics'), ('Clothing'), ('Books');

-- Commit the changes
COMMIT;


-- Populating the "products" table
INSERT INTO products (product_name, description, price, stock_quantity)
VALUES
    ('Smartphone', 'High-end smartphone with great features.', 599.99, 20),
    ('Laptop', 'Powerful laptop for work and gaming.', 999.99, 15),
    ('T-shirt', 'Cotton T-shirt in various colors.', 19.99, 50),
    ('Jeans', 'Slim-fit jeans for men.', 49.99, 30),
    ('Book - Fiction', 'Best-selling fiction book.', 12.99, 40),
    ('Tablet', '10-inch tablet with HD display.', 199.99, 10),
    ('Dress', 'Elegant dress for special occasions.', 79.99, 25),
    ('Sneakers', 'Casual sneakers in different styles.', 29.99, 35);

-- Populating the "customers" table
INSERT INTO customers (first_name, last_name, email, phone_number, address)
VALUES
    ('John', 'Doe', 'john.doe@email.com', '+1234567890', '123 Main St, City'),
    ('Jane', 'Smith', 'jane.smith@email.com', '+9876543210', '456 Elm St, Town'),
    ('David', 'Johnson', 'david.johnson@email.com', '+1112223333', '789 Oak St, Village'),
    ('Sarah', 'Wilson', 'sarah.wilson@email.com', '+5554447777', '567 Pine St, Suburb'),
    ('Michael', 'Brown', 'michael.brown@email.com', '+9998887777', '101 Maple St, County'),
    ('Amanda', 'Lee', 'amanda.lee@email.com', '+7776665555', '246 Birch St, Country'),
    ('Robert', 'Davis', 'robert.davis@email.com', '+3332221111', '898 Redwood St, State'),
    ('Emily', 'Martinez', 'emily.martinez@email.com', '+8887776666', '753 Cedar St, Region');

-- Populating the "orders" table
INSERT INTO orders (customer_id, total_amount)
VALUES
    (1, 799.98),
    (2, 179.97),
    (3, 139.98),
    (4, 59.98),
    (5, 699.93),
    (6, 249.97),
    (7, 159.98),
    (8, 99.99);

-- Populating the "order_details" table
INSERT INTO order_details (order_id, product_id, quantity, price)
VALUES
    (1, 1, 1, 599.99),
    (2, 3, 3, 59.97),
    (3, 4, 2, 99.98),
    (4, 7, 4, 119.96),
    (5, 2, 1, 999.99),
    (6, 5, 3, 38.97),
    (7, 6, 1, 199.99),
    (8, 8, 2, 59.98);

-- Populating the "product_categories" table (assuming three products belong to the "Electronics" category)
INSERT INTO product_categories (product_id, category_id)
VALUES
    (1, 1),
    (2, 1),
    (6, 1);

-- Populating the "users" table (for demonstration purposes)
INSERT INTO users (username, password, role)
VALUES
    ('admin', 'admin_password', 'admin'),
    ('employee1', 'employee_password1', 'employee'),
    ('employee2', 'employee_password2', 'employee');

-- Commit the changes
COMMIT;


-- Populating the "orders" table with more orders
INSERT INTO orders (customer_id, total_amount)
VALUES
    (2, 129.99),  -- Jane Smith
    (3, 199.96),  -- David Johnson
    (4, 49.99),   -- Sarah Wilson
    (5, 389.97),  -- Michael Brown
    (6, 149.98);  -- Amanda Lee

-- Populating the "order_details" table for the new orders
INSERT INTO order_details (order_id, product_id, quantity, price)
VALUES
    (9, 3, 1, 29.99),  -- Jane Smith's order
    (10, 2, 2, 199.98),  -- David Johnson's order
    (11, 4, 1, 49.99),  -- Sarah Wilson's order
    (12, 6, 2, 79.98),  -- Michael Brown's order
    (13, 8, 1, 29.99);  -- Amanda Lee's order

-- Commit the changes
COMMIT;


-- Populating the "orders" table with more orders
INSERT INTO orders (customer_id, total_amount)
VALUES
    (7, 299.97),  -- Robert Davis
    (8, 69.97),   -- Emily Martinez
    (2, 399.96),  -- Jane Smith
    (3, 49.99),   -- David Johnson;

-- Populating the "order_details" table for the new orders
INSERT INTO order_details (order_id, product_id, quantity, price)
VALUES
    (14, 1, 2, 119.98),  -- Robert Davis's order
    (15, 5, 1, 12.99),   -- Emily Martinez's order
    (16, 2, 3, 299.97),  -- Jane Smith's order
    (17, 4, 1, 49.99);   -- David Johnson's order;

-- Commit the changes
COMMIT;



--Creating column country. 
ALTER TABLE customers
ADD COLUMN country VARCHAR(50);


/**
The "IN (1, 2, 3)" is a SQL clause that is used to specify a condition that checks if a particular value matches 
any value in a list. In this case, it's used in the context of an UPDATE statement to update
records where the customer_id matches any of the values in the list.

Here's how it works:
customer_id is a column in your database that presumably contains unique identifiers for customers.

IN (1, 2, 3) is a condition that checks if the customer_id of a record matches any of the values in the 
list (in this case, 1, 2, or 3).

So, when you execute the UPDATE statement with the condition WHERE customer_id IN (1, 2, 3);
it updates the records where the customer_id is either 1, 2, or 3. In the context of the previous example,
it sets the "country" to 'USA' for customers with customer_id values 1, 2, and 3. 

You can replace the values in the list with the specific customer IDs you want to target when 
performing updates in your database.
*/
UPDATE customers
SET country = 'USA'
WHERE customer_id IN (1, 2, 3);

UPDATE customers
SET country = 'Canada'
WHERE customer_id IN (4, 5, 6);

UPDATE customers
SET country = 'UK'
WHERE customer_id IN (7, 8);
