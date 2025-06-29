/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Reservation;

public class ReservationDAO {
    private static final String URL = "jdbc:mysql://localhost:3306/librarydb";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("MySQL JDBC Driver not found", e);
        }
    }

    public void createReservation(Reservation reservation) throws SQLException {
        String sql = "INSERT INTO reservations (book_id, user_id, reservation_date, status) VALUES (?, ?, ?, ?)";
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, reservation.getBookId());
            stmt.setInt(2, reservation.getUserId());
            stmt.setTimestamp(3, new java.sql.Timestamp(reservation.getReservationDate().getTime()));
            stmt.setString(4, reservation.getStatus());
            stmt.executeUpdate();
        }
    }

    public List<Reservation> getAllReservations() throws SQLException {
        List<Reservation> reservations = new ArrayList<>();
        String sql = "SELECT r.id, r.book_id, r.user_id, r.reservation_date, r.status, " +
                     "u.username, b.title as book_title " +
                     "FROM reservations r " +
                     "JOIN users u ON r.user_id = u.id " +
                     "JOIN books b ON r.book_id = b.id " +
                     "ORDER BY r.reservation_date DESC";
        
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                Reservation r = new Reservation();
                r.setId(rs.getInt("id"));
                r.setBookId(rs.getInt("book_id"));
                r.setUserId(rs.getInt("user_id"));
                r.setReservationDate(rs.getTimestamp("reservation_date"));
                r.setStatus(rs.getString("status"));
                r.setBookTitle(rs.getString("book_title"));
                r.setUsername(rs.getString("username"));
                reservations.add(r);
            }
        }
        return reservations;
    }

    public List<Reservation> getReservationsByUser(int userId) throws SQLException {
        List<Reservation> reservations = new ArrayList<>();
        String sql = "SELECT r.*, b.title as book_title FROM reservations r " +
                     "JOIN books b ON r.book_id = b.id " +
                     "WHERE r.user_id = ?";
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Reservation r = new Reservation();
                    r.setId(rs.getInt("id"));
                    r.setBookId(rs.getInt("book_id"));
                    r.setUserId(userId);
                    r.setReservationDate(rs.getTimestamp("reservation_date"));
                    r.setStatus(rs.getString("status"));
                    r.setBookTitle(rs.getString("book_title"));
                    reservations.add(r);
                }
            }
        }
        return reservations;
    }
}