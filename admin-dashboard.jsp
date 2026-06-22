<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JavaBite Royal Admin</title>

<style>

/* ===== GLOBAL ===== */
body {
    margin: 0;
    font-family: 'Segoe UI', sans-serif;
    background: linear-gradient(135deg, #0a0f2c, #0f1b3d, #1a2a6c);
    color: white;
}

/* ===== HEADER ===== */
.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 18px 30px;
    background: rgba(10, 20, 60, 0.7);
    backdrop-filter: blur(12px);
    border-bottom: 1px solid rgba(255,215,0,0.3);
}

.header h1 {
    margin: 0;
    font-size: 26px;
    color: gold;
    letter-spacing: 2px;
}

/* ===== SIDEBAR ===== */
.container {
    display: flex;
}

.sidebar {
    width: 240px;
    height: 100vh;
    background: rgba(0,0,0,0.35);
    backdrop-filter: blur(10px);
    padding-top: 30px;
    border-right: 1px solid rgba(255,215,0,0.2);
}

.sidebar a {
    display: block;
    padding: 14px 20px;
    color: white;
    text-decoration: none;
    transition: 0.3s;
    border-left: 3px solid transparent;
}

.sidebar a:hover {
    background: rgba(255,215,0,0.1);
    border-left: 3px solid gold;
    color: gold;
}

/* ===== MAIN ===== */
.main {
    flex: 1;
    padding: 25px;
}

/* ===== ROYAL CARDS ===== */
.cards {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
    gap: 20px;
}

.card {
    background: rgba(255,255,255,0.08);
    backdrop-filter: blur(10px);
    padding: 20px;
    border-radius: 16px;
    border: 1px solid rgba(255,215,0,0.2);
    transition: 0.3s;
}

.card:hover {
    transform: translateY(-5px);
    box-shadow: 0 10px 25px rgba(0,0,0,0.4);
}

.card h3 {
    margin: 0;
    color: gold;
}

.card p {
    font-size: 24px;
    font-weight: bold;
}

/* ===== TABLE ===== */
table {
    width: 100%;
    margin-top: 25px;
    border-collapse: collapse;
    background: rgba(255,255,255,0.05);
    backdrop-filter: blur(10px);
    border-radius: 12px;
    overflow: hidden;
}

th {
    background: rgba(255,215,0,0.2);
    color: gold;
    padding: 12px;
}

td {
    padding: 12px;
    text-align: center;
    border-bottom: 1px solid rgba(255,255,255,0.1);
}

/* ===== STATUS BADGE ===== */
.status {
    padding: 5px 10px;
    border-radius: 20px;
    font-size: 12px;
    background: gold;
    color: black;
    font-weight: bold;
}

/* ===== BUTTON ===== */
.btn {
    padding: 6px 12px;
    border: none;
    border-radius: 6px;
    background: linear-gradient(135deg, #ffd700, #ffb700);
    color: black;
    cursor: pointer;
    font-weight: bold;
}

.btn:hover {
    transform: scale(1.05);
}

</style>
</head>

<body>

<!-- HEADER -->
<div class="header">
    <h1>JavaBite Royal Admin 👑</h1>
    <div>Welcome, Admin</div>
</div>

<div class="container">

    <!-- SIDEBAR -->
    <div class="sidebar">
        <a href="admin-dashboard.jsp">🏠 Dashboard</a>
        <a href="admin/orders">📦 Orders</a>
        <a href="menu">🍽 Food Items</a>
        <a href="logout">🚪 Logout</a>
    </div>

    <!-- MAIN -->
    <div class="main">

        <h2 style="color:gold;">Luxury Dashboard Overview</h2>

        <!-- CARDS -->
        <div class="cards">

            <div class="card">
                <h3>Total Orders</h3>
                <p>120</p>
            </div>

            <div class="card">
                <h3>Pending</h3>
                <p>15</p>
            </div>

            <div class="card">
                <h3>Delivered</h3>
                <p>95</p>
            </div>

            <div class="card">
                <h3>Revenue</h3>
                <p>₹25,000</p>
            </div>

        </div>

        <!-- ORDERS TABLE -->
        <h2 style="margin-top:30px; color:gold;">Recent Orders</h2>

        <table>
            <tr>
                <th>Order ID</th>
                <th>User</th>
                <th>Total</th>
                <th>Status</th>
                <th>Action</th>
            </tr>

            <c:forEach var="o" items="${orders}">
                <tr>
                    <td>${o.orderId}</td>
                    <td>${o.userId}</td>
                    <td>₹${o.totalAmount}</td>
                    <td><span class="status">${o.orderStatus}</span></td>
                    <td><button class="btn">View</button></td>
                </tr>
            </c:forEach>

        </table>

    </div>
</div>

</body>
</html>