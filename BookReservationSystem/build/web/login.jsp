<%-- 
    Document   : login
    Created on : Apr 25, 2025, 9:29:49 AM
    Author     : tajit
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Library Login</title>
    <style>
        body {
            font-family: 'Georgia', serif;
            background-color: #f5f1e6;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #5a3e36;
        }
        .login-container {
            background-color: #e8d8c0;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            width: 350px;
            border: 1px solid #c4a484;
        }
        .login-container h1 {
            text-align: center;
            margin-bottom: 25px;
            color: #8b5a2b;
            font-weight: normal;
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
        .login-btn {
            width: 100%;
            padding: 12px;
            background-color: #8b5a2b;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-family: 'Georgia', serif;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        .login-btn:hover {
            background-color: #6d4c2e;
        }
        .error-message {
            color: #dc3545;
            text-align: center;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h1>Library System Login</h1>
        
        <% if (request.getParameter("error") != null) { %>
            <div class="error-message">
                Invalid username or password
            </div>
        <% } %>
        
        <form action="login" method="post" onsubmit="return validateLoginForm()">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit" class="login-btn">Login</button>
        </form>
    </div>
    
    <script src="js/validation.js"></script>
</body>
</html>