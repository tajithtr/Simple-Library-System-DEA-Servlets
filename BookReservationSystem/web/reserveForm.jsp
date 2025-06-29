<%-- 
    Document   : reserveForm
    Created on : Apr 25, 2025, 9:32:03 AM
    Author     : tajit
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Reserve Book</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f0;
            margin: 0;
            padding: 20px;
            color: #5a3e36;
        }
        .header {
            background-color: #8B4513;
            color: white;
            padding: 15px 20px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: white;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="text"], input[type="submit"] {
            padding: 8px;
            width: 100%;
            box-sizing: border-box;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        input[type="submit"] {
            background-color: #8B4513;
            color: white;
            border: none;
            cursor: pointer;
            padding: 10px;
            margin-top: 10px;
        }
        input[type="submit"]:hover {
            background-color: #A0522D;
        }
        .error {
            color: #d9534f;
            padding: 10px;
            background-color: #f2dede;
            border: 1px solid #ebccd1;
            border-radius: 4px;
            margin-bottom: 15px;
        }
        .back-link {
            display: inline-block;
            margin-top: 20px;
            color: #8B4513;
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
        <h1>Reservation Form</h1>
    </div>
    
    <div class="container">
        <% if (request.getAttribute("error") != null) { %>
            <div class="error">${error}</div>
        <% } %>
        
        <form action="reserve" method="post" onsubmit="return validateReservationForm()">
            <input type="hidden" name="bookId" value="${param.bookId}"/>
            
            <div class="form-group">
                <label for="studentName">Student Name:</label>
                <input type="text" id="studentName" name="studentName" required>
            </div>
            
            <div class="form-group">
                <label for="studentId">Student ID:</label>
                <input type="text" id="studentId" name="studentId" required>
            </div>
            
            <input type="submit" value="Reserve Book">
        </form>
        
        <a href="searchBook.jsp" class="back-link">Back to Search</a>
    </div>
    
    <script>
    function validateReservationForm() {
        const name = document.getElementById('studentName').value;
        const id = document.getElementById('studentId').value;
        
        if(name.trim() === '' || id.trim() === '') {
            alert('Please fill in all fields');
            return false;
        }
        return true;
    }
    </script>
</body>
</html>