/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.BookDAO;
import dao.ReservationDAO;
import model.Book;
import model.Reservation;
import model.User;

@WebServlet("/reservation")
public class ReservationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            ReservationDAO reservationDAO = new ReservationDAO();
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            
            if (user == null) {
                response.sendRedirect("login.jsp");
                return;
            }
            
            if ("Admin".equals(user.getRole())) {
                List<Reservation> reservations = reservationDAO.getAllReservations();
                request.setAttribute("reservations", reservations);
                request.getRequestDispatcher("viewReservations.jsp").forward(request, response);
            } else {
                List<Reservation> reservations = reservationDAO.getReservationsByUser(user.getId());
                request.setAttribute("reservations", reservations);
                request.getRequestDispatcher("myReservations.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("error", "Error retrieving reservations: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            
            if (user == null) {
                response.sendRedirect("login.jsp");
                return;
            }
            
            int bookId = Integer.parseInt(request.getParameter("bookId"));
            
            // Check if book is available
            BookDAO bookDAO = new BookDAO();
            Book book = bookDAO.getBookById(bookId);
            
            if (book == null || !"Available".equals(book.getStatus())) {
                request.setAttribute("error", "Book is not available for reservation");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }
            
            // Create reservation
            Reservation reservation = new Reservation();
            reservation.setBookId(bookId);
            reservation.setUserId(user.getId());
            reservation.setReservationDate(new Date());
            reservation.setStatus("Reserved");
            
            ReservationDAO reservationDAO = new ReservationDAO();
            reservationDAO.createReservation(reservation);
            
            // Update book status
            bookDAO.updateBookStatus(bookId, "Reserved");
            
            response.sendRedirect("reservation");
        } catch (Exception e) {
            request.setAttribute("error", "Error creating reservation: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}