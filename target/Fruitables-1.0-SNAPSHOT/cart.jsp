<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Fruitables</title>
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
    <jsp:include page="layout/nav.jsp"></jsp:include>
    <div class="hero-wrap hero-bread" style="background-image: url('images/bg_1.jpg');">
        <div class="container">
            <div class="row no-gutters slider-text align-items-center justify-content-center">
                <div class="col-md-9 ftco-animate text-center">
                    <p class="breadcrumbs"><span class="mr-2"><a href="index.jsp">Trang Chủ</a></span> <span>Giỏ Hàng</span></p>
                    <h1 class="mb-0 bread">Giỏ Hàng</h1>
                </div>
            </div>
        </div>
    </div>

    <section class="ftco-section ftco-cart">
        <div class="container">
            <div class="row">
                <div class="col-md-12 ftco-animate">
                    <div class="cart-list">
                        <table class="table">
                            <thead class="thead-primary">
                            <tr class="text-center">
                                <th>&nbsp;</th>
                                <th>&nbsp;</th>
                                <th>Tên Sản Phẩm</th>
                                <th>Giá</th>
                                <th>Số Lượng</th>
                                <th>Tổng Tiền</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr class="text-center">
                                <td class="product-remove"><a href="#"><span class="ion-ios-close"></span></a></td>

                                <td class="image-prod"><div class="img" style="background-image:url(images/product-3.jpg);"></div></td>

                                <td class="product-name">
                                    <h3>Ớt chuông</h3>
                                </td>

                                <td class="price">$4.90</td>

                                <td class="quantity">
                                    <div class="input-group mb-3">
                                        <input type="text" name="quantity" class="quantity form-control input-number" value="1" min="1" max="100">
                                    </div>
                                </td>

                                <td class="total">$4.90</td>
                            </tr><!-- END TR-->

                            <tr class="text-center">
                                <td class="product-remove"><a href="#"><span class="ion-ios-close"></span></a></td>

                                <td class="image-prod"><div class="img" style="background-image:url(images/product-4.jpg);"></div></td>

                                <td class="product-name">
                                    <h3>Bắp Cải Tím</h3>
                                </td>

                                <td class="price">$15.70</td>

                                <td class="quantity">
                                    <div class="input-group mb-3">
                                        <input type="text" name="quantity" class="quantity form-control input-number" value="1" min="1" max="100">
                                    </div>
                                </td>

                                <td class="total">$15.70</td>
                            </tr><!-- END TR-->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row justify-content-end">
                <div class="col-lg-4 mt-5 cart-wrap ftco-animate">
                    <div class="cart-total mb-3">
                        <h3>Tổng Đơn Hàng</h3>
                        <p class="d-flex">
                            <span>Tổng sản phẩm</span>
                            <span>$20.60</span>
                        </p>
                        <p class="d-flex">
                            <span>VAT 10%</span>
                            <span>$0.00</span>
                        </p>
                        <hr>
                        <p class="d-flex total-price">
                            <span>Tổng</span>
                            <span>$17.60</span>
                        </p>
                    </div>
                    <p><a href="checkout.jsp" class="btn btn-primary py-3 px-4">Thanh Toán</a></p>
                </div>
            </div>
        </div>
    </section>
    <jsp:include page="layout/footer.jsp"></jsp:include>
    <jsp:include page="layout/loader.jsp"></jsp:include>
    <jsp:include page="layout/script.jsp"></jsp:include>
</body>
</html>
