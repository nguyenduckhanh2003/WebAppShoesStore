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
            .mess{
                color: red;
                text-align: center;
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
                        <th>Tên đăng nhập</th>
                        <th>Mật khẩu</th>
                        <th>Email</th>
                        <th>Vai trò</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="u" items="${user}">
                        <tr>
                            <td>${u.userid}</td>
                            <td>${u.username}</td>
                            <td>${u.password}</td>
                            <td>${u.email}</td>
                            <c:if test="${u.role ==0}">
                                <td>User</td>
                            </c:if>
                            <c:if test="${u.role ==1}">
                                <td>Admin</td>
                            </c:if>
                            <c:if test="${u.role ==2}">
                                <td>Banned</td>
                            </c:if>

                            <td><button style="margin-bottom:5px" onclick="location.href = 'edituser?uid=${u.userid}'">Sửa</button><br/>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </section>
    </body>
</html>