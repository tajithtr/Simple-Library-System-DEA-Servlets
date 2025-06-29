<%-- 
    Document   : searchBook
    Created on : Apr 25, 2025, 9:31:01 AM
    Author     : tajit
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Books</title>
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
            max-width: 800px;
            margin: 30px auto;
            padding: 0 20px;
        }
        .search-box {
            width: 100%;
            padding: 12px;
            border: 1px solid #c4a484;
            border-radius: 5px;
            font-family: 'Georgia', serif;
            font-size: 16px;
            margin-bottom: 20px;
        }
        #searchResults {
            background-color: #e8d8c0;
            border: 1px solid #c4a484;
            border-radius: 5px;
            padding: 20px;
        }
        .book-item {
            padding: 10px;
            border-bottom: 1px solid #c4a484;
        }
        .book-item:last-child {
            border-bottom: none;
        }
        .book-title {
            font-weight: bold;
            color: #5a3e36;
            font-size: 1.1em;
        }
        .book-author {
            color: #6c757d;
            font-style: italic;
        }
        .status-available {
            color: #28a745;
            font-weight: bold;
        }
        .status-reserved {
            color: #dc3545;
            font-weight: bold;
        }
        .reserve-btn {
            background-color: #8b5a2b;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
            font-family: 'Georgia', serif;
            transition: background-color 0.3s;
        }
        .reserve-btn:hover {
            background-color: #6d4c2e;
        }
        .reserve-btn:disabled {
            background-color: #cccccc;
            cursor: not-allowed;
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
    <%
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }
    %>
    
    <div class="header">
        <h1>Search Books</h1>
        <div class="user-info">
            Welcome, <%= user.getUsername() %> (<%= user.getRole() %>)
            <a href="logout" class="logout-btn">Logout</a>
        </div>
    </div>
    
    <div class="container">
        <input type="text" class="search-box" id="searchBox" placeholder="Search by title or author..." 
               onkeyup="searchBooks()">
        
        <div id="searchResults">
            <!-- Results will be populated here by AJAX -->
        </div>
        
        <a href="dashboard.jsp" class="back-link">← Back to Dashboard</a>
    </div>
    
    <script src="js/validation.js"></script>
    <script>
        function searchBooks() {
            let query = document.getElementById("searchBox").value.trim();
            
            // Validate search input
            if (query.length < 2) {
                if (query.length === 0) {
                    document.getElementById("searchResults").innerHTML = "";
                }
                return;
            }
            
            let xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById("searchResults").innerHTML = this.responseText;
                }
            };
            xhttp.open("GET", "searchBook?q=" + encodeURIComponent(query), true);
            xhttp.send();
        }
    </script>
</body>
</html>