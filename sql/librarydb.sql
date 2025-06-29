-- Create the database
CREATE DATABASE IF NOT EXISTS librarydb;
USE librarydb;

-- Create users table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    role ENUM('Admin', 'Student') NOT NULL
);

-- Create books table
CREATE TABLE IF NOT EXISTS books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(100) NOT NULL,
    status ENUM('Available', 'Reserved') DEFAULT 'Available'
);

-- Create reservations table
CREATE TABLE IF NOT EXISTS reservations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    user_id INT NOT NULL,
    reservation_date DATETIME NOT NULL,
    status ENUM('Reserved', 'Cancelled') DEFAULT 'Reserved',
    FOREIGN KEY (book_id) REFERENCES books(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Insert sample users
INSERT INTO users (username, password, role) VALUES 
('admin', 'admin123', 'Admin'),
('student1', 'student123', 'Student');

-- Insert initial books
INSERT INTO books (title, author, status) VALUES
('To Kill a Mockingbird', 'Harper Lee', 'Available'),
('1984', 'George Orwell', 'Available'),
('The Great Gatsby', 'F. Scott Fitzgerald', 'Available');

-- Insert additional computer science books
INSERT INTO books (title, author, status) VALUES
('Java Programming', 'James Gosling', 'Available'),
('Data Structures', 'Robert Lafore', 'Available'),
('Operating Systems', 'Andrew Tanenbaum', 'Available'),
('Database System Concepts', 'Abraham Silberschatz', 'Available'),
('Computer Networks', 'Andrew S. Tanenbaum', 'Available'),
('Clean Code', 'Robert C. Martin', 'Available'),
('Introduction to Algorithms', 'Thomas H. Cormen', 'Available'),
('The Pragmatic Programmer', 'Andrew Hunt', 'Available'),
('Artificial Intelligence: A Modern Approach', 'Stuart Russell', 'Available'),
('Head First Java', 'Kathy Sierra', 'Available');