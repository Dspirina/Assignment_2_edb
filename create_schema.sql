CREATE TABLE publishers (
                            id INTEGER AUTO_INCREMENT PRIMARY KEY,
                            name_pub VARCHAR(255) NOT NULL,
                            address VARCHAR(255),
                            phone VARCHAR(25) NOT NULL,
                            website VARCHAR(255),
                            INDEX idx_name_pub (name_pub),
                            INDEX idx_phone (phone)
);

CREATE TABLE genres (
                        id INTEGER AUTO_INCREMENT PRIMARY KEY,
                        genre_name VARCHAR(255) NOT NULL,
                        description TEXT,
                        INDEX idx_genre_name (genre_name)
);

CREATE TABLE authors (
                         id INTEGER AUTO_INCREMENT PRIMARY KEY,
                         name_au VARCHAR(255) NOT NULL,
                         datebirth DATE NOT NULL,
                         nationality VARCHAR(255) NOT NULL,
                         biography TEXT NOT NULL,
                         INDEX idx_name_au (name_au),
                         INDEX idx_nationality (nationality)
);

CREATE TABLE books (
                       id INTEGER AUTO_INCREMENT PRIMARY KEY,
                       title VARCHAR(255) NOT NULL,
                       isbn VARCHAR(17),
                       edition VARCHAR(255) NOT NULL,
                       release_year YEAR NOT NULL,
                       price DECIMAL(10, 2) NOT NULL,
                       publisher_id INTEGER,
                       genre_id INTEGER,
                       FOREIGN KEY (publisher_id) REFERENCES publishers(id),
                       FOREIGN KEY (genre_id) REFERENCES genres(id),
                       INDEX idx_title (title),
                       INDEX idx_isbn (isbn),
                       INDEX idx_release_year (release_year)
);

CREATE TABLE customers (
                           id INTEGER AUTO_INCREMENT PRIMARY KEY,
                           name_cus VARCHAR(255) NOT NULL,
                           address VARCHAR(255),
                           phone VARCHAR(25) NOT NULL,
                           email VARCHAR(255) NOT NULL,
                           pas VARCHAR(25) NOT NULL,
                           INDEX idx_name_cus (name_cus),
                           INDEX idx_email (email),
                           INDEX idx_phone (phone)
);

CREATE TABLE loans (
                       id INTEGER AUTO_INCREMENT PRIMARY KEY,
                       customer_id INTEGER,
                       book_id INTEGER NOT NULL,
                       loan_date DATE NOT NULL,
                       due_date DATE NOT NULL,
                       return_date DATE,
                       FOREIGN KEY (customer_id) REFERENCES customers(id),
                       FOREIGN KEY (book_id) REFERENCES books(id),
                       INDEX idx_loan_date (loan_date),
                       INDEX idx_due_date (due_date),
                       INDEX idx_return_date (return_date)
);

CREATE TABLE books_genres (
                              book_id INTEGER,
                              genre_id INTEGER,
                              FOREIGN KEY (book_id) REFERENCES books(id),
                              FOREIGN KEY (genre_id) REFERENCES genres(id),
                              PRIMARY KEY (book_id, genre_id),
                              INDEX idx_book_id (book_id),
                              INDEX idx_genre_id (genre_id)
);

CREATE TABLE books_authors (
                               book_id INTEGER,
                               author_id INTEGER,
                               FOREIGN KEY (book_id) REFERENCES books(id),
                               FOREIGN KEY (author_id) REFERENCES authors(id),
                               PRIMARY KEY (book_id, author_id),
                               INDEX idx_book_id (book_id),
                               INDEX idx_author_id (author_id)
);

