<%-- 
    Document   : login
    Created on : Mar 2, 2024, 7:45:48 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background: url('img/imgback/backlogin.png') center/cover no-repeat;
                background-color: #f4f4f4;
                display: flex;
                align-items: center;
                justify-content: center;
                height: 100vh;
                margin: 0;
            }

            .login-container {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 300px;
                text-align: center;
            }

            .login-container h2 {
                margin-bottom: 20px;
            }

            .login-container form {
                display: flex;
                flex-direction: column;
            }

            .login-container input {
                margin-bottom: 10px;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                outline: none;
            }

            .login-container button {
                background-color: #4CAF50;
                color: white;
                padding: 10px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            .login-container button:hover {
                background-color: #45a049;
            }
            p {
                margin-bottom: 10px;
                line-height: 1.5;
                font-size: 14px;
            }

            a {
                text-decoration: none;
                color: #007bff;
                font-weight: bold;
                font-size: 14px;
            }

            a:hover {
                text-decoration: underline;
            }
            .text-danger{
                color: red;
                text-align: left;

            }
        </style>
    </head>

    <body>
        <div class="login-container">
            <h2>Đăng nhập</h2>
            <form action="LoginServlet" method="post">
                <input type="text" placeholder="Username" name="username">
                <input type="password" placeholder="Password" name="password">
                <p class="text-danger">${mess}</p>
                <button type="submit">Đăng nhập</button>
            </form>
            <p>Bạn chưa có tài khoản? <a href="RegisterServlet">Đăng kí tại đây</a></p>
        </div>
    </body>
</html>
