<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">Fruitables</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="oi oi-menu"></span> Menu
        </button>

        <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active"><a href="index.jsp" class="nav-link">Trang Chủ</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="product.jsp" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Sản Phẩm</a>
                    <div class="dropdown-menu" aria-labelledby="dropdown04">
                        <a class="dropdown-item" href="product.jsp">Tất Cả</a>
                        <a class="dropdown-item" href="product.jsp">Trái Cây</a>
                        <a class="dropdown-item" href="product.jsp">Rau</a>
                        <a class="dropdown-item" href="product.jsp">Nước Ép</a>
                        <a class="dropdown-item" href="product.jsp">Thực Phẩm Khô</a>
                    </div>
                </li>
                <li class="nav-item"><a href="about.jsp" class="nav-link">Về Chúng Tôi</a></li>
                <li class="nav-item"><a href="login.jsp" class="nav-link">Đăng Nhập</a></li>
                <li class="nav-item cta cta-colored"><a href="cart.jsp" class="nav-link"><span class="icon-shopping_cart"></span>[0]</a></li>

            </ul>
        </div>
    </div>
</nav>
<!-- END nav -->
