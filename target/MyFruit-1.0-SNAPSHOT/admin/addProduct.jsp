<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    session = request.getSession(false);
    if (session == null || session.getAttribute("admin") == null) {
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
                        <form method="post" action="addProduct" enctype="multipart/form-data">
                            <div>
                                <a class="btn btn-primary mb-4" href="product"><span
                                        class="fe fe-16 fe-arrow-left"></span> Quay Lại </a>
                                <button class="btn btn-primary mb-4 float-right" type="submit">Cập Nhật</button>
                            </div>

                            <div class="errors">
                                <c:if test="${not empty errors}">
                                    <ul>
                                        <c:forEach items="${errors}" var="error">
                                            <li style="color: red">${error}</li>
                                        </c:forEach>
                                    </ul>
                                </c:if>
                            </div>


                            <div class="row">
                                <div class="col-md-8 mb-4">
                                    <div class="card shadow mb-4">
                                        <div class="card-body">
                                            <h5 class="mb-4"><strong>Thông Tin Sản Phẩm</strong></h5>
                                            <div class="form-group mb-3">
                                                <label for="product-name">Tên Sản Phẩm</label>
                                                <input type="text" id="product-name"  class="form-control" name="name">
                                            </div>
                                            <div class="form-group mb-3">
                                                <label>SKU</label>
                                                <input type="text" id="sku" class="form-control" name="sku">
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
                                                <input type="file" id="imageInput" name="image" class="form-control">
                                                <div id="image-preview" class="mt-3">
                                                    <img src="" id="preview" style="max-width: 200px; max-height: 200px;">
                                                </div>
                                            </div>
                                        </div> <!-- /.card-body -->
                                    </div> <!-- /.card -->

                                </div> <!-- /.col -->

                                <div class="col-md-4 mb-4">
                                    <div class="card shadow mb-4">
                                        <div class="card-body">
                                            <h5 class="mb-4"><strong>Giá Sản Phẩm</strong></h5>
                                            <div class="form-group mb-3">
                                                <label>Giá Gốc</label>
                                                <input type="number" class="form-control" name="price">
                                            </div>
                                            <div class="form-group mb-3">
                                                <label>Giảm Giá</label>
                                                <input type="number" class="form-control" name="discount">
                                            </div>
                                        </div> <!-- /.card-body -->
                                    </div> <!-- /.card -->

                                    <div class="card shadow mb-4">
                                        <div class="card-body">
                                            <h5 class="mb-4"><strong>Danh Mục</strong></h5>
                                            <div class="form-group mb-3">
                                                <label class="form-label mb-1 d-flex justify-content-between align-items-center">
                                                    <span>Danh Mục</span>
                                                </label>
                                                <select class="form-control select2-multi" id="multi-select2" name="category" multiple>
                                                    <c:forEach items="${listCate}" var="cate">
                                                        <option value="${cate.id}">${cate.name}</option>
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
        </main> <!-- main -->
    </div> <!-- .wrapper -->
    <jsp:include page="layout/script.jsp"></jsp:include>
    <script>
        $(document).ready(function() {

            // Hàm để cập nhật preview ảnh
            function updateImagePreview(input) {

                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function(e) {
                        $("#preview").attr("src", e.target.result);
                    }
                    reader.readAsDataURL(input.files[0]);
                }
            }

            // Xử lý sự kiện khi thay đổi ảnh
            $("#imageInput").change(function() {
                updateImagePreview(this);
            });

            // Cập nhật preview ảnh khi trang web được tải
            updateImagePreview($("#imageInput")[0]);
        });
    </script>

    </body>
</html>

