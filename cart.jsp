<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cart - JavaBite</title>
    <link rel="stylesheet" href="css/cart.css">
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

    <!-- Cart Section -->
    <section class="cart">
        <div class="container">
            <h2>Your Cart</h2>
            
            <c:if test="${empty cartItems}">
                <div class="empty-cart">
                    <p>Your cart is empty!</p>
                    <a href="menu" class="btn-primary">Browse Menu</a>
                </div>
            </c:if>
            
            <c:if test="${not empty cartItems}">
                <table class="cart-table">
                    <thead>
                        <tr>
                            <th>Item</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Subtotal</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${cartItems}">
                            <tr>
                                <td>Food Item #${item.foodId}</td>
                                <td>
                                    <form action="cart" method="post" style="display:inline;">
                                        <input type="hidden" name="action" value="update">
                                        <input type="hidden" name="cartItemId" value="${item.cartItemId}">
                                        <input type="hidden" name="foodId" value="${item.foodId}">
                                        <input type="number" name="quantity" value="${item.quantity}" min="1" max="10">
                                        <button type="submit" class="btn-update">Update</button>
                                    </form>
                                </td>
                                <td>₹${item.subtotal / item.quantity}</td>
                                <td>₹${item.subtotal}</td>
                                <td>
                                    <form action="cart" method="post">
                                        <input type="hidden" name="action" value="remove">
                                        <input type="hidden" name="cartItemId" value="${item.cartItemId}">
                                        <button type="submit" class="btn-remove">Remove</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                
                <div class="cart-summary">
                    <h3>Total: ₹${cart.totalAmount}</h3>
                    <a href="checkout" class="btn-checkout">Proceed to Checkout</a>
                </div>
            </c:if>
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