<%-- 
    Document   : orders
    Created on : Apr 21, 2024, 5:56:22 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            .container {
                display: flex;
                justify-content: space-between;
                width: 80%;
                margin: 0 auto;
            }

            .container-info {
                flex: 1;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
                background-color: #f9f9f9;
            }

            .container-info label {
                font-weight: bold;
            }
            .container-info input[type="text"]{
                width: 100%;
            }

            .container-info input[type="text"],
            .container-info input[type="radio"] {
                margin-bottom: 10px;
            }

            .container-info button[type="submit"] {
                background-color: #4caf50;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            .container-info button[type="submit"]:hover {
                background-color: #45a049;
            }

            .container-cart {
                flex: 1;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
                background-color: #f9f9f9;
            }

            .container-cart label {
                font-weight: bold;
            }

            .container-cart input[type="text"],
            .container-cart h4 {
                margin-bottom: 10px;
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
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                // Lấy ngày hiện tại
                var today = new Date();

                // Định dạng ngày tháng năm theo YYYY-MM-DD
                var formattedDate = today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + today.getDate();

                // Gán giá trị ngày hiện tại vào trường input ẩn
                document.getElementById("order_date").value = formattedDate;
            });
        </script>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <form action="order" method="post">
                <div class="container">
                    <div class="container-info">
                        <label for="name">Họ và tên:</label><br>
                        <input type="text" id="name" name="name" ><br>

                        <label for="address">Địa chỉ:</label><br>
                        <input type="text" id="address" name="address" ><br>

                        <label for="phonenumber">Số điện thoại:</label><br>
                        <input type="text" id="phonenumber" name="phonenumber"><br>

                        <label for="payment">Hình thức thanh toán:</label><br><br>
                        <input type="radio" id="payment_cash_on_delivery" name="payment" value="Thanh toán khi nhận hàng" checked>
                        <label for="payment_cash_on_delivery">Thanh toán khi nhận hàng</label>
                        <input type="radio" id="payment_bank_transfer" name="payment" value="Chuyển khoản">
                        <label for="payment_bank_transfer">Chuyển khoản</label><br>

                        <input type="hidden" id="order_date" name="order_date" value="">
                        <input type="hidden" id="status" name="status" value="Chuẩn bị">
                        <button type="submit">Đặt hàng</button>
                    </div>
                    <div class="container-cart">
                        <input type="hidden" name="cartid" value="${cart.cartid}">
                    <input type="hidden" name="productid" value="${cart.productid}">
                    <div>
                        <p><strong>Tên sản phẩm:</strong> ${cart.productname}</p>
                        <input type="hidden" name="productname" value="${cart.productname}">
                    </div>
                    <div>
                        <p><strong>Kích cỡ:</strong> ${cart.size}</p>
                        <input type="hidden" name="size" value="${cart.size}">
                    </div>
                    <div>
                        <p><strong>Số lượng:</strong> ${cart.quantity}</p>
                        <input type="hidden" name="quantity" value="${cart.quantity}">
                    </div>
                    <div>
                        <p><strong>Tổng tiền:</strong> ${cart.totalprice}$</p>
                        <input type="hidden" name="totalprice" value="${cart.totalprice}">
                    </div>
                </div>
            </div>

        </form>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
