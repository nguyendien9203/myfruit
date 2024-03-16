<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    session = request.getSession(false);
    if (session == null || session.getAttribute("user") == null) {
        response.sendRedirect("login");
    }
%>
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
                        <form method="post" action="addProduct">
                            <div>
                                <a class="btn btn-primary mb-4" href="product"><span
                                        class="fe fe-16 fe-arrow-left"></span> Quay Lại </a>
                                <button class="btn btn-primary mb-4 float-right" type="submit">Cập Nhật</button>
                            </div>

                            <div class="row">
                                <div class="col-md-8 mb-4">
                                    <div class="card shadow mb-4">
                                        <div class="card-body">
                                            <h5 class="mb-4"><strong>Thông Tin Sản Phẩm</strong></h5>
                                            <div class="form-group mb-3">
                                                <label for="product-name">Tên Sản Phẩm</label>
                                                <input type="text" id="product-name" class="form-control" name="name">
                                            </div>
                                            <div class="form-row">
                                                <div class="form-group col-md-6">
                                                    <label>SKU</label>
                                                    <input type="text" id="sku" class="form-control" name="sku">
                                                </div> <!-- form-group -->
                                                <div class="form-group col-md-6">
                                                    <label for="product-status">Trạng Thái</label>
                                                    <select class="form-control" id="product-status" name="status">
                                                        <c:forEach items="${listStatus}" var="status">
                                                            <option value="${status}">${status}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div> <!-- form-group -->
                                            </div> <!-- form-row -->
                                            <div class="form-group mb-3">
                                                <label for="brand">Thương Hiệu</label>
                                                <input type="text" id="brand" class="form-control" name="brand">
                                            </div>
                                            <div class="form-group mb-3">
                                                <label for="qty-in-stock">Số Lượng</label>
                                                <input type="text" id="qty-in-stock" class="form-control" name="qtyInStock">
                                            </div>
                                            <div class="form-group mb-3">
                                                <label>Mô tả</label>
                                                <textarea id="description" class="form-control" name="desc" rows="" cols="100"></textarea>
                                            </div>
                                            <div class="form-group mb-3">
                                                <label>Ảnh Sản Phẩm</label>
                                                <input type="file" name="image" class="form-control">
                                                <div id="image-preview" class="mb-3"></div>
                                            </div>
                                        </div> <!-- /.card-body -->
                                    </div> <!-- /.card -->



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
                                                        <select class="form-control select2" name="variation">
                                                            <c:forEach items="${listVariation}" var="variation">
                                                                <option selected value="${variation.id}">${variation.name}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-7">
                                                        <label>Giá Trị</label>
                                                        <input type="text" class="form-control" placeholder="Nhập giá trị" name="variation_option">
                                                    </div>
                                                    <div class="form-group col-md-1">
                                                        <button class="fe fe-16 fe-x remove-button"
                                                                id="remove-form-row"></button>
                                                    </div>
                                                </div>
                                            </div>

                                            <button class="btn btn-primary" id="add-form-row">Thêm Lựa Chọn Khác</button>
                                            <a class="btn ml-3 btn-outline-primary" data-toggle="modal"
                                               data-target="#varyModalAB" data-whatever="@mdo" href="variation">Thêm Biến Thể</a>
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
                                                <input type="number" class="form-control" name="price">
                                            </div>
                                            <div class="form-group mb-3">
                                                <label>Giảm Giá</label>
                                                <input type="number" class="form-control" name="discount">
                                            </div>
                                            <div class="form-group mb-3">
                                                <label class="form-label mb-1 d-flex justify-content-between align-items-center">
                                                    <span>Đơn Vị</span>
                                                    <a class="btn btn-link" data-toggle="modal" data-target="#varyModalAD"
                                                       data-whatever="@mdo" href="unit">Thêm Đơn Vị</a>
                                                </label>
                                                <select class="form-control select2" name="unit">
                                                    <c:forEach items="${listUnit}" var="unit">
                                                        <option selected value="${unit.id}">${unit.name}</option>
                                                    </c:forEach>
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
                                                </label>
                                                <select class="form-control select2" name="category">
                                                    <c:forEach items="${listCate}" var="cate">
                                                        <option selected value="${cate.id}">${cate.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>

                                        </div> <!-- /.card-body -->
                                    </div> <!-- /.card -->
                                </div> <!-- /.col -->
                            </div>
                        </form>
                    </div> <!-- .col-12 -->
                </div> <!-- .row -->
            </div> <!-- .container-fluid -->


            <!-- add-unit -->
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
                        <form action="unit" method="post">
                            <div class="modal-body">
                                <div class="form-group">
                                    <label for="recipient-name-ad" class="col-form-label">Đơn Vị</label>
                                    <input type="text" class="form-control" id="recipient-name-ad" name="txt-unit">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn mb-2 btn-secondary" data-dismiss="modal">Đóng</button>
                                <button type="submit" class="btn mb-2 btn-primary">Xác Nhận</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- end-add-unit -->

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
                        <form action="variation" method="post">
                            <div class="modal-body">
                                    <div class="form-group">
                                        <label for="recipient-name-ab" class="col-form-label">Biến Thể</label>
                                        <input type="text" class="form-control" id="recipient-name-ab" name="txt-variation">
                                    </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn mb-2 btn-secondary" data-dismiss="modal">Đóng</button>
                                <button type="submit" class="btn mb-2 btn-primary">Xác Nhận</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- end-add-variation-category -->
        </main> <!-- main -->
    </div> <!-- .wrapper -->
    <jsp:include page="layout/script.jsp"></jsp:include>

    <script>
        function previewImage() {
            document.getElementById('image-upload').addEventListener('change', function() {
                var file = this.files[0];
                if (file) {
                    var reader = new FileReader();
                    reader.onload = function(e) {
                        var image = document.createElement('img');
                        image.src = e.target.result;
                        image.style.maxWidth = '100%';
                        image.style.height = 'auto';
                        document.getElementById('image-preview').innerHTML = '';
                        document.getElementById('image-preview').appendChild(image);
                    };
                    reader.readAsDataURL(file);
                } else {
                    document.getElementById('image-preview').innerHTML = '';
                }
            });
        }

        document.addEventListener('DOMContentLoaded', function() {
            previewImage();
        });
    </script>
    <script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
    <script>
        tinymce.init({
            selector: 'textarea',
            plugins: 'link image code',
            toolbar: 'undo redo | bold italic underline | alignleft aligncenter alignright | image | code'  // Các nút toolbar bạn muốn hiển thị
        });
    </script>
    </body>
</html>

