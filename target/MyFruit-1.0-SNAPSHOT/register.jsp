<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>MyFruit - Đăng Ký</title>
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
<jsp:include page="layout/nav.jsp"></jsp:include>

<div class="hero-wrap hero-bread" style="background-image: url('images/bg_1.jpg');">
    <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
            <div class="col-md-9 ftco-animate text-center">
                <p class="breadcrumbs"><span class="mr-2"><a href="home">Trang Chủ</a></span> <span>Đăng Ký</span></p>
                <h1 class="mb-0 bread">Đăng Ký</h1>
            </div>
        </div>
    </div>
</div>

<section class="ftco-section contact-section bg-light">
    <div class="container">
        <div class="row block-9">
            <div class="col-md-6 order-md-last d-flex py-6 wrap-about pb-md-6 ftco-animate">
                <form action="register" method="post" class="bg-white p-5 contact-form">

                    <% String error = request.getParameter("error");
                        if (error != null) { %>
                    <p style="color: red;">
                        <% if (error.equals("emptyInput")) { %>
                        Vui lòng không được để trống
                        <% } else if (error.equals("passwordMismatch")) { %>
                        Mật khẩu không khớp
                        <% } else if (error.equals("userExists")) { %>
                        Người dùng tồn tại
                        <% } %>
                    </p>
                    <% } %>


                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Họ Và Tên" name="fullName">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Tài khoản" name="username">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="Mật Khẩu" name="password">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="Nhập Lại Mật Khẩu" name="rePassword">
                    </div>
                    <p>Bạn Đã Có Tài Khoản Chưa? <a href="login">Đăng Nhập Ngay</a></p>
                    <div class="form-group">
                        <input type="submit" value="Đăng Ký" class="btn btn-primary py-3 px-5">
                    </div>
                </form>

            </div>

            <div class="col-md-6 d-flex p-md-6 img img-2 justify-content-center align-items-center" style="background-image: url(images/about.jpg);">
            </div>
        </div>
    </div>
</section>




<jsp:include page="layout/footer.jsp"></jsp:include>
<jsp:include page="layout/loader.jsp"></jsp:include>
<jsp:include page="layout/script.jsp"></jsp:include>
</body>
</html>

