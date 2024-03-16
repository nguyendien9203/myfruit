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
                    <p class="breadcrumbs"><span class="mr-2"><a href="index.jsp">Trang Chủ</a></span> <span>Thanh Toán</span></p>
                    <h1 class="mb-0 bread">Thanh Toán</h1>
                </div>
            </div>
        </div>
    </div>

    <section class="ftco-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-7 ftco-animate">
                    <form action="#" class="billing-form">
                        <h3 class="mb-4 billing-heading">Chi Tiết Thanh Toán</h3>
                        <div class="row align-items-end">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Tên Khách Hàng</label>
                                    <input type="text" class="form-control" placeholder="Họ và tên">
                                </div>
                            </div>
                            <div class="w-100"></div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Địa Chỉ Vận Chuyển</label>
                                    <input type="text" class="form-control" placeholder="Địa chỉ">
                                </div>
                            </div>
                            <div class="w-100"></div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Số Điện Thoại</label>
                                    <input type="text" class="form-control" placeholder="Số điện thoại">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Email</label>
                                    <input type="text" class="form-control" placeholder="Địa chỉ email">
                                </div>
                            </div>
                            <div class="w-100"></div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Ghi chú</label>
                                    <textarea name="" id="" cols="30" rows="7" class="form-control" placeholder="Ghi chú"></textarea>
                                </div>
                            </div>
                        </div>
                    </form><!-- END -->
                </div>
                <div class="col-xl-5">
                    <div class="row mt-5 pt-3">
                        <div class="col-md-12 d-flex mb-5">
                            <div class="cart-detail cart-total p-3 p-md-4">
                                <h3 class="billing-heading mb-4">Tổng Đơn Hàng</h3>
                                <p class="d-flex">
                                    <span>Tổng Sản Phẩm</span>
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
                        </div>
                        <div class="col-md-12">
                            <div class="cart-detail p-3 p-md-4">
                                <h3 class="billing-heading mb-4">Phương Thức Thanh Toán</h3>
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <div class="radio">
                                            <label><input type="radio" name="optradio" class="mr-2">Thanh Toán Khi Giao Hàng</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <div class="radio">
                                            <label><input type="radio" name="optradio" class="mr-2">Chuyển Khoản</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <div class="checkbox">
                                            <label><input type="checkbox" value="" class="mr-2">Tôi đã đọc và chấp nhận các điều khoản và điều kiện</label>
                                        </div>
                                    </div>
                                </div>
                                <p><a href="#"class="btn btn-primary py-3 px-4">Đặt Hàng</a></p>
                            </div>
                        </div>
                    </div>
                </div> <!-- .col-md-8 -->
            </div>
        </div>
    </section> <!-- .section -->
    <jsp:include page="layout/footer.jsp"></jsp:include>
    <jsp:include page="layout/loader.jsp"></jsp:include>
    <jsp:include page="layout/script.jsp"></jsp:include>
</body>
</html>
