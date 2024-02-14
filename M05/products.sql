
CREATE TABLE `products`
(
    `product_id`        int(11)       NOT NULL AUTO_INCREMENT,
    `name`              varchar(50)   NOT NULL,
    `quantity_in_stock` int(11)       NOT NULL,
    `unit_price`        decimal(4, 2) NOT NULL,
    PRIMARY KEY (`product_id`)
);



INSERT INTO `products`
VALUES (1, 'Apple', 70, 1.21);
INSERT INTO `products`
VALUES (2, 'Pork', 49, 4.65);
INSERT INTO `products`
VALUES (3, 'Lettuce', 38, 3.35);
INSERT INTO `products`
VALUES (4, 'Broccoli', 90, 4.53);
INSERT INTO `products`
VALUES (5, 'Ranch Dressing', 94, 1.63);
INSERT INTO `products`
VALUES (6, 'Orange', 14, 2.39);
INSERT INTO `products`
VALUES (7, 'Grape', 98, 3.29);
INSERT INTO `products`
VALUES (8, 'Raspberry', 26, 0.74);
INSERT INTO `products`
VALUES (9, 'Lemon', 67, 2.26);
INSERT INTO `products`
VALUES (10, 'Pumpkin', 6, 1.09);


# List the products under $2 with more than 20 in stock.
SELECT * FROM products WHERE unit_price < 2 and quantity_in_stock > 20;

# List the products between $1 and $2
select * from products where unit_price > 1 and unit_price < 2;

# List the products beginning with "L"
select * from products where name like 'L%';

# Add a new column "category" to the table.
ALTER TABLE products ADD category varchar(50);

# Update the content of category for each product.
UPDATE products SET category = 'Fruit' WHERE name IN ('Apple', 'Orange', 'Grape', 'Raspberry', 'Lemon');
UPDATE products SET category = 'Meat' WHERE name IN ('Pork');
UPDATE products SET category = 'Vegetable' WHERE name IN ('Lettuce', 'Broccoli', 'Pumpkin');
UPDATE products SET category = 'Dressing' WHERE name IN ('Ranch Dressing');

# What is the average price for all fruits?
SELECT AVG(unit_price) FROM products WHERE category = 'Fruit';

# Sort the products by category, and then by their name.
SELECT * FROM products ORDER BY category, name;

# What is the average price for each category.
SELECT category, AVG(unit_price) FROM products GROUP BY category;