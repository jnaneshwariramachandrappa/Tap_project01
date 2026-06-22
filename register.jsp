<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - JavaBite</title>
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
    <div class="login-container">
        <div class="login-box">
            <h1>JavaBite</h1>
            <h2>Create Account</h2>
            
            <% String error = (String) request.getAttribute("error"); %>
            <% if (error != null) { %>
                <div class="error-message"><%= error %></div>
            <% } %>
            
            <form action="register" method="post">
                <div class="form-group">
                    <label for="fullName">Full Name</label>
                    <input type="text" id="fullName" name="fullName" 
                           placeholder="Enter your full name" required>
                </div>
                
                <div class="form-group">
                    <label for="phone">Phone Number</label>
                    <input type="text" id="phone" name="phone" 
                           placeholder="Enter your phone number" required>
                </div>
                
                <div class="form-group">
                    <label for="address">Address</label>
                    <textarea id="address" name="address" rows="3" 
                              placeholder="Enter your delivery address" required></textarea>
                </div>
                
                <button type="submit" class="btn-login">Register</button>
            </form>
            
            <p class="signup-link">
                Already have an account? 
                <a href="login">Login here</a>
            </p>
        </div>
    </div>
</body>
</html>