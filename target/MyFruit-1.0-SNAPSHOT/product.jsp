<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>MyFruit - Sản Phẩm</title>
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">

    <link rel="stylesheet" href="css/animate.css">

    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">


    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="goto-here">
    <jsp:include page="./layout/nav.jsp"></jsp:include>
    <div class="hero-wrap hero-bread" style="background-image: url('images/bg_1.jpg');">
        <div class="container">
            <div class="row no-gutters slider-text align-items-center justify-content-center">
                <div class="col-md-9 ftco-animate text-center">
                    <p class="breadcrumbs"><span class="mr-2"><a href="home">Trang Chủ</a></span> <span>Sản Phẩm</span></p>
                    <h1 class="mb-0 bread">Sản Phẩm</h1>
                </div>
            </div>
        </div>
    </div>

    <section class="ftco-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-10 mb-5 text-center">
                    <ul class="product-category">
                        <li><a href="product" <c:if test="${empty param.categoryId}">class="active"</c:if>>Tất Cả</a></li>
                        <c:forEach items="${categories}" var="category">
                            <li>
                                <a href="product?categoryId=${category.id}"
                                   <c:if test="${param.categoryId eq category.id}">class="active"</c:if>>
                                        ${category.name}
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>

                <div class="sidebar-box">
                    <form action="product" method="get" class="search-form">
                        <div class="form-group d-flex">
                            <input type="text" class="form-control" placeholder="Tìm kiếm..." name="keyWord" value="${key}">
                            <input type="submit" class="btn btn-primary py-3 px-4 ml-2" value="Tìm kiếm">
                        </div>
                    </form>
                </div>
            </div>
            <div class="row">
                <c:forEach items="${products}" var="product">
                    <div class="col-md-6 col-lg-3 ftco-animate">
                        <div class="product">
                            <a href="productDetail?productId=${product.id}" class="img-prod"><img class="img-fluid" src="${pageContext.request.contextPath}/images/uploads/${product.image}" alt="Colorlib Template">
                                <c:if test="${product.discount > 0}">
                                    <span class="status">
                                        <fmt:formatNumber value="${(product.discount / product.price) * 100}" type="number" maxFractionDigits="2"/>%
                                    </span>
                                </c:if>
                                <div class="overlay"></div>
                            </a>
                            <div class="text py-3 pb-4 px-3 text-center">
                                <h3><a href="productDetail?productId=${product.id}">${product.name}</a></h3>
                                <div class="d-flex">
                                    <div class="pricing">
                                        <p class="price">
                                            <c:choose>
                                                <c:when test="${product.discount > 0}">
                                                    <span class="mr-2 price-dc">
                                                        <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="đ" pattern="###,###,###đ"/>
                                                    </span>
                                                    <span class="price-sale">
                                                        <fmt:formatNumber value="${product.discount}" type="currency" currencySymbol="đ" pattern="###,###,###đ"/>
                                                    </span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span>
                                                        <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="đ" pattern="###,###,###đ"/>
                                                    </span>
                                                </c:otherwise>
                                            </c:choose>
                                        </p>
                                    </div>
                                </div>
                                <div class="bottom-area d-flex px-3">
                                    <div class="m-auto d-flex">
                                        <a href="productDetail?productId=${product.id}" class="add-to-cart d-flex justify-content-center align-items-center text-center">
                                            <span><i class="ion-ios-menu"></i></span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="row mt-5">
                <div class="col text-center">
                    <div class="block-27">
                        <ul>
                            <li><a href="#">&lt;</a></li>
                            <li class="active"><span>1</span></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li><a href="#">&gt;</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <jsp:include page="./layout/footer.jsp"></jsp:include>
    <jsp:include page="./layout/loader.jsp"></jsp:include>
    <jsp:include page="./layout/script.jsp"></jsp:include>
</body>
</html>

