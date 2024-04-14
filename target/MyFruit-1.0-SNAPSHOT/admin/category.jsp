<%@ page contentType="text/html;charset=UTF-8" language="java" %>a
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
                            <h2 class="h4 mb-1">Danh Mục</h2>





                            <div class="card shadow">
                                <div class="card-body">
                                    <div class="toolbar row mb-3">
                                        <div class="col">
                                            <form class="form-inline">
                                                <div class="form-row">
                                                    <div class="form-group col-auto">
                                                        <label for="search" class="sr-only">Search</label>
                                                        <input type="text" class="form-control" id="search" value="" placeholder="Tìm kiếm">
                                                    </div>
                                                </div>
                                            </form>
                                        </div>

                                        <div class="col ml-auto">
                                            <div class="dropdown float-right">
                                                <a class="btn btn-primary float-right ml-3" data-toggle="modal" data-target=".modal-right-ac" data-whatever="@mdo" href="category">+ Thêm Danh Mục</a>
                                            </div>
                                        </div>
                                    </div>

                                    <c:if test="${not empty errorEmpty}">
                                            <div class="alert alert-danger" role="alert">
                                                <span class="fe fe-help-circle fe-16 mr-2"></span> ${errorEmpty}
                                            </div>
                                    </c:if>

                                    <c:if test="${not empty errorExist}">
                                        <div class="alert alert-danger" role="alert">
                                            <span class="fe fe-help-circle fe-16 mr-2"></span> ${errorExist}
                                        </div>
                                    </c:if>


                                    <%
                                        String add = request.getParameter("add");
                                        if (add != null && add.equals("true")) {
                                    %>
                                    <div class="alert alert-success" role="alert">
                                        <span class="fe fe-check-circle fe-16 mr-2"></span> Danh mục đã được thêm thành công
                                    </div>
                                    <%
                                    } else if (add != null && add.equals("false")) {
                                    %>
                                    <div class="alert alert-danger" role="alert">
                                        <span class="fe fe-help-circle fe-16 mr-2"></span> Thêm danh mục không thành công
                                    </div>
                                    <%
                                        }
                                    %>


                                    <%
                                        String edit = request.getParameter("edit");
                                        if (edit != null && edit.equals("true")) {
                                    %>
                                    <div class="alert alert-success" role="alert">
                                        <span class="fe fe-alert-circle fe-16 mr-2"></span> Danh mục đã được cập nhật thành công
                                    </div>
                                    <%
                                    } else if (edit != null && edit.equals("false")) {
                                    %>
                                    <div class="alert alert-danger" role="alert">
                                        <span class="fe fe-help-circle fe-16 mr-2"></span> Cập nhật danh mục không thành công
                                    </div>
                                    <%
                                        }
                                    %>


                                    <%
                                        String delete = request.getParameter("delete");
                                        if (delete != null && delete.equals("true")) {
                                    %>
                                    <div class="alert alert-success" role="alert">
                                        <span class="fe fe-alert-circle fe-16 mr-2"></span> Danh mục đã được xóa thành công
                                    </div>
                                    <%
                                    } else if (delete != null && delete.equals("false")) {
                                    %>
                                    <div class="alert alert-danger" role="alert">
                                        <span class="fe fe-help-circle fe-16 mr-2"></span> Xóa danh mục không thành công
                                    </div>
                                    <%
                                        }
                                    %>

                                    <!-- table -->
                                    <table class="table table-hover table-borderless border-v">
                                        <thead>
                                        <tr>
                                            <th>Danh Mục</th>
                                            <th>Tổng Sản Phẩm</th>
                                            <th>Hành Động</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listCate}" var="cate">
                                                <tr>
                                                    <td>${cate.name}</td>
                                                    <td>20000</td>
                                                    <td>
                                                        <a class="btn mb-2 btn-secondary" href="editCategory?id=${cate.id}">Sửa</a>
                                                        <a class="btn mb-2 btn-outline-dark" href="deleteCategory?id=${cate.id}">Xóa</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
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


        <!-- add-category -->
        <div class="modal fade modal-right-ac modal-slide" tabindex="-1" role="dialog" aria-labelledby="defaultModalLabelAC" aria-hidden="true">
            <div class="modal-dialog modal-sm" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="defaultModalLabelAC">Thêm Danh Mục</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="category" method="post">
                        <input type="hidden" name="action" value="add">
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="recipient-name-ac" class="col-form-label">Danh Mục</label>
                                <input type="text" class="form-control" id="recipient-name-ac" name="txt-category">
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
        <!-- end-add-category -->
    </main> <!-- main -->
</div> <!-- .wrapper -->
<jsp:include page="layout/script.jsp"></jsp:include>
</body>
</html>
