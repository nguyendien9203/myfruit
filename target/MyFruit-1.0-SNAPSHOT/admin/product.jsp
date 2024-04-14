<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


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
                                                <a class="btn btn-primary float-right ml-3" href="addProduct">+ Thêm Sản Phẩm</a>
                                            </div>
                                        </div>

                                    </div>
                                    <% String add = request.getParameter("add");
                                        if (add != null && add.equals("false")) { %>
                                    <div class="alert alert-danger" role="alert">
                                        <span class="fe fe-help-circle fe-16 mr-2"></span> Sản phẩm bạn thêm đã tồn tại
                                    </div>
                                    <% } else if (add != null && add.equals("true")) { %>
                                    <div class="alert alert-success" role="alert">
                                        <span class="fe fe-alert-circle fe-16 mr-2"></span> Sản phẩm đã được thêm thành công
                                    </div>
                                    <% } %>

                                    <% String edit = request.getParameter("edit");
                                        if (edit != null && edit.equals("false")) { %>
                                    <div class="alert alert-danger" role="alert">
                                        <span class="fe fe-help-circle fe-16 mr-2"></span> Sản phẩm cập nhật thất bại
                                    </div>
                                    <% } else if (edit != null && edit.equals("true")) { %>
                                    <div class="alert alert-success" role="alert">
                                        <span class="fe fe-alert-circle fe-16 mr-2"></span> Sản phẩm đã được cập nhật thành công
                                    </div>
                                    <% } %>

                                    <% String delete = request.getParameter("delete");
                                        if (delete != null && delete.equals("false")) { %>
                                    <div class="alert alert-danger" role="alert">
                                        <span class="fe fe-help-circle fe-16 mr-2"></span> Xóa sản phẩm thất bại
                                    </div>
                                    <% } else if (delete != null && delete.equals("true")) { %>
                                    <div class="alert alert-success" role="alert">
                                        <span class="fe fe-alert-circle fe-16 mr-2"></span> Sản phẩm đã được xóa thành công
                                    </div>
                                    <% } %>
                                    <!-- table -->
                                    <c:if test="${empty listProduct}">
                                        <p>Không có sản phẩm nào</p>
                                    </c:if>

                                    <c:if test="${not empty listProduct}">
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
                                        <c:forEach items="${listProduct}" var="product">
                                            <tr>
                                                <td>
                                                    <div class="avatar avatar-md">
                                                        <img src="${pageContext.request.contextPath}/images/uploads/${product.image}" alt="..." class="avatar-img">
                                                    </div>
                                                </td>
                                                <td>
                                                    <p class="mb-0">${product.name}</p>
                                                    <small class="mb-0 text-muted">#${product.SKU}</small>
                                                </td>
                                                <td>
                                                    <c:forEach var="o" items="${product.category}">
                                                        <p>${o.name}</p>
                                                    </c:forEach>
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${product.discount > 0}">
                                                            <p class="mb-0" style="color: red">
                                                                <fmt:formatNumber value="${product.discount}" type="currency" currencySymbol="đ" pattern="###,###,###đ"/>
                                                            </p>
                                                            <small style="text-decoration: line-through" class="mb-0 text-muted">
                                                                <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="đ" pattern="###,###,###đ"/>
                                                            </small>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <p class="mb-0">
                                                                <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="đ" pattern="###,###,###đ"/>
                                                            </p>
                                                        </c:otherwise>
                                                    </c:choose>

                                                </td>
                                                <td>${product.qtyInStock}</td>
                                                <td class="w-25"><small> ${product.desc}</small></td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${product.qtyInStock > 0}">
                                                            <span style="color: green;">Còn hàng</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span style="color: red;">Hết hàng</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <a class="btn mb-2 btn-secondary"  href="editProduct?id=${product.id}">Sửa</a>
                                                    <a class="btn mb-2 btn-outline-dark" href="deleteProduct?id=${product.id}">Xóa</a>
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
                                    </c:if>
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
