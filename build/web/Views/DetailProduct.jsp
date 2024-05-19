<%-- 
    Document   : DetailProduct
    Created on : Apr 9, 2024, 1:24:11 AM
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
                width: 100%;
                display: flex;
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                overflow: hidden;
            }

            .product img {
                max-width: 50%;
                height: auto;
            }

            .product-info {
                max-width: 50%;
                padding: 20px;
            }

            .product-info h2 {
                font-size: 24px;
                margin-bottom: 10px;
            }

            .product-info .price {
                font-size: 20px;
                font-weight: bold;
                color: #007bff;
            }

            .product-info .description {
                margin-top: 10px;
            }

            .product-info button {
                background-color: #007bff;
                color: #fff;
                border: none;
                padding: 10px 20px;
                font-size: 18px;
                cursor: pointer;
                border-radius: 5px;
                transition: background-color 0.3s;
                align-items: end;
            }

            .product-info button:hover {
                background-color: #0056b3;
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
            /* CSS for the sizes dropdown */
            .sizes {
                margin-bottom: 20px;
            }

            .sizes select {
                width: 200px; /* Độ rộng của dropdown */
                padding: 10px; /* Khoảng cách bên trong của dropdown */
                border: 1px solid #ccc; /* Viền của dropdown */
                border-radius: 5px; /* Độ cong của viền */
                background-color: #f9f9f9; /* Màu nền của dropdown */
                color: #333; /* Màu chữ trong dropdown */
                font-family: Arial, sans-serif; /* Font chữ của dropdown */
                font-size: 14px; /* Cỡ chữ của dropdown */
            }

            /* CSS for the paragraph "Sizes:" */
            .sizes p {
                margin-bottom: 5px; /* Khoảng cách giữa paragraph và dropdown */
                font-weight: bold; /* In đậm văn bản */
            }
            #quantity {
                width: 100px; /* Độ rộng của trường nhập số */
                padding: 10px; /* Khoảng cách bên trong của trường nhập số */
                border: 1px solid #ccc; /* Viền của trường nhập số */
                border-radius: 5px; /* Độ cong của viền */
                font-size: 14px; /* Cỡ chữ của trường nhập số */
                margin-bottom: 10px; /* Khoảng cách giữa các trường nhập */
            }

            /* CSS cho khi con trỏ rê chuột vào trường nhập số */
            #quantity:focus {
                outline: none; /* Loại bỏ đường viền khi focus */
                border-color: #007bff; /* Màu viền khi focus */
                box-shadow: 0 0 5px rgba(0, 123, 255, 0.5); /* Hiển thị shadow khi focus */
            }

            /* CSS cho nhãn bên cạnh trường nhập số */
            label {
                display: block; /* Hiển thị nhãn trên mỗi dòng */
                font-weight: bold; /* In đậm văn bản */
                margin-bottom: 5px; /* Khoảng cách giữa các nhãn */
            }
            .product-info .error {
                color: red; /* Màu chữ cho thông báo lỗi */
            }
            .product-info .success {
                color: green; /* Màu chữ cho thông báo lỗi */
            }
        </Style>
<!--        <script>
            function redirectToCheckout() {
                // Thực hiện chuyển hướng đến trang mong muốn khi nhấp vào nút "Mua Ngay"
                window.location.href = "mua";
            }
        </script>-->
    </head>

    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <main>
            <c:set var="p" value="${requestScope.detail}" />
            <div class="product">
                <img src="${p.link}" alt="Product Image">
                <div class="product-info">
                    <h2>${p.productname}</h2>
                    <p class="price">${p.price}$</p>
                    <p class="description">${p.description}</p>

                    <form action="cart" method="post">
                        <div class="sizes">
                            Sizes:
                            <select name="sizename">
                                <c:forEach var="s" items="${requestScope.size}">
                                    <option value="${s.sizename}">${s.sizename} - ${s.quantity} Sản phẩm</option>
                                </c:forEach>
                            </select>
                        </div>
                        <input type="hidden" name="product_id" value="${p.productid}">
                        <input type="hidden" name="product_name" value="${p.productname}">
                        <input type="number" id="quantity" name="quantity" min="0" value="1"><br/>
                        <p class="error">${error1}</p>
                        <p class="success">${success}</p>
                        <!--                        <button type="button" onclick="">Mua</button>-->
                        <button type="submit">Thêm vào giỏ hàng</button>
                    </form>

                </div>
            </div>
        </main>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
