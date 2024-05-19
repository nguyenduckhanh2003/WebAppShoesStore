<%--
    Document   : contact
    Created on : Mar 12, 2024, 8:23:56 PM
    Author     : Dell
--%>

<%@page import="java.util.*" %>
<%@page import="Models.Products" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }

            .container {
                max-width: 600px;
                margin: 50px auto;
                background-color: #fff;
                padding: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            p {
                margin-bottom: 16px;
            }

            .contact-info {
                font-size: 16px;
                line-height: 1.6;
            }
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
            .row-lefooter {
                position: fixed;
                bottom: 0;
                width: 100%;
                background-color: #333;
                color: #fff;
                padding: 20px;
                text-align: center;
            }

            .row-lefooter div {
                max-width: 800px;
                margin: 0 auto;
            }

            .row-lefooter p,
            .row-lefooter h5 {
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
        </style>
    </head>

    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <div class="container">
                <h2>SNEAKER STASH</h2>
                <p>Sneaker stash cảm ơn bạn đã ghé qua cửa hàng chúng tôi.
                    Sneaker stash muốn mang lại cho người dùng những trải nghiệm tốt nhất và những đôi giày chất lượng nhất..</p>

                <div class="contact-info">
                    <p>Điện thoại: 0988516740</p>
                    <p>Địa chỉ: FPT</p>
                </div>
            </div>


        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
