<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>My Orders - JavaBite</title>

    <style>
        body {
            font-family: Segoe UI;
            margin: 0;
            background: #f5f7ff;
        }

        header {
            background: linear-gradient(135deg, #1e3a8a, #0f172a);
            color: white;
            padding: 15px;
            text-align: center;
        }

        h2 {
            text-align: center;
            color: #1e3a8a;
            margin-top: 20px;
        }

        table {
            width: 90%;
            margin: 30px auto;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 6px 20px rgba(0,0,0,0.1);
            border-radius: 10px;
            overflow: hidden;
        }

        th {
            background: #1e3a8a;
            color: white;
            padding: 12px;
        }

        td {
            padding: 12px;
            text-align: center;
            color: #333;
        }

        tr:nth-child(even) {
            background: #f1f5ff;
        }

        tr:hover {
            background: #e0e7ff;
        }

        .status {
            padding: 5px 10px;
            border-radius: 6px;
            font-weight: bold;
        }

        .Pending { background: orange; color: white; }
        .Delivered { background: green; color: white; }
        .Cancelled { background: red; color: white; }

    </style>

</head>

<body>

<header>
    <h1>JavaBite Orders</h1>
</header>

<h2>My Orders</h2>

<c:if test="${empty orders}">
    <p style="text-align:center; color:red;">No orders found</p>
</c:if>

<table>

    <tr>
        <th>Order ID</th>
        <th>Total</th>
        <th>Status</th>
        <th>Payment</th>
        <th>Address</th>
    </tr>

    <c:forEach var="o" items="${orders}">
        <tr>
            <td>${o.orderId}</td>
            <td>₹${o.totalAmount}</td>

            <td>
                <span class="status ${o.orderStatus}">
                    ${o.orderStatus}
                </span>
            </td>

            <td>${o.paymentMethod}</td>
            <td>${o.deliveryAddress}</td>
        </tr>
    </c:forEach>

</table>

</body>
</html>