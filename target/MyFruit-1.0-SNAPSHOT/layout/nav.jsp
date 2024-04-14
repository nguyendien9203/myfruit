<%@ page import="vn.fpt.entity.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
        <a class="navbar-brand" href="home">MyFruit</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="oi oi-menu"></span> Menu
        </button>

        <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active"><a href="home" class="nav-link">Trang Chủ</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="product" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Sản Phẩm</a>
                    <div class="dropdown-menu" aria-labelledby="dropdown04">
                        <a class="dropdown-item" href="product">Tất Cả</a>
                        <c:forEach items="${categories}" var="category">
                            <a class="dropdown-item" href="product?categoryId=${category.id}">${category.name}</a>
                        </c:forEach>
                    </div>
                </li>
                <li class="nav-item"><a href="about" class="nav-link">Về Chúng Tôi</a></li>
                <%
                     session = request.getSession(false);
                    if (session == null || session.getAttribute("user") == null) {
                %>
                <li class="nav-item"><a href="login" class="nav-link">Đăng Nhập</a></li>
                <%
                } else {
                    User user = (User) session.getAttribute("user");
                %>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <%= user.getFullName() %>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="info">Thông tin cá nhân</a>
                        <a class="dropdown-item" href="logout">Đăng Xuất</a>
                    </div>
                </li>
                <%
                    }
                %>
                <li class="nav-item cta cta-colored"><a href="cart" class="nav-link">
                    <span class="icon-shopping_cart">
                     <c:choose>
                        <c:when test="${not empty sessionScope.order and not empty sessionScope.order.orderItem}">
                            [<c:out value="${sessionScope.order.orderItem.size()}"/>]
                        </c:when>
                        <c:otherwise>[0]</c:otherwise>
                    </c:choose>
                </li>

            </ul>
        </div>
    </div>
</nav>
<!-- END nav -->
