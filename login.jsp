<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - JavaBite</title>
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
    <div class="login-container">
        <div class="login-box">
            <h1>JavaBite</h1>
            <h2>Login</h2>
            
            <% String error = (String) request.getAttribute("error"); %>
            <% if (error != null) { %>
                <div class="error-message"><%= error %></div>
            <% } %>
            
            <form action="login" method="post">
                <div class="form-group">
                    <label for="phone">Phone Number</label>
                    <input type="text" id="phone" name="phone" 
                           placeholder="Enter your phone number" required>
                </div>
                
                <button type="submit" class="btn-login">Login</button>
            </form>
            
            <p class="signup-link">
                Don't have an account? 
                <a href="register">Sign up here</a>
            </p>
        </div>
    </div>
</body>
</html>