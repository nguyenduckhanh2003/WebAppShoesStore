<%-- 
    Document   : register
    Created on : Mar 2, 2024, 7:46:04 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <style> body {
                background: url('img/imgback/backlogin.png') center/cover no-repeat;
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                display: flex;
                align-items: center;
                justify-content: center;
                height: 100vh;
                margin: 0;
            }

            .registration-container {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 300px;
                text-align: center;
            }

            .registration-container h2 {
                margin-bottom: 20px;
            }

            .registration-container form {
                display: flex;
                flex-direction: column;
            }

            .registration-container label {
                text-align: left;
                margin-bottom: 5px;
            }

            .registration-container input {
                margin-bottom: 10px;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                outline: none;
            }

            .registration-container button {
                background-color: #4CAF50;
                color: white;
                padding: 10px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            .registration-container button:hover {
                background-color: #45a049;
            }
            .registration-container .back-button {
                cursor: pointer;
                font-size: 14px;
                color: #333;
                text-decoration: underline;
                margin-bottom: 10px;
                text-align: left;
            }
            .text-danger{
                color: red;
                text-align: left;

            }
        </style>
    </head>

    <body>
        <div class="registration-container">
            <h2>Đăng kí</h2>
            <form action="RegisterServlet" method="post">
                <label for="email">Email:</label>
                <input type="text" id="email" name="email">

                <label for="username">Tên đăng nhập:</label>
                <input type="text" id="username" name="username">

                <label for="password">Mật khẩu:</label>
                <input type="password" id="password" name="password">

                <label for="password">Mật khẩu:</label>
                <input type="password" id="password" name="repeat">
                <p class="text-danger">${empty1}</p>
                <p class="text-danger">${mess}</p>
                <p class="text-danger">${pass}</p>
                <p class="text-danger">${errormail}</p>
                <button class="submit" type="submit">Đăng kí</button><br/>
            </form>
            <a href="LoginServlet" class="back-button">&lt; Quay lại</a>
        </div>
    </body>
</html>
