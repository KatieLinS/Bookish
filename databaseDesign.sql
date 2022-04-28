CREATE TABLE books (
    id int PRIMARY KEY,
    title varchar(255) NOT NULL,
    ISBN varchar(255) NOT NULL UNIQUE
);

CREATE TABLE authors (
    id int PRIMARY KEY,
    name varchar(255) NOT NULL
);

CREATE TABLE book_authors (
    book_id int REFERENCES books(id),
    author_id int REFERENCES authors(id)
);

CREATE TABLE book_copies (
    id int PRIMARY KEY,
    book_id int REFERENCES books(id),
    barcode char(13) NOT NULL UNIQUE
);

CREATE TABLE users (
    id int PRIMARY KEY,
    username varchar(50) NOT NULL UNIQUE,
    access_token varchar(255) NOT NULL
);

CREATE TABLE books_on_loan (
    id int PRIMARY KEY,
    book_copy_id int REFERENCES book_copies(id),
    user_id int REFERENCES users(id),
    due_date DATE NOT NULL
);