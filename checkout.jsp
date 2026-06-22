<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout - JavaBite</title>

<link rel="stylesheet" href="css/cart.css">

<style>
.qr-section {
    display: none;
    text-align: center;
    margin-top: 20px;
    padding: 15px;
    background: #f8f9ff;
    border-radius: 12px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.1);
}

.qr-section img {
    width: 180px;
    height: 180px;
    border-radius: 10px;
    margin-top: 10px;
}
</style>

</head>

<body>

<!-- HEADER -->
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

<!-- CHECKOUT -->
<section class="checkout">
<div class="container">

<h2>Checkout</h2>

<!-- ERROR -->
<%
String error = (String) request.getAttribute("error");
if (error != null) {
%>
<div style="color:red;"><%= error %></div>
<%
}
%>

<div class="checkout-container">

    <!-- FORM -->
    <div class="checkout-form">

        <h3>Delivery Details</h3>

        <form action="checkout" method="post">

            <div class="form-group">
                <label>Delivery Address</label>
                <textarea name="deliveryAddress" rows="4" required></textarea>
            </div>

            <div class="form-group">
                <label>Payment Method</label>

                <select id="paymentMethod" name="paymentMethod" required onchange="checkPaymentMethod()">
                    <option value="Cash on Delivery">Cash on Delivery</option>
                    <option value="Card">Card</option>
                    <option value="UPI">UPI</option>
                </select>

            </div>

            <!-- QR CODE SECTION -->
            <div class="qr-section" id="qrBox">
                <h3>Scan & Pay using UPI</h3>

                <img src="images/qr-code.png" alt="QR Code">

                <p>Use Google Pay / PhonePe / Paytm</p>
            </div>

            <button type="submit" class="btn-place-order">
                Place Order
            </button>

        </form>

    </div>

    <!-- ORDER SUMMARY -->
    <div class="order-summary">

        <h3>Order Summary</h3>

        <table>
            <c:forEach var="item" items="${cartItems}">
                <tr>
                    <td>Item #${item.foodId} x ${item.quantity}</td>
                    <td>₹${item.subtotal}</td>
                </tr>
            </c:forEach>
        </table>

        <hr>

        <div>
            <strong>Total: ₹${cart.totalAmount}</strong>
        </div>

    </div>

</div>

</div>
</section>

<!-- FOOTER -->
<footer>
    &copy; 2026 JavaBite
</footer>

<!-- JS -->
<script>
function checkPaymentMethod() {
    let payment = document.getElementById("paymentMethod").value;
    let qrBox = document.getElementById("qrBox");

    if (payment === "UPI") {
        qrBox.style.display = "block";
    } else {
        qrBox.style.display = "none";
    }
}
</script>

</body>
</html>