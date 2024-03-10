<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" href="favicon.ico">
    <title>Product</title>
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
                    <div class="row">
                        <!-- start section -->
                        <div class="col-md-12 my-4">
                            <h2 class="h4 mb-1">Đơn Hàng</h2>
                            <div class="card shadow">
                                <div class="card-body">
                                    <div class="toolbar row mb-3">
                                        <div class="col">
                                            <form class="form-inline">
                                                <div class="form-row">
                                                    <div class="form-group col-auto">
                                                        <label for="search" class="sr-only">Search</label>
                                                        <input type="text" class="form-control" id="search" value=""
                                                               placeholder="Tìm kiếm">
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <!-- table -->
                                    <table class="table table-hover table-borderless border-v">
                                        <thead>
                                        <tr>
                                            <th>Mã Đơn Hàng</th>
                                            <th>Ngày Mua</th>
                                            <th>Người Mua</th>
                                            <th>SĐT</th>
                                            <th>Nơi Nhận Hàng</th>
                                            <th>Tổng Tiền</th>
                                            <th>Thanh Toán</th>
                                            <th>Trạng Thái</th>
                                            <th>Hành Động</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>#1331</td>
                                            <td>2020-12-26 01:32:21</td>
                                            <td>Kasimir Lindsey</td>
                                            <td>(697) 486-2101</td>
                                            <td>996-3523 Et Ave</td>
                                            <td>$3.64</td>
                                            <td>Chuyển khoản</td>
                                            <td>Chờ xử lý</td>
                                            <td>
                                                <div class="dropdown">
                                                    <button class="btn btn-sm dropdown-toggle more-vertical"
                                                            type="button" data-toggle="dropdown" aria-haspopup="true"
                                                            aria-expanded="false">
                                                        <span class="text-muted sr-only">Action</span>
                                                    </button>
                                                    <div class="dropdown-menu dropdown-menu-right">
                                                        <a class="dropdown-item" href="viewOrder.jsp">Chi Tiết</a>
                                                        <a class="dropdown-item" data-toggle="modal"
                                                           data-target="#varyModal" data-whatever="@mdo"
                                                           href="#">Sửa</a>
                                                        <a class="dropdown-item" href="#">Xóa</a>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <nav aria-label="Table Paging" class="mb-0 text-muted">
                                        <ul class="pagination justify-content-center mb-0">
                                            <li class="page-item"><a class="page-link" href="#">Trước</a></li>
                                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                                            <li class="page-item active"><a class="page-link" href="#">2</a></li>
                                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                                            <li class="page-item"><a class="page-link" href="#">Kế Tiếp</a></li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div> <!-- customized table -->
                    </div> <!-- end section -->
                </div> <!-- .col-12 -->
            </div> <!-- .row -->
        </div> <!-- .container-fluid -->
        <!-- update-status-category -->
        <div class="modal fade" id="varyModal" tabindex="-1" role="dialog"
             aria-labelledby="varyModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="varyModalLabel">Trạng Thái Đơn Hàng</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <label class="col-form-label">Trạng Thái</label>
                                <select class="form-control">
                                    <option>Chờ xử lý</option>
                                    <option>Đang xử lý</option>
                                    <option>Đã giao hàng</option>
                                </select>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn mb-2 btn-secondary" data-dismiss="modal">Đóng
                        </button>
                        <button type="button" class="btn mb-2 btn-primary">Xác Nhận</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- end-update-status-category -->
    </main> <!-- main -->
</div> <!-- .wrapper -->
<jsp:include page="layout/script.jsp"></jsp:include>
</body>
</html>

