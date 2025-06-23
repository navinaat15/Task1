-- Create Database
CREATE DATABASE LibraryDB;
USE LibraryDB;

-- Author Table
CREATE TABLE Author (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    bio TEXT
);

-- Category Table
CREATE TABLE Category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

-- Book Table
CREATE TABLE Book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    publication_year INT,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);

-- BookAuthor Table (Many-to-Many)
CREATE TABLE BookAuthor (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id),
    FOREIGN KEY (author_id) REFERENCES Author(author_id)
);
-- Member Table
CREATE TABLE Member (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    join_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Loan Table
CREATE TABLE Loan (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    member_id INT,
    loan_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Book(book_id),
    FOREIGN KEY (member_id) REFERENCES Member(member_id)
);
