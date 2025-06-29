/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

public class Reservation {
    private int id;
    private int bookId;
    private int userId;
    private Date reservationDate;
    private String status;
    private String bookTitle;
    private String username;
    
    // Getters and Setters
    public int getId() {
        return id; 
    }
    public void setId(int id) {
        this.id = id; 
    }
    public int getBookId() {
        return bookId; 
    }
    public void setBookId(int bookId) {
        this.bookId = bookId; 
    }
    public int getUserId() {
        return userId; 
    }
    public void setUserId(int userId) {
        this.userId = userId; 
    }
    public Date getReservationDate() {
        return reservationDate; 
    }
    public void setReservationDate(Date reservationDate) {
        this.reservationDate = reservationDate; 
    }
    public String getStatus() {
        return status; 
    }
    public void setStatus(String status) {
        this.status = status; 
    }
    public String getBookTitle() {
        return bookTitle; 
    }
    public void setBookTitle(String bookTitle) {
        this.bookTitle = bookTitle; 
    }
    public String getUsername() {
        return username; 
    }
    public void setUsername(String username) {
        this.username = username; 
    }
}