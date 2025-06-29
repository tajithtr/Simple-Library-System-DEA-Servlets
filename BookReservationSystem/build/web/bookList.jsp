<%-- 
    Document   : bookList
    Created on : Apr 25, 2025, 9:31:31 AM
    Author     : tajit
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.User, model.Book, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book List</title>
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
        .book-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            background-color: #e8d8c0;
            border: 1px solid #c4a484;
        }
        .book-table th, .book-table td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #c4a484;
        }
        .book-table th {
            background-color: #8b5a2b;
            color: white;
            font-weight: normal;
        }
        .book-table tr:hover {
            background-color: #d8c8b0;
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
            padding: 8px 12px;
            border-radius: 5px;
            cursor: pointer;
            font-family: 'Georgia', serif;
            transition: background-color 0.3s;
            text-decoration: none;
            display: inline-block;
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
        }
        
        List<Book> books = (List<Book>) request.getAttribute("books");
    %>
    
    <div class="header">
        <h1>Book List</h1>
        <div class="user-info">
            Welcome, <%= user.getUsername() %> (<%= user.getRole() %>)
            <a href="logout" class="logout-btn">Logout</a>
        </div>
    </div>
    
    <div class="container">
        <table class="book-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Author</th>
                    <th>Status</th>
                    <% if ("Student".equals(user.getRole())) { %>
                        <th>Action</th>
                    <% } %>
                </tr>
            </thead>
            <tbody>
                <% for (Book book : books) { %>
                    <tr>
                        <td><%= book.getId() %></td>
                        <td><%= book.getTitle() %></td>
                        <td><%= book.getAuthor() %></td>
                        <td class="status-<%= book.getStatus().toLowerCase() %>">
                            <%= book.getStatus() %>
                        </td>
                        <% if ("Student".equals(user.getRole())) { %>
                            <td>
                                <form action="reservation" method="post">
                                    <input type="hidden" name="bookId" value="<%= book.getId() %>">
                                    <button type="submit" class="reserve-btn" 
                                        <%= "Available".equals(book.getStatus()) ? "" : "disabled" %>>
                                        Reserve
                                    </button>
                                </form>
                            </td>
                        <% } %>
                    </tr>
                <% } %>
            </tbody>
        </table>
        
        <a href="dashboard.jsp" class="back-link">← Back to Dashboard</a>
    </div>
</body>
</html>