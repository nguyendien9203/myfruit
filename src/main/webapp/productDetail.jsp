<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>MyFruit - Chi Tiết Sản Phẩm</title>
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
          rel="stylesheet">
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
                <p class="breadcrumbs"><span class="mr-2"><a href="home">Trang Chủ</a></span> <span class="mr-2"><a
                        href="product">Sản Phẩm</a></span> <span>Chi Tiết Sản Phẩm</span></p>
                <h1 class="mb-0 bread">Chi Tiết Sản Phẩm</h1>
            </div>
        </div>
    </div>
</div>

<section class="ftco-section">
    <div class="container">
        <div class="row">

            <div class="col-lg-6 mb-5 ftco-animate">
                <a href="${pageContext.request.contextPath}/images/uploads/${product.image}" class="image-popup"><img src="${pageContext.request.contextPath}/images/uploads/${product.image}" class="img-fluid"
                                                                        alt="Colorlib Template"></a>
            </div>
            <div class="col-lg-6 product-details pl-md-5 ftco-animate">
                <h3>${product.name}</h3>
                <p class="d-flex">
                    <span class="mr-3" style="font-size: small">Mã sản phẩm: <span style="color: #4d4d4d;">${product.SKU}</span></span>
                    <span class="mr-3" style="font-size: small">Tình trạng:
                        <c:choose>
                            <c:when test="${product.status == 'IN_STOCK'}">
                                <span style="color: #4d4d4d;">Còn hàng</span>
                            </c:when>
                            <c:otherwise>
                                <span style="color: #4d4d4d;">Hết hàng</span>
                            </c:otherwise>
                        </c:choose>
                    </span>
                    <span style="font-size: small">Thương hiệu: <span style="color: #4d4d4d;">${product.brand}</span></span>
                </p>
                <p class="price">
                    <c:choose>
                        <c:when test="${product.discount > 0}">
                            <span class="mr-2 price-dc" style="text-decoration: line-through; color: #4d4d4d;">
                                <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="đ" pattern="###,###,###đ"/>
                            </span>
                                <span class="price-sale" style="color: #82ae46">
                                <fmt:formatNumber value="${product.discount}" type="currency" currencySymbol="đ" pattern="###,###,###đ"/>
                            </span>
                            </c:when>
                        <c:otherwise>
                            <span style="color: #82ae46">
                                <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="đ" pattern="###,###,###đ"/>
                            </span>
                            </c:otherwise>
                    </c:choose>
                </p>
                <p>${product.desc}</p>
                <div class="w-100"></div>
                <form method="post" action="cart">
                    <div class="row mt-4">
                        <div class="input-group col-md-6 d-flex mb-3">
                            <input type="hidden" value="${product.id}" name="productId">
                            <span class="input-group-btn mr-2">
                                <button type="button" class="quantity-left-minus btn" data-type="minus" data-field=""><i class="ion-ios-remove"></i></button>
                            </span>
                            <input type="text" id="quantity" name="qty" class="form-control input-number" value="1" min="1" max="100">
                            <span class="input-group-btn ml-2">
                                <button type="button" class="quantity-right-plus btn" data-type="plus" data-field=""><i class="ion-ios-add"></i></button>
                            </span>
                        </div>
                    </div>
                    <div class="form-group">
                        <input type="submit" value="Thêm Vào Giỏ Hàng" class="btn btn-black py-3 px-5">
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-center mb-3 pb-3">
            <div class="col-md-12 heading-section text-center ftco-animate">
                <span class="subheading">Sản Phẩm</span>
                <h2 class="mb-4">Sản Phẩm Tương Tự</h2>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-lg-3 ftco-animate">
                <div class="product">
                    <a href="#" class="img-prod"><img class="img-fluid" src="images/product-1.jpg" alt="Colorlib Template">
                        <span class="status">30%</span>
                        <div class="overlay"></div>
                    </a>
                    <div class="text py-3 pb-4 px-3 text-center">
                        <h3><a href="#">Ớt chuông</a></h3>
                        <div class="d-flex">
                            <div class="pricing">
                                <p class="price"><span class="mr-2 price-dc">$120.00</span><span class="price-sale">$80.00</span></p>
                            </div>
                        </div>
                        <div class="bottom-area d-flex px-3">
                            <div class="m-auto d-flex">
                                <a href="producDetail.jsp" class="add-to-cart d-flex justify-content-center align-items-center text-center">
                                    <span><i class="ion-ios-menu"></i></span>
                                </a>
                                <a href="cart.jsp" class="buy-now d-flex justify-content-center align-items-center mx-1">
                                    <span><i class="ion-ios-cart"></i></span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3 ftco-animate">
                <div class="product">
                    <a href="#" class="img-prod"><img class="img-fluid" src="images/product-2.jpg" alt="Colorlib Template">
                        <div class="overlay"></div>
                    </a>
                    <div class="text py-3 pb-4 px-3 text-center">
                        <h3><a href="#">Dâu tây</a></h3>
                        <div class="d-flex">
                            <div class="pricing">
                                <p class="price"><span>$120.00</span></p>
                            </div>
                        </div>
                        <div class="bottom-area d-flex px-3">
                            <div class="m-auto d-flex">
                                <a href="#" class="add-to-cart d-flex justify-content-center align-items-center text-center">
                                    <span><i class="ion-ios-menu"></i></span>
                                </a>
                                <a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1">
                                    <span><i class="ion-ios-cart"></i></span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3 ftco-animate">
                <div class="product">
                    <a href="#" class="img-prod"><img class="img-fluid" src="images/product-3.jpg" alt="Colorlib Template">
                        <div class="overlay"></div>
                    </a>
                    <div class="text py-3 pb-4 px-3 text-center">
                        <h3><a href="#">Đậu Xanh</a></h3>
                        <div class="d-flex">
                            <div class="pricing">
                                <p class="price"><span>$120.00</span></p>
                            </div>
                        </div>
                        <div class="bottom-area d-flex px-3">
                            <div class="m-auto d-flex">
                                <a href="#" class="add-to-cart d-flex justify-content-center align-items-center text-center">
                                    <span><i class="ion-ios-menu"></i></span>
                                </a>
                                <a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1">
                                    <span><i class="ion-ios-cart"></i></span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3 ftco-animate">
                <div class="product">
                    <a href="#" class="img-prod"><img class="img-fluid" src="images/product-4.jpg" alt="Colorlib Template">
                        <div class="overlay"></div>
                    </a>
                    <div class="text py-3 pb-4 px-3 text-center">
                        <h3><a href="#">Bắp cải tím</a></h3>
                        <div class="d-flex">
                            <div class="pricing">
                                <p class="price"><span>$120.00</span></p>
                            </div>
                        </div>
                        <div class="bottom-area d-flex px-3">
                            <div class="m-auto d-flex">
                                <a href="#" class="add-to-cart d-flex justify-content-center align-items-center text-center">
                                    <span><i class="ion-ios-menu"></i></span>
                                </a>
                                <a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1">
                                    <span><i class="ion-ios-cart"></i></span>
                                </a>
                            </div>
                        </div>
                    </div>
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

