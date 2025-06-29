<%-- 
    Document   : dashboard
    Created on : Apr 25, 2025, 9:30:24 AM
    Author     : tajit
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Library Dashboard</title>
    <style>
        body {
            font-family: 'Georgia', serif;
            background-color: #f5f1e6;
            margin: 0;
            padding: 0;
            color: #5a3e36;
        }
        .header {
            background-color: #8b5a2b;
            color: white;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .header h1 {
            margin: 0;
            font-weight: normal;
        }
        .user-info {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .logout-btn {
            background-color: #d4a76a;
            color: #5a3e36;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            font-family: 'Georgia', serif;
            transition: background-color 0.3s;
        }
        .logout-btn:hover {
            background-color: #c4a484;
        }
        .container {
            max-width: 1200px;
            margin: 30px auto;
            padding: 0 20px;
        }
        .welcome-message {
            background-color: #e8d8c0;
            padding: 20px;
            border-radius: 5px;
            margin-bottom: 30px;
            border: 1px solid #c4a484;
        }
        .dashboard-options {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
        }
        .option-card {
            background-color: #e8d8c0;
            padding: 25px;
            border-radius: 5px;
            text-align: center;
            border: 1px solid #c4a484;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .option-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        .option-card a {
            display: block;
            background-color: #8b5a2b;
            color: white;
            padding: 12px;
            border-radius: 5px;
            text-decoration: none;
            margin-top: 15px;
            transition: background-color 0.3s;
        }
        .option-card a:hover {
            background-color: #6d4c2e;
        }
        .option-card h2 {
            margin-top: 0;
            color: #5a3e36;
            font-weight: normal;
        }
    </style>
</head>
<body>
    <%
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp");
        }
    %>
    
    <div class="header">
        <h1>Library Management System</h1>
        <div class="user-info">
            Welcome, <%= user.getUsername() %> (<%= user.getRole() %>)
            <a href="logout" class="logout-btn">Logout</a>
        </div>
    </div>
    
    <div class="container">
        <div class="welcome-message">
            <h2>Welcome to the Library Dashboard</h2>
            <p>Please select an option below to continue.</p>
        </div>
        
        <div class="dashboard-options">
            <% if ("Student".equals(user.getRole())) { %>
                <div class="option-card">
                    <h2>Search & Reserve Books</h2>
                    <p>Find and reserve available books in our collection</p>
                    <a href="searchBook.jsp">Search Books</a>
                </div>
                
                <div class="option-card">
                    <h2>My Reservations</h2>
                    <p>View your current reservations</p>
                    <a href="reservation">My Reservations</a>
                </div>
            <% } else if ("Admin".equals(user.getRole())) { %>
                <div class="option-card">
                    <h2>Add New Books</h2>
                    <p>Add new books to the library collection</p>
                    <a href="addBook.jsp">Add Books</a>
                </div>
                
                <div class="option-card">
                    <h2>View All Books</h2>
                    <p>Browse the complete library catalog</p>
                    <a href="book">View Books</a>
                </div>
                
                <div class="option-card">
                    <h2>View Reservations</h2>
                    <p>View all current book reservations</p>
                    <a href="reservation">View Reservations</a>
                </div>
            <% } %>
        </div>
    </div>
</body>
</html>