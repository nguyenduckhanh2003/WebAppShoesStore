<%-- 
    Document   : manageorder
    Created on : Apr 23, 2024, 11:52:28 AM
    Author     : Dell
--%>
<%@ page import="java.util.*" %>
<%@ page import="Models.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            /* CSS styling */
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
            }
            header {
                background-color: #333;
                color: #fff;
                padding: 10px 20px;
                text-align: center;
            }
            nav {
                background-color: #666;
                padding: 10px;
            }
            nav ul {
                list-style-type: none;
                margin: 0;
                padding: 0;
                text-align: center;
            }
            nav ul li {
                display: inline;
                margin-right: 20px;
            }
            nav ul li a {
                color: #fff;
                text-decoration: none;
            }
            section {
                padding: 20px;
            }
            table {
                width: 100%;
                border-collapse: collapse;
            }
            th, td {
                padding: 8px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }
            th {
                background-color: #f2f2f2;
            }
            .add-product-btn {
                padding: 10px 20px;
                font-size: 16px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s;
                margin-bottom: 20px;
            }

            .add-product-btn:hover {
                background-color: #0056b3;
            }
            button {
                padding: 6px 10px;
                background-color: #ff5733;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            /* Kiểu cho nút Delete khi rê chuột vào */
            button:hover {
                background-color: #d6341d;
            }
            .mess{
                color: red;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <header>
            <h1>Admin Quản lí</h1>
        </header>
        <nav>
            <ul>
                <li><a href="AdminServlet">Sản phẩm</a></li>
                <li><a href="managesize">Kích thước và số lượng sản phẩm</a></li>
                <li><a href="manageorder">Đặt Hàng</a></li>
                <li><a href="manageusers">Người dùng</a></li>
                <li><a href="logout">Đăng xuất</a></li>
            </ul>
        </nav>
        <section>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>ID khách</th>
                        <th>Tên</th>
                        <th>Địa chỉ</th>
                        <th>Số điện thoại</th>
                        <th>Tên sản phẩm</th>
                        <th>Ngày đặt</th>
                        <th>Kích cỡ</th>
                        <th>Số lượng</th>
                        <th>Tổng tiền</th>
                        <th>Hình thức thanh toán</th>
                        <th>Trạng thái</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="o" items="${order}">
                        <tr>
                            <td>${o.orderdetailid}</td>
                            <td>${o.userid}</td>
                            <td>${o.name}</td>
                            <td>${o.address}</td>
                            <td>${o.number}</td>
                            <td>${o.productname}</td>
                            <td>${o.orderdate}</td>
                            <td>${o.sizename}</td>
                            <td>${o.quantity}</td>
                            <td>${o.totalprice}</td>
                            <td>${o.payment}</td>
                            <td>${o.status}</td>
                            <td><button style="margin-bottom:5px" onclick="location.href = 'editorder?oid=${o.orderdetailid}'">Sửa</button><br/>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </section>
    </body>
</html>
