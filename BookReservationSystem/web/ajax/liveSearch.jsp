<%-- 
    Document   : liveSearch
    Created on : Apr 26, 2025, 9:10:22 AM
    Author     : tajit
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, model.Book" %>
<%
    List<Book> books = (List<Book>) request.getAttribute("books");
    if (books != null && !books.isEmpty()) {
        for (Book book : books) {
%>
            <div class="book-item">
                <h3><%= book.getTitle() %></h3>
                <p>Author: <%= book.getAuthor() %></p>
                <p>Status: <span class="status-<%= book.getStatus().toLowerCase() %>">
                    <%= book.getStatus() %>
                </span></p>
                <% if ("Available".equals(book.getStatus())) { %>
                    <form action="reservation" method="post">
                        <input type="hidden" name="bookId" value="<%= book.getId() %>">
                        <button type="submit" class="reserve-btn">Reserve</button>
                    </form>
                <% } %>
            </div>
<%
        }
    } else {
%>
        <p>No books found matching your search.</p>
<%
    }
%>
