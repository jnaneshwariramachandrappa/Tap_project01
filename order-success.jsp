<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Success - JavaBite</title>
    <link rel="stylesheet" href="css/home.css">
</head>
<body>
    <!-- Header -->
    <header>
        <div class="container">
            <h1>JavaBite</h1>
            <nav>
                <a href="home">Home</a>
                <a href="menu">Menu</a>
                <a href="cart">Cart</a>
                <a href="order">My Orders</a>
                <a href="logout">Logout</a>
            </nav>
            <p>Welcome, ${userName}!</p>
        </div>
    </header>

    <!-- Success Section -->
    <section class="order-success">
        <div class="container">
            <div class="success-box">
                <h2>✓ Order Placed Successfully!</h2>
                <p>Your order ID is: <strong>#${order.orderId}</strong></p>
                <p>Total Amount: <strong>₹${order.totalAmount}</strong></p>
                <p>Status: <strong>${order.orderStatus}</strong></p>
                <p>Payment Method: <strong>${order.paymentMethod}</strong></p>
                <p>Delivery Address: <strong>${order.deliveryAddress}</strong></p>
                
                <div class="actions">
                    <a href="home" class="btn-primary">Continue Shopping</a>
                    <a href="order" class="btn-secondary">View My Orders</a>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <div class="container">
            <p>&copy; 2026 JavaBite. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>