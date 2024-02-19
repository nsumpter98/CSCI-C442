use sp24;

DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS authors;
DROP TABLE IF EXISTS categories;

CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL,
    birth_year INT
);

CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    price DECIMAL(5, 2) DEFAULT 0.00,
    publication_year INT,
    author_id INT,
    category_id INT,
    FOREIGN KEY (author_id) REFERENCES authors(author_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id) ON DELETE CASCADE
);

# Insert records into the authors table.
INSERT INTO authors (author_name, birth_year) VALUES
    ('Jane Austen', 1775),
    ('J.D. Salinger', 1919),
    ('F. Scott Fitzgerald', 1896);

# Insert records into the categories table.
INSERT INTO categories (category_name) VALUES
    ('Fiction'),
    ('Non-Fiction'),
    ('Science Fiction');

# Insert records into the books table.
INSERT INTO books (title, price, publication_year, author_id, category_id) VALUES
    ('Pride and Prejudice', 12.99, 1813, 1, 1),
    ('The Catcher in the Rye', 9.99, 1951, 2, 2),
    ('The Great Gatsby', 10.99, 1925, 3, 3);


#Update the price of a specific book to a new value. Ensure that the updated price maintains data consistency.
UPDATE books
SET price = 10.99
WHERE book_id = 1;

# Attempt to insert a record into the books table with an invalid author_id or category_id. Ensure that the insertion fails due to referential integrity constraints.
INSERT INTO books (title, price, publication_year, author_id, category_id) VALUES
    ('The Great Gatsby', 10.99, 1925, 10, 1);

# Attempt to update the author_id or category_id of a book to a non-existent value. Ensure that the update fails due to referential integrity constraints.
UPDATE books
SET author_id = 10
WHERE title = 'Pride and Prejudice';

# Delete a specific author from the authors table. Ensure that the deletion fails if there are associated records in the books table.
DELETE FROM authors
WHERE author_id = 1;

# Delete a specific category from the categories table. Ensure that the deletion cascades to associated records in the books table.
DELETE FROM categories
WHERE category_id = 1;


