/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class Book {
    private int id;
    private String title;
    private String author;
    private String status;
    
    // Getters and Setters
    public int getId() {
        return id; 
    }
    public void setId(int id) {
        this.id = id; 
    }
    public String getTitle() {
        return title; 
    }
    public void setTitle(String title) {
        this.title = title; 
    }
    public String getAuthor() {
        return author; 
    }
    public void setAuthor(String author) {
        this.author = author; 
    }
    public String getStatus() {
        return status; 
    }
    public void setStatus(String status) {
        this.status = status; 
    }
}