<%-- 
    Document   : main
    Created on : Mar 9, 2024, 9:28:36 PM
    Author     : Dell
--%>
<%@page import="java.util.*" %>
<%@page import="Models.Products" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title >Sneaker Stash</title>
        <link rel="icon" href="img/imgback/logo.jpg" type="image/x-icon">
        <style>
            body {
                font-family: 'Arial', sans-serif;
                margin: 0;
                padding: 0;
            }

            header {
                background-color: #333;
                color: #fff;
                padding: 20px;
                text-align: center;
            }

            nav {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            nav ul {
                list-style-type: none;
                margin: 0;
                padding-left: 10%;
                display: flex;
                align-items: center;
            }

            .logo img {
                max-width: 100px;
                margin-right: 10px;
            }

            nav ul li {
                display: flex;
                align-items: center;
                justify-content: center;
                margin-right: 20px;
            }

            nav a {
                color: #fff;
                text-decoration: none;
                font-weight: bold;
                border-bottom: 2px solid transparent;
                transition: border-bottom 0.3s ease;
            }

            nav a:hover {
                border-bottom: 2px solid #fff;
            }

            .search-cart-account {
                display: flex;
                align-items: center;
                padding-right: 10%;
            }

            .search-cart-account a {
                display: flex;
                align-items: center;
                color: #fff;
                text-decoration: none;
                padding-right: 10px;
                padding-left: 20px;
            }

            .search-cart-account form {
                display: flex;
                align-items: center;
                background-color: white;
                border: 1px solid #ccc;
                border-radius: 5px 0 0 5px;
                outline: none;
            }

            .search-cart-account form input[type="text"] {
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px 0 0 5px;
                outline: none;
            }

            .search-cart-account form button img {
                max-width: 30px;
                max-height: 30px;
            }
            .search-cart-account a img {
                border-radius: 100%;
                max-width: 30px;
                margin-right: 5px;
            }
            .product {
                width: 30%;
                margin: 10px;
                text-align: center;
                border: 1px solid #ccc;
                transition: transform 0.3s ease-in-out;
                padding-bottom: 0;

            }

            .product img {
                max-width: 100%;
                height: auto;
                margin-bottom: 10px;
            }
            
            .product h2 {
                margin: 5px 0;
                font-size: 1.2em;
                margin-bottom: 5px;
            }

            .product p.price {
                margin: 5px 0;
                font-weight: bold;
                color: #333;
            }

            .product button {
                padding: 8px 12px;
                background-color: #333;
                color: #fff;
                border: none;
                border-radius: 5px;
                margin-top: 10px;
                cursor: pointer;
            }

            .product:hover {
                transform: scale(1.05); /* Hiệu ứng khi hover */
            }

            /* Các điều chỉnh cho .featured-products */
            .featured-products {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-around;
                padding: 20px;
                box-sizing: border-box; /* Bảo đảm padding không làm tăng kích thước thực tế */
            }

            .featured-products a {
                color: black; /* Màu chữ */
                text-decoration: none; /* Loại bỏ gạch chân mặc định */
                font-weight: bold; /* Độ dày chữ */
                transition: color 0.3s; /* Hiệu ứng màu khi hover */
            }
            .row-lefooter {
                background-color: #333;
                color: #fff;
                padding: 20px;
                text-align: center;
            }

            .row-lefooter div {
                max-width: 800px;
                margin: 0 auto;
            }

            .row-lefooter p, .row-lefooter h5 {
                margin: 10px 0;
            }

            /* Các điều chỉnh cho các phần tử con của footer */
            .row-lefooter p {
                font-size: 16px;
            }

            .row-lefooter h5 {
                font-size: 18px;
                font-weight: bold;
            }
            p{
                text-align: center;
                margin-bottom: 100%;
            }
        </style>
    </head>

    <body>
        <jsp:include page="header.jsp"></jsp:include>
        
        <c:set var="list" value="${requestScope.types}" />
        <section class="featured-products">
            <c:forEach var="products" items="${list}">
                <article class="product">
                    <img src="${products.link}" alt="Shoes">
                    <a href="detail?pid=${products.productid}" >${products.productname}</a>
                    <p class="price">${products.price}</p>
<!--                    <button onclick="location.href = 'AddToCart'">Add to Cart</button>-->
                </article>
            </c:forEach>

        </section>
        <c:if test="${empty list}">
            <p>Không tìm thấy kết quả của '${savetxt}'.</p>
        </c:if>

        <jsp:include page="footer.jsp"></jsp:include>

    </body>

</html>

