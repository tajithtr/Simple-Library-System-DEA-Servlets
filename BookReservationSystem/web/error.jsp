<%-- 
    Document   : error
    Created on : Apr 25, 2025, 9:33:37 AM
    Author     : tajit
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error</title>
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
        .error-container {
            background-color: #e8d8c0;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 400px;
            border: 1px solid #c4a484;
            text-align: center;
        }
        h1 {
            color: #d9534f;
            margin-top: 0;
        }
        .error-message {
            margin: 20px 0;
            font-size: 18px;
        }
        .home-link {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #8b5a2b;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .home-link:hover {
            background-color: #6d4c2e;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <h1>Error</h1>
        <div class="error-message">
            <% 
                String message = request.getParameter("message");
                if (message != null) {
                    out.println(message);
                } else {
                    out.println("An unexpected error occurred.");
                }
            %>
        </div>
        <a href="login.jsp" class="home-link">Return to Login</a>
    </div>
</body>
</html>
