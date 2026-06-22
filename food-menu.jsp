<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
           prefix="c" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Menu - JavaBite</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/menu.css">

</head>

<body>

<header>

    <div class="container">

        <h1>JavaBite</h1>

        <nav>

            <a href="${pageContext.request.contextPath}/home">Home</a>
            <a href="${pageContext.request.contextPath}/menu">Menu</a>
            <a href="${pageContext.request.contextPath}/cart">Cart</a>
            <a href="${pageContext.request.contextPath}/order">My Orders</a>
            <a href="${pageContext.request.contextPath}/logout">Logout</a>

        </nav>

    </div>

</header>

<section class="menu-section">

    <h2 class="menu-title">Delicious Food Menu</h2>

    <div class="food-grid">

        <c:forEach var="item" items="${foodItems}">

            <div class="food-card">

                <!-- FIXED IMAGE PATH -->
                <img src="${pageContext.request.contextPath}/${item.imagePath}"
                     alt="${item.foodName}"
                     width="250"
                     height="180">

                <div class="food-details">

                    <h3>${item.foodName}</h3>

                    <p class="description">${item.description}</p>

                    <p class="category">Category: ${item.category}</p>

                    <p class="price">Price: ₹${item.price}</p>

                    <form action="${pageContext.request.contextPath}/cart"
                          method="post">

                        <input type="hidden" name="action" value="add">

                        <input type="hidden"
                               name="foodId"
                               value="${item.foodId}">

                        <input type="number"
                               name="quantity"
                               value="1"
                               min="1"
                               max="10">

                        <button type="submit" class="btn-add">
                            Add To Cart
                        </button>

                    </form>

                </div>

            </div>

        </c:forEach>

    </div>

</section>

<footer>

    <p>&copy; 2026 JavaBite. All Rights Reserved.</p>

</footer>

</body>
</html>