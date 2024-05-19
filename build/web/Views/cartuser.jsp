<%-- 
    Document   : addtocart
    Created on : Mar 11, 2024, 9:54:30 AM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
            /* Định dạng chung cho bảng */
            table {
                width: 100%;
                border-collapse: collapse;
            }

            /* Kiểu cho phần header của bảng */
            thead {
                background-color: #f2f2f2;
            }

            /* Kiểu cho các ô tiêu đề */
            th {
                padding: 8px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            /* Kiểu cho các ô dữ liệu */
            td {
                padding: 8px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            /* Kiểu cho các ô trong cột Actions */
            td:last-child {
                text-align: center;
            }

            /* Kiểu cho nút Delete */
            .cart button {
                padding: 6px 10px;
                background-color: #ff5733;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            /* Kiểu cho nút Delete khi rê chuột vào */
            .cart button:hover {
                background-color: #d6341d;
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
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <table class="cart">
                <thead>
                    <tr>
                        <th></th>
                        <th>Tên sản phẩm</th>
                        <th>Số lượng</th>
                        <th>Kích cỡ</th>
                        <th>Tổng</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="c" items="${cart}">
                    <tr>
                        <td><button onclick="location.href = 'deletecart?cartid=${c.cartid}'">Hủy</button></td>
                        <td>${c.productname}</td>
                        <td>${c.quantity}</td>
                        <td>${c.size}</td>
                        <td>${c.totalprice}</td>
                        <td>
                            <button onclick="location.href = 'order?cartid=${c.cartid}'">Đặt hàng</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
