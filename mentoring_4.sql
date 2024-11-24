CREATE TABLE libraries (
    library_id INT PRIMARY KEY,
    library_name VARCHAR(255) UNIQUE NOT NULL,
    library_address VARCHAR(255),
    library_phone_number VARCHAR(25)
);

CREATE TABLE authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE category (
    category_id INT PRIMARY KEY,
    book_category VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE publisher (
    publisher_id INT PRIMARY KEY,
    publisher_name VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE books (
    book_id INT PRIMARY KEY,
    book_name VARCHAR(255) UNIQUE NOT NULL,
    author_id INT,
    category_id INT,
    publisher_id INT,
    publication_year INT CHECK (publication_year >= 0),
    pages INT,
    CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES authors(author_id),
    CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES category(category_id),
    CONSTRAINT fk_publisher FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id)
);


CREATE TABLE book_library (
    book_library_id SERIAL PRIMARY KEY,
    book_id INT,
    library_id INT,
    quantity INT CHECK (quantity >= 0),
    CONSTRAINT fk_book_library_book FOREIGN KEY (book_id) REFERENCES books(book_id),
    CONSTRAINT fk_book_library_library FOREIGN KEY (library_id) REFERENCES libraries(library_id)
);

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    first_name VARCHAR(255),
	last_name VARCHAR(255),
    email VARCHAR(255),
    phone_number VARCHAR(25),
    address VARCHAR(255),
	CONSTRAINT unique_full_name UNIQUE (first_name, last_name)
);


CREATE TABLE copies (
    copy_id SERIAL PRIMARY KEY,
    book_id INT,
    library_id INT,
    availibility_status VARCHAR(15),
    CONSTRAINT fk_copy_book FOREIGN KEY (book_id) REFERENCES books(book_id),
    CONSTRAINT fk_copy_library FOREIGN KEY (library_id) REFERENCES libraries(library_id)
);

CREATE TABLE loans (
    loan_id SERIAL PRIMARY KEY,
    copy_id INT,
    user_id INT,
    loan_date DATE,
    due_date DATE,
    return_date DATE,
    loan_status BOOLEAN,
    CONSTRAINT fk_loan_copy FOREIGN KEY (copy_id) REFERENCES copies(copy_id),
    CONSTRAINT fk_loan_user FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE holds (
    hold_id SERIAL PRIMARY KEY,
    copy_id INT,
    user_id INT,
    hold_date DATE,
    expiration_hold_date DATE,
    availibility_status BOOLEAN,
    CONSTRAINT fk_hold_copy FOREIGN KEY (copy_id) REFERENCES copies(copy_id),
    CONSTRAINT fk_hold_user FOREIGN KEY (user_id) REFERENCES users(user_id)
);






COPY authors(author_id, author_name)
FROM 'C:\Users\user\Desktop\data mentoring 4\authors.csv'
DELIMITER ','
CSV
HEADER;

COPY category(category_id, book_category)
FROM 'C:\Users\user\Desktop\data mentoring 4\category.csv'
DELIMITER ','
CSV
HEADER;



COPY publisher(publisher_id, publisher_name)
FROM 'C:\Users\user\Desktop\data mentoring 4\publisher.csv'
DELIMITER ','
CSV
HEADER;

COPY books(book_id, book_name, author_id, category_id, publisher_id, publication_year, pages)
FROM 'C:\Users\user\Desktop\data mentoring 4\books.csv'
DELIMITER ','
CSV
HEADER;

COPY libraries(library_id, library_name, library_address, library_phone_number)
FROM 'C:\Users\user\Desktop\data mentoring 4\libraries.csv'
DELIMITER ','
CSV
HEADER;

COPY book_library(book_library_id, book_id, library_id, quantity)
FROM 'C:\Users\user\Desktop\data mentoring 4\book_library.csv'
DELIMITER ','
CSV
HEADER;

COPY users(user_id, first_name, last_name, email, phone_number, address)
FROM 'C:\Users\user\Desktop\data mentoring 4\users.csv'
DELIMITER ','
CSV
HEADER;


COPY copies(copy_id, book_id, library_id, availibility_status)
FROM 'C:\Users\user\Desktop\data mentoring 4\copies.csv'
DELIMITER ','
CSV
HEADER;

COPY loans(loan_id, copy_id, user_id, user_id, loan_date, due_date, return_date, loan_status)
FROM 'C:\Users\user\Desktop\data mentoring 4\loans.csv'
DELIMITER ','
CSV
HEADER;


COPY holds(hold_id, copy_id, user_id, hold_date, expiration_date, availibility_status )
FROM 'C:\Users\user\Desktop\data mentoring 4\holds.csv'
DELIMITER ','
CSV
HEADER;

