// js/validation.js

function validateBookForm() {
    let title = document.getElementById("title").value.trim();
    let author = document.getElementById("author").value.trim();
    
    if (title === "" || author === "") {
        alert("Both title and author must be filled out.");
        return false;
    }
    
    if (title.length < 2 || author.length < 2) {
        alert("Title and author must be at least 2 characters long.");
        return false;
    }
    
    return true;
}

function validateLoginForm() {
    let username = document.getElementById("username").value.trim();
    let password = document.getElementById("password").value.trim();
    
    if (username === "" || password === "") {
        alert("Both username and password are required.");
        return false;
    }
    
    if (username.length < 4) {
        alert("Username must be at least 4 characters long.");
        return false;
    }
    
    if (password.length < 6) {
        alert("Password must be at least 6 characters long.");
        return false;
    }
    
    return true;
}

function validateSearchForm() {
    let query = document.getElementById("searchBox").value.trim();
    
    if (query === "") {
        alert("Please enter a search term.");
        return false;
    }
    
    if (query.length < 2) {
        alert("Search term must be at least 2 characters long.");
        return false;
    }
    
    return true;
}