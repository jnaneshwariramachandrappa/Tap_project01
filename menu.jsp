<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
           prefix="c" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Food Menu - JavaBite</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/menu.css">

    <style>
        body {
            font-family: Arial;
            margin: 0;
            background: #f6f6f6;
        }

        header {
            background: #ff4d4d;
            color: white;
            padding: 15px;
        }

        nav a {
            color: white;
            margin: 0 10px;
            text-decoration: none;
            font-weight: bold;
        }

        .menu-section {
            padding: 20px;
        }

        .menu-title {
            text-align: center;
            font-size: 28px;
            margin-bottom: 20px;
        }

        /* Search box */
        .search-box {
            text-align: center;
            margin-bottom: 20px;
        }

        .search-box input {
            padding: 10px;
            width: 300px;
            border-radius: 8px;
            border: 1px solid #ccc;
        }

        /* Grid */
        .food-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
        }

        .food-card {
            background: white;
            padding: 15px;
            border-radius: 12px;
            box-shadow: 0px 3px 10px rgba(0,0,0,0.1);
            transition: 0.3s;
        }

        .food-card:hover {
            transform: scale(1.03);
        }

        .food-card img {
            width: 100%;
            border-radius: 10px;
        }

        .food-name {
            font-size: 18px;
            font-weight: bold;
            margin-top: 10px;
        }

        .price {
            color: green;
            font-weight: bold;
        }

        button {
            background: #ff4d4d;
            color: white;
            border: none;
            padding: 8px;
            width: 100%;
            margin-top: 10px;
            border-radius: 8px;
            cursor: pointer;
        }

        button:hover {
            background: #e60000;
        }

    </style>

</head>

<body>

<header>
    <div>
        <h2>JavaBite</h2>

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

    <h2 class="menu-title">🍽 Delicious Food Menu</h2>

    <!-- SEARCH BOX -->
    <div class="search-box">
        <input type="text"
               id="searchInput"
               placeholder="Search food..."
               onkeyup="filterFood()">
    </div>

    <!-- FOOD GRID -->
    <div class="food-grid">

        <c:forEach var="item" items="${foodItems}">

            <div class="food-card"
                 data-category="${item.category}">

                <img src="${pageContext.request.contextPath}/${item.imagePath}"
                     alt="${item.foodName}">

                <div class="food-name">
                    ${item.foodName}
                </div>

                <p>${item.description}</p>

                <p>Category: ${item.category}</p>

                <p class="price">₹${item.price}</p>

                <form action="${pageContext.request.contextPath}/cart"
                      method="post">

                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="foodId" value="${item.foodId}">

                    <input type="number"
                           name="quantity"
                           value="1"
                           min="1"
                           max="10">

                    <button type="submit">Add To Cart</button>

                </form>

            </div>

        </c:forEach>

    </div>

</section>

<footer style="text-align:center; padding:20px;">
    &copy; 2026 JavaBite
</footer>

<!-- ✅ SCRIPT (IMPORTANT PLACE: BEFORE </body>) -->
<script>

function filterFood() {
    let input = document.getElementById("searchInput").value.toLowerCase();
    let cards = document.getElementsByClassName("food-card");

    for (let i = 0; i < cards.length; i++) {
        let name = cards[i].querySelector(".food-name").innerText.toLowerCase();

        if (name.includes(input)) {
            cards[i].style.display = "";
        } else {
            cards[i].style.display = "none";
        }
    }
}

</script>

</body>
</html>