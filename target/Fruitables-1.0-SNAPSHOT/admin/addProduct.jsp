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
<body class="vertical light">
    <div class="wrapper">
        <jsp:include page="layout/nav.jsp"></jsp:include>
        <jsp:include page="layout/aside.jsp"></jsp:include>
        <main role="main" class="main-content">
            <div class="container-fluid">
                <div class="row justify-content-center">
                    <div class="col-12">
                        <h2 class="h4 mb-1">Thêm Sản Phẩm</h2>
                        <div>
                            <a class="btn btn-primary mb-4" href="product.jsp"><span
                                    class="fe fe-16 fe-arrow-left"></span> Quay Lại </a>
                            <a class="btn btn-primary mb-4 float-right" href="product.jsp">Cập Nhật</a>
                        </div>

                        <div class="row">
                            <div class="col-md-8 mb-4">
                                <div class="card shadow mb-4">
                                    <div class="card-body">
                                        <h5 class="mb-4"><strong>Thông Tin Sản Phẩm</strong></h5>
                                        <div class="form-group mb-3">
                                            <label for="product-name">Tên Sản Phẩm</label>
                                            <input type="text" id="product-name" class="form-control">
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label for="simple-select2">SKU</label>
                                                <input type="text" id="sku" class="form-control">
                                            </div> <!-- form-group -->
                                            <div class="form-group col-md-6">
                                                <label for="product-status">Trạng Thái</label>
                                                <select class="form-control" id="product-status">
                                                    <option value="AZ">ACTIVE</option>
                                                    <option value="CO">INACTIVE</option>
                                                </select>
                                            </div> <!-- form-group -->
                                        </div> <!-- form-row -->
                                        <div class="form-group mb-3">
                                            <label for="brand">Thương Hiệu</label>
                                            <input type="text" id="brand" class="form-control">
                                        </div>
                                        <div class="form-group mb-3">
                                            <label for="qty-in-stock">Số Lượng</label>
                                            <input type="text" id="qty-in-stock" class="form-control">
                                        </div>
                                        <div class="form-group mb-3">
                                            <label>Mô tả</label>
                                            <!-- Create the editor container -->
                                            <div id="editor" style="min-height:100px;">
                                            </div>
                                        </div>
                                    </div> <!-- /.card-body -->
                                </div> <!-- /.card -->

                                <div class="card shadow mb-4">
                                    <h5 class="card-header md-4">
                                        <strong>Ảnh Sản Phẩm</strong>
                                    </h5>
                                    <div class="card-body">
                                        <div id="drag-drop-area"></div>
                                    </div>
                                </div>

                                <!-- Variants -->
                                <div class="card shadow mb-4">
                                    <div class="card-body">
                                        <h5 class="mb-4"><strong>Biến Thể</strong></h5>
                                        <div id="form-container">
                                            <div class="form-row" data-repeater-item>

                                                <div class="form-group col-md-4">
                                                    <label class="form-label">
                                                        <span>Biến Thể</span>
                                                    </label>
                                                    <select class="form-control select2">
                                                        <option value="AK">Size</option>
                                                        <option value="HI">Color</option>
                                                    </select>
                                                </div>
                                                <div class="form-group col-md-7">
                                                    <label>Giá Trị</label>
                                                    <input type="text" class="form-control" placeholder="Nhập giá trị">
                                                </div>
                                                <div class="form-group col-md-1">
                                                    <button class="fe fe-16 fe-x remove-button"
                                                            id="remove-form-row"></button>
                                                </div>
                                            </div>
                                        </div>

                                        <button class="btn btn-primary" id="add-form-row">Thêm Lựa Chọn Khác</button>
                                        <a class="btn ml-3 btn-outline-primary" data-toggle="modal"
                                           data-target="#varyModalAB" data-whatever="@mdo" href="#">Thêm Biến Thể</a>
                                    </div> <!-- /.card-body -->
                                </div> <!-- /.card -->
                                <!-- /Variants -->

                            </div> <!-- /.col -->

                            <div class="col-md-4 mb-4">
                                <div class="card shadow mb-4">
                                    <div class="card-body">
                                        <h5 class="mb-4"><strong>Định Giá</strong></h5>
                                        <div class="form-group mb-3">
                                            <label>Giá Gốc</label>
                                            <input type="number" class="form-control">
                                        </div>
                                        <div class="form-group mb-3">
                                            <label>Giảm Giá</label>
                                            <input type="number" class="form-control">
                                        </div>
                                        <div class="form-group mb-3">
                                            <label class="form-label mb-1 d-flex justify-content-between align-items-center">
                                                <span>Đơn Vị</span>
                                                <a class="btn btn-link" data-toggle="modal" data-target="#varyModalAD"
                                                   data-whatever="@mdo" href="#">Thêm Đơn Vị</a>
                                            </label>
                                            <select class="form-control select2">
                                                <option value="AK">kg</option>
                                                <option value="HI">g</option>

                                            </select>
                                        </div>
                                    </div> <!-- /.card-body -->
                                </div> <!-- /.card -->

                                <div class="card shadow mb-4">
                                    <div class="card-body">
                                        <h5 class="mb-4"><strong>Tổ Chức</strong></h5>
                                        <div class="form-group mb-3">
                                            <label class="form-label mb-1 d-flex justify-content-between align-items-center">
                                                <span>Danh Mục</span>
                                                <a class="btn btn-link" data-toggle="modal"
                                                   data-target=".modal-right-ac" data-whatever="@mdo" href="#">Thêm
                                                    Danh Mục
                                                </a>
                                            </label>
                                            <select class="form-control select2" id="simple-select2">
                                                <optgroup label="Fruit">
                                                    <option value="AK">Táo</option>
                                                    <option value="HI">Cam</option>
                                                </optgroup>
                                                <optgroup label="Vegetables">
                                                    <option value="CA">Onion</option>
                                                    <option value="NV" disabled="disabled">Nevada (disabled)</option>
                                                    <option value="OR">Oregon</option>
                                                    <option value="WA">Washington</option>
                                                </optgroup>
                                            </select>
                                        </div>

                                    </div> <!-- /.card-body -->
                                </div> <!-- /.card -->
                            </div> <!-- /.col -->
                        </div>
                    </div> <!-- .col-12 -->
                </div> <!-- .row -->
            </div> <!-- .container-fluid -->

            <!-- add-category -->
            <div class="modal fade modal-right-ac modal-slide" tabindex="-1" role="dialog"
                 aria-labelledby="defaultModalLabelAC"
                 aria-hidden="true">
                <div class="modal-dialog modal-sm" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="defaultModalLabelAC">Thêm Danh Mục</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form>
                                <div class="form-group">
                                    <label for="recipient-name-s" class="col-form-label">Danh Mục Cha</label>
                                    <select class="form-control" id="recipient-name-s">
                                        <option>Fruits</option>
                                        <option>Juice</option>
                                        <option>Vegetables</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="recipient-name-ac" class="col-form-label">Danh Mục</label>
                                    <input type="text" class="form-control" id="recipient-name-ac">
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn mb-2 btn-secondary" data-dismiss="modal">Đóng</button>
                            <button type="button" class="btn mb-2 btn-primary">Xác Nhận</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end-add-category -->

            <!-- add-parent-category -->
            <div class="modal fade" id="varyModalAD" tabindex="-1" role="dialog" aria-labelledby="varyModalLabelAD"
                 aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="varyModalLabelAD">Thêm Đơn Vị</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form>
                                <div class="form-group">
                                    <label for="recipient-name-ad" class="col-form-label">Đơn Vị</label>
                                    <input type="text" class="form-control" id="recipient-name-ad">
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn mb-2 btn-secondary" data-dismiss="modal">Đóng</button>
                            <button type="button" class="btn mb-2 btn-primary">Xác Nhận</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end-add-parent-category -->

            <!-- add-variation-category -->
            <div class="modal fade" id="varyModalAB" tabindex="-1" role="dialog" aria-labelledby="varyModalLabelAB"
                 aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="varyModalLabelAB">Thêm Biến Thể</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form>
                                <div class="form-group">
                                    <label for="recipient-name-ab" class="col-form-label">Biến Thể</label>
                                    <input type="text" class="form-control" id="recipient-name-ab">
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn mb-2 btn-secondary" data-dismiss="modal">Đóng</button>
                            <button type="button" class="btn mb-2 btn-primary">Xác Nhận</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end-add-variation-category -->
        </main> <!-- main -->
    </div> <!-- .wrapper -->
    <jsp:include page="layout/script.jsp"></jsp:include>
    </body>
</html>

