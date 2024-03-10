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
                            <h2 class="h4 mb-1">Sản Phẩm</h2>
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
                                        <div class="col ml-auto">
                                            <div class="dropdown float-right">
                                                <a class="btn btn-primary float-right ml-3" href="addProduct.jsp">+ Thêm Sản Phẩm</a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- table -->
                                    <table class="table table-hover table-borderless border-v">
                                        <thead>
                                        <tr>
                                            <th>Ảnh Sản Phẩm</th>
                                            <th>Sản Phẩm</th>
                                            <th>Danh Mục</th>
                                            <th>Giá</th>
                                            <th>Số Lượng</th>
                                            <th class="w-25">Mô Tả</th>
                                            <th>Trạng Thái</th>
                                            <th>Action</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>
                                                <div class="avatar avatar-md">
                                                    <img src="./assets/avatars/face-3.jpg" alt="..." class="avatar-img">
                                                </div>
                                            </td>
                                            <td>
                                                <p class="mb-0">Táo</p>
                                                <small class="mb-0 text-muted">#2474</small>
                                            </td>
                                            <td>
                                                Fruits
                                            </td>
                                            <td>
                                                10000đ
                                            </td>
                                            <td>200</td>
                                            <td class="w-25"><small> Egestas integer eget aliquet nibh praesent. In hac habitasse platea dictumst quisque sagittis purus.</small></td>
                                            <td>ACTIVE</td>
                                            <td><button class="btn btn-sm dropdown-toggle more-horizontal" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <span class="text-muted sr-only">Action</span>
                                            </button>
                                                <div class="dropdown-menu dropdown-menu-right">
                                                    <a class="dropdown-item" href="updateProduct.jsp">Sửa</a>
                                                    <a class="dropdown-item" href="#">Xóa</a>
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
    </main> <!-- main -->
</div> <!-- .wrapper -->
<jsp:include page="layout/script.jsp"></jsp:include>
</body>
</html>
