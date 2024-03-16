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
                    <p class="breadcrumbs"><span class="mr-2"><a href="index.jsp">Trang Chủ</a></span> <span>Về Chúng Tôi</span></p>
                    <h1 class="mb-0 bread">Về Chúng Tôi</h1>
                </div>
            </div>
        </div>
    </div>

    <section class="ftco-section ftco-no-pb ftco-no-pt bg-light">
        <div class="container">
            <div class="row">
                <div class="col-md-5 p-md-5 img img-2 d-flex justify-content-center align-items-center" style="background-image: url(images/about.jpg);">
                </div>
                <div class="col-md-7 py-5 wrap-about pb-md-5 ftco-animate">
                    <div class="heading-section-bold mb-4 mt-md-5">
                        <div class="ml-md-0">
                            <h2 class="mb-4">Fruitables</h2>
                        </div>
                    </div>
                    <div class="pb-md-5">
                        <p>Chào mừng đến với Fruitables - điểm đến lý tưởng cho những người yêu thực phẩm sạch và tươi ngon! Chúng tôi tự hào là địa chỉ đáng tin cậy cho việc mua sắm trực tuyến các loại rau củ, trái cây tươi ngon, nước ép tươi mát và thực phẩm khô hấp dẫn. Với cam kết về chất lượng và nguồn gốc sản phẩm, chúng tôi mang đến cho bạn những lựa chọn hoàn hảo để tạo ra những bữa ăn ngon và cân đối hơn cho cuộc sống hàng ngày của bạn. Hãy khám phá sự phong phú và đa dạng của thế giới thực phẩm tại Fruitables, và bắt đầu hành trình tìm kiếm sức khỏe và sự thăng hoa từng giọt nước ép, mỗi lát rau, và mỗi miếng trái cây tươi ngon</p>
                        <p><a href="product.jsp" class="btn btn-primary">Khám Phá Ngay</a></p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="ftco-section bg-light">
        <div class="container">
            <div class="row no-gutters ftco-services">
                <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
                    <div class="media block-6 services mb-md-0 mb-4">
                        <div class="icon bg-color-1 active d-flex justify-content-center align-items-center mb-2">
                            <span class="flaticon-shipped"></span>
                        </div>
                        <div class="media-body">
                            <h3 class="heading">Miễn Phí Vận Chuyển</h3>
                            <span>Miễn phí vận chuyển mọi đơn hàng</span>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
                    <div class="media block-6 services mb-md-0 mb-4">
                        <div class="icon bg-color-2 d-flex justify-content-center align-items-center mb-2">
                            <span class="flaticon-diet"></span>
                        </div>
                        <div class="media-body">
                            <h3 class="heading">Thực Phẩm Tươi</h3>
                            <span>Đóng gói sản phẩm cẩn thận</span>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
                    <div class="media block-6 services mb-md-0 mb-4">
                        <div class="icon bg-color-3 d-flex justify-content-center align-items-center mb-2">
                            <span class="flaticon-award"></span>
                        </div>
                        <div class="media-body">
                            <h3 class="heading">Chất Lượng Cao</h3>
                            <span>Chất lượng sản phẩm</span>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
                    <div class="media block-6 services mb-md-0 mb-4">
                        <div class="icon bg-color-4 d-flex justify-content-center align-items-center mb-2">
                            <span class="flaticon-customer-service"></span>
                        </div>
                        <div class="media-body">
                            <h3 class="heading">Hỗ Trợ</h3>
                            <span>Hỗ trợ 24/7</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <jsp:include page="layout/footer.jsp"></jsp:include>
    <jsp:include page="layout/loader.jsp"></jsp:include>
    <jsp:include page="layout/script.jsp"></jsp:include>
</body>
</html>
