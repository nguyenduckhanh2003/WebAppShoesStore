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
            .container {
                width: 50%; /* Độ rộng của container */
                margin: 0 auto; /* Căn giữa container */
                padding: 20px; /* Khoảng cách nội dung và viền container */
                border: 1px solid #ccc; /* Viền container */
                border-radius: 5px; /* Bo tròn góc container */
                margin-top: 10px;
                margin-bottom: 10px;
            }

            h2 {
                font-size: 24px; /* Cỡ chữ tiêu đề */
                margin-bottom: 20px; /* Khoảng cách dưới của tiêu đề */
            }

            form {
                width: 100%; /* Độ rộng của form */
            }

            label {
                font-weight: bold; /* Đậm chữ label */
            }

            input[type="text"],
            input[type="number"],
            textarea,
            select {
                width: 100%; /* Độ rộng của input, textarea, select */
                padding: 8px; /* Khoảng cách nội dung và viền */
                margin-bottom: 10px; /* Khoảng cách dưới của input, textarea, select */
                border: 1px solid #ccc; /* Viền input, textarea, select */
                border-radius: 5px; /* Bo tròn góc input, textarea, select */
                box-sizing: border-box; /* Đảm bảo kích thước tính cả border và padding */
            }

            button[type="submit"] {
                padding: 10px 20px; /* Khoảng cách nội dung và viền của nút submit */
                background-color: #007bff; /* Màu nền nút submit */
                color: #fff; /* Màu chữ của nút submit */
                border: none; /* Loại bỏ viền của nút submit */
                border-radius: 5px; /* Bo tròn góc nút submit */
                cursor: pointer; /* Thay đổi con trỏ khi di chuột qua nút submit */
                font-size: 16px; /* Cỡ chữ của nút submit */
            }

            button[type="submit"]:hover {
                background-color: #0056b3; /* Màu nền nút submit khi hover */
            }
            p{
                color: red;
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
        <div class="container">
            <h2>Thêm kích cỡ</h2>
            <form action="addsize" method="post">
                <label for="id">ID sản phẩm:</label>
                <input type="text" id="id" name="id"><br><br>

                <label for="sizename">Kích cỡ:</label>
                <input type="text" id="sizename" name="sizename"><br><br>

                <label for="quantity">Quantity:</label>
                <input type="text" id="quantity" name="quantity"><br><br>

                <p>${error1}</p>
                <p>${error2}</p>
                <p>${error3}</p>
                <button type="submit">Nộp</button>
            </form>
        </div>
    </body>
</html>