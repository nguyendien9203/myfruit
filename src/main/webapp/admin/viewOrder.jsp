<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" href="favicon.ico">
    <title>Product</title>
    <link rel="stylesheet" href="css/style.css">
    <!-- Simple bar CSS -->
    <link rel="stylesheet" href="css/simplebar.css">
    <!-- Fonts CSS -->
    <link href="https://fonts.googleapis.com/css2?family=Overpass:ital,wght@0,100;0,200;0,300;0,400;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,600;1,700;1,800;1,900&display=swap"
          rel="stylesheet">
    <!-- Icons CSS -->
    <link rel="stylesheet" href="css/feather.css">
    <link rel="stylesheet" href="css/select2.css">
    <link rel="stylesheet" href="css/dropzone.css">
    <link rel="stylesheet" href="css/uppy.min.css">
    <link rel="stylesheet" href="css/jquery.steps.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">
    <link rel="stylesheet" href="css/quill.snow.css">
    <!-- Date Range Picker CSS -->
    <link rel="stylesheet" href="css/daterangepicker.css">
    <!-- App CSS -->
    <link rel="stylesheet" href="css/app-light.css" id="lightTheme">
    <link rel="stylesheet" href="css/app-dark.css" id="darkTheme" disabled>
</head>
<body class="vertical  light  ">
<div class="wrapper">
    <jsp:include page="layout/nav.jsp"></jsp:include>
    <jsp:include page="layout/aside.jsp"></jsp:include>
    <main role="main" class="main-content">
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-12">
                    <h2 class="h4 mb-1">Đơn Hàng #22342</h2>
                    <p class="mb-3 text-muted">8/3/2024 - 00:00:00</p>
                    <a class="btn btn-primary mb-4" href="order.jsp"><span class="fe fe-16 fe-arrow-left"></span> Quay Lại </a>
                    <div class="row">
                        <div class="col-md-8 mb-4">
                            <div class="card shadow mb-4">
                                <div class="card-body">
                                    <h5 class="mb-4"><strong>Chi Tiết Đơn Hàng</strong></h5>
                                    <table class="table table-hover table-borderless border-v">
                                        <thead>
                                        <tr>
                                            <th>Sản Phẩm</th>
                                            <th>Giá</th>
                                            <th>Số Lượng</th>
                                            <th>Tổng Tiền</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>
                                                <p class="mb-0">Táo</p>
                                                <small class="mb-0 text-muted">#2474</small>
                                            </td>
                                            <td>
                                                10000đ
                                            </td>
                                            <td>2</td>
                                            <td>20000đ</td>
                                        </tr>
                                        </tbody>
                                    </table>

                                    <div class="col-md-5 float-right">
                                        <div class="text-right mr-2">
                                            <p class="mb-2 h6">
                                                <span class="text-muted">Subtotal : </span>
                                                <strong>$285.00</strong>
                                            </p>
                                            <p class="mb-2 h6">
                                                <span class="text-muted">VAT (10%) : </span>
                                                <strong>$28.50</strong>
                                            </p>
                                            <p class="mb-2 h6">
                                                <span class="text-muted">Total : </span>
                                                <span>$313.50</span>
                                            </p>
                                        </div>
                                    </div>


                                </div> <!-- /.card-body -->
                            </div> <!-- /.card -->

                        </div> <!-- /.col -->

                        <div class="col-md-4 mb-4">
                            <div class="card shadow mb-4">
                                <div class="card-body">
                                    <h5 class="mb-4"><strong>Thông Tin Khách Hàng</strong></h5>

                                    <div class="row">
                                        <label class="col-sm-5 text-muted">Mã Khách Hàng:</label>
                                        <p class="col-sm-7">2474</p>
                                    </div>

                                    <div class="row">
                                        <label class="col-sm-5 text-muted">Tên Khách Hàng:</label>
                                        <p class="col-sm-7">Nguyen Van A</p>
                                    </div>

                                    <div class="row">
                                        <label class="col-sm-5 text-muted">Email:</label>
                                        <p class="col-sm-7">customer@gmail.com</p>
                                    </div>

                                    <div class="row">
                                        <label class="col-sm-5 text-muted">Số Điện Thoại:</label>
                                        <p class="col-sm-7">0928247284</p>
                                    </div>

                                </div> <!-- /.card-body -->
                            </div> <!-- /.card -->

                            <div class="card shadow mb-4">
                                <div class="card-body">
                                    <h5 class="mb-4"><strong>Địa Chỉ Giao Hàng</strong></h5>

                                    <div class="row">
                                        <label class="col-sm-5 text-muted">Người Nhận:</label>
                                        <p class="col-sm-7">Nguyen Van A</p>
                                    </div>

                                    <div class="row">
                                        <label class="col-sm-5 text-muted">Email:</label>
                                        <p class="col-sm-7">customer@gmail.com</p>
                                    </div>

                                    <div class="row">
                                        <label class="col-sm-5 text-muted">Số Điện Thoại:</label>
                                        <p class="col-sm-7">0928247284</p>
                                    </div>

                                    <div class="row">
                                        <label class="col-sm-5 text-muted">Địa Chỉ:</label>
                                        <p class="col-sm-7">Thanh Xuân, Hà Nội</p>
                                    </div>

                                    <div class="row">
                                        <label class="col-sm-5 text-muted">Ghi Chú:</label>
                                        <p class="col-sm-7">Giao hàng vào ban ngày</p>
                                    </div>
                                </div> <!-- /.card-body -->
                            </div> <!-- /.card -->
                        </div> <!-- /.col -->
                    </div>
                </div> <!-- end section -->
            </div> <!-- .col-12 -->
        </div> <!-- .row -->
</div> <!-- .container-fluid -->
</main> <!-- main -->
</div> <!-- .wrapper -->
<jsp:include page="layout/script.jsp"></jsp:include>
</body>
</html>

