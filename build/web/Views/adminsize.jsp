<%@ page import="java.util.*" %>
<%@ page import="Models.Products" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
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
            .imgfix {
                width: 200px;
                height: auto;
            }
            .container {
                text-align: right;
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
            <div class="container">
                <button class="add-product-btn" onclick="location.href = 'addsize'">Thêm kích cỡ</button>
            </div>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>ID sản phẩm</th>
                        <th>Kich cỡ</th>
                        <th>Số lượng</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="s" items="${size}">
                        <tr>
                            <td>${s.sizeid}</td>
                            <td>${s.productid}</td>
                            <td>${s.sizename}</td>
                            <td>${s.quantity}</td>
                            <td><button style="margin-bottom:5px" onclick="location.href = 'editsize?editid=${s.sizeid}'">Sửa</button><br/>
                                <button  onclick="location.href = 'deletesize?deleteid=${s.sizeid}'">Xóa</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </section>
    </body>
</html>