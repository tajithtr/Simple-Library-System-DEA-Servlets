<%-- 
    Document   : addBook
    Created on : Apr 25, 2025, 9:32:38 AM
    Author     : tajit
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"Admin".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Book</title>
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
            max-width: 600px;
            margin: 30px auto;
            padding: 0 20px;
        }
        .book-form {
            background-color: #e8d8c0;
            padding: 25px;
            border-radius: 8px;
            border: 1px solid #c4a484;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }
        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #c4a484;
            border-radius: 5px;
            font-family: 'Georgia', serif;
            font-size: 16px;
            background-color: #f5f1e6;
        }
        .submit-btn {
            background-color: #8b5a2b;
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-family: 'Georgia', serif;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        .submit-btn:hover {
            background-color: #6d4c2e;
        }
        .back-link {
            display: inline-block;
            margin-top: 20px;
            color: #8b5a2b;
            text-decoration: none;
            font-weight: bold;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Add New Book</h1>
        <div class="user-info">
            Welcome, <%= user.getUsername() %> (<%= user.getRole() %>)
            <a href="logout" class="logout-btn">Logout</a>
        </div>
    </div>
    
    <div class="container">
        <form action="book" method="post" onsubmit="return validateBookForm()" class="book-form">
            <div class="form-group">
                <label for="title">Book Title</label>
                <input type="text" id="title" name="title" required>
            </div>
            <div class="form-group">
                <label for="author">Author</label>
                <input type="text" id="author" name="author" required>
            </div>
            <button type="submit" class="submit-btn">Add Book</button>
        </form>
        
        <a href="dashboard.jsp" class="back-link">← Back to Dashboard</a>
    </div>
    
    <script src="js/validation.js"></script>
</body>
</html>