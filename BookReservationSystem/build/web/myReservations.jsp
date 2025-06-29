<%-- 
    Document   : myReservations
    Created on : Apr 26, 2025, 9:22:56 AM
    Author     : tajit
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.User, model.Reservation, java.util.List, java.text.SimpleDateFormat" %>
<%
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    List<Reservation> reservations = (List<Reservation>) request.getAttribute("reservations");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Reservations</title>
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
            max-width: 1000px;
            margin: 30px auto;
            padding: 0 20px;
        }
        .reservation-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            background-color: #e8d8c0;
            border: 1px solid #c4a484;
        }
        .reservation-table th, .reservation-table td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #c4a484;
        }
        .reservation-table th {
            background-color: #8b5a2b;
            color: white;
            font-weight: normal;
        }
        .reservation-table tr:hover {
            background-color: #d8c8b0;
        }
        .status-reserved {
            color: #dc3545;
            font-weight: bold;
        }
        .status-cancelled {
            color: #6c757d;
            font-weight: bold;
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
        .no-reservations {
            background-color: #e8d8c0;
            padding: 20px;
            border-radius: 5px;
            border: 1px solid #c4a484;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>My Reservations</h1>
        <div class="user-info">
            Welcome, <%= user.getUsername() %> (<%= user.getRole() %>)
            <a href="logout" class="logout-btn">Logout</a>
        </div>
    </div>
    
    <div class="container">
        <% if (reservations == null || reservations.isEmpty()) { %>
            <div class="no-reservations">
                <h3>You have no current reservations</h3>
                <p>Search for books to make a reservation.</p>
            </div>
        <% } else { %>
            <table class="reservation-table">
                <thead>
                    <tr>
                        <th>Book Title</th>
                        <th>Reservation Date</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Reservation reservation : reservations) { %>
                        <tr>
                            <td><%= reservation.getBookTitle() %></td>
                            <td><%= dateFormat.format(reservation.getReservationDate()) %></td>
                            <td class="status-<%= reservation.getStatus().toLowerCase() %>">
                                <%= reservation.getStatus() %>
                            </td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        <% } %>
        
        <a href="dashboard.jsp" class="back-link">← Back to Dashboard</a>
    </div>
</body>
</html>
