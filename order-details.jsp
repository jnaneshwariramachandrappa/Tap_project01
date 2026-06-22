<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Orders - JavaBite Admin</title>
    <link rel="stylesheet" href="../css/admin.css">
</head>
<body>
    <!-- Header -->
    <header>
        <div class="container">
            <h1>JavaBite Admin</h1>
            <nav>
                <a href="orders">Orders</a>
                <a href="../logout">Logout</a>
            </nav>
            <p>Admin: ${admin}</p>
        </div>
    </header>

    <!-- Orders Section -->
    <section class="admin-orders">
        <div class="container">
            <h2>Manage Orders</h2>
            
            <table class="orders-table">
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>User ID</th>
                        <th>Total Amount</th>
                        <th>Status</th>
                        <th>Payment Method</th>
                        <th>Delivery Address</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="order" items="${orders}">
                        <tr>
                            <td>#${order.orderId}</td>
                            <td>${order.userId}</td>
                            <td>₹${order.totalAmount}</td>
                            <td>${order.orderStatus}</td>
                            <td>${order.paymentMethod}</td>
                            <td>${order.deliveryAddress}</td>
                            <td>
                                <form action="orders" method="post">
                                    <input type="hidden" name="orderId" value="${order.orderId}">
                                    <select name="status" required>
                                        <option value="Pending">Pending</option>
                                        <option value="Preparing">Preparing</option>
                                        <option value="Out for Delivery">Out for Delivery</option>
                                        <option value="Delivered">Delivered</option>
                                        <option value="Cancelled">Cancelled</option>
                                    </select>
                                    <button type="submit" class="btn-update">Update</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <div class="container">
            <p>&copy; 2026 JavaBite Admin Panel. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>