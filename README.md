# Book Reservation System

![Interface Screenshot](screenshot/interface.png)

## 📚 Project Overview

The **Book Reservation System** is a Java EE web application designed to manage book reservations in a library environment using **Servlets, JSP, JDBC, and MVC** architecture.

## ✨ Features

* 🔐 Role-based login system for Admin and Student users  
* 📖 Admin can add and manage books  
* 📚 Students can search, reserve, and view their reservations  
* 🔍 Book search functionality  
* 🧭 Authentication filter for session control  
* 🎨 JSP-based user-friendly interface  

## 🗂️ Project Structure

### 📁 Web Pages (`WebContent`)

* `addBook.jsp`  
* `bookList.jsp`  
* `dashboard.jsp`  
* `login.jsp`  
* `logout.jsp`  
* `reserveForm.jsp`  
* `searchBook.jsp`  
* `myReservations.jsp`  
* `viewReservations.jsp`  
* `error.jsp`  
* `ajax/`, `js/` — folders for AJAX handlers and JS code  

### 📁 Java Source (`/src`)

**controller**

* `BookServlet.java`  
* `LoginServlet.java`  
* `LogoutServlet.java`  
* `ReservationServlet.java`  
* `SearchBookServlet.java`  

**controller.filter**

* `AuthFilter.java`  

**dao**

* `BookDAO.java`  
* `ReservationDAO.java`  
* `UserDAO.java`  

**model**

* `Book.java`  
* `Reservation.java`  
* `User.java`  

---

## 🧩 Database SQL Script

```sql
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
```

---

## 🚀 How to Run

1. Open the project in **NetBeans IDE**.  
2. Set up your **database connection** inside `DBConnection.java` (if available).  
3. Run the SQL script above to set up the **`librarydb`** database.  
4. Deploy to **Tomcat** or **GlassFish Server**.  
5. Open the browser and test via the login page.  

---

## 👨‍💻 Author

**Tajith Rashidha**  
🎓 MIS Student | 💻 Web & Java Developer | ✉️ [tajithrashidha@gmail.com](mailto:tajithrashidha@gmail.com)
