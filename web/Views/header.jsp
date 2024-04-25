
<%@page import="java.util.*" %>
<%@page import="Models.Products" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header>
    <nav>
        <ul>
            <li class="logo"><a href="MainPage"><img src="img/imgback/logo.jpg" alt="Your Shoe Store"></a></li>
            <li><a href="MainPage">Trang chủ</a></li>
                <c:forEach var="cate" items="${listcate}">
                <li><a href="category?cid=${cate.categoriesid}">${cate.categoriesname}</a></li>
                </c:forEach>
            <li><a href="ContactServlet">Liên hệ</a></li>
        </ul>
        <div class="search-cart-account">
            <form action="search" method="post">
                <input value="${savetxt}" name="txt" type="text" placeholder="Tìm kiếm...">
                <button type="submit"><img src="img/imgback/search1.jpg" alt="Search"></button>
            </form>
            <c:if test="${sessionScope.account !=null&&sessionScope.account.role==0}">
                <a href="cartuser?uid=${account.userid}" title="Cart"><img src="img/imgback/sart.jpg" alt="Cart"></a>
                </c:if>
                <c:if test="${sessionScope.account ==null}">            
                <a href="LoginServlet">Đăng nhập</a>
                <a href="RegisterServlet">Đăng kí</a>
            </c:if>
            <c:if test="${sessionScope.account !=null&&sessionScope.account.role==0}">  
                <a class="" href="#">Xin chào ${sessionScope.account.username}</a>
                <a class="" href="orderuser?uid=${account.userid}">Lịch sử</a>
                <a class="" href="logout">Đăng xuất</a>
            </c:if>

        </div>
    </nav>
</header>