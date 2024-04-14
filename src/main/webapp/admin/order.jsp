<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

                                    <%
                                        String updateMessage = (String) session.getAttribute("updateMessage");
                                        if (updateMessage != null) {
                                    %>
                                    <div class="alert alert-success" role="alert">
                                        <span class="fe fe-alert-circle fe-16 mr-2"></span> <%= updateMessage %>
                                    </div>
                                    <%
                                        session.removeAttribute("updateMessage");
                                    %>
                                    <%
                                        }
                                    %>


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
                                        <c:forEach items="${orders}" var="order">
                                            <tr>
                                                <td>#${order.id}</td>
                                                <td><fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                                <td>${order.address.fullName}</td>
                                                <td>${order.address.phone}</td>
                                                <td>${order.address.address}</td>
                                                <td><fmt:formatNumber value="${order.orderTotal}" type="currency" currencySymbol="đ" pattern="###,###,###đ"/></td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${order.paymentMethod == 'cod'}">
                                                            Tiền mặt
                                                        </c:when>
                                                        <c:when test="${order.paymentMethod == 'banking'}">
                                                            Chuyển khoản
                                                        </c:when>
                                                        <c:otherwise>
                                                            ${order.paymentMethod}
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${order.status == 'PROCESSING'}">
                                                            Chờ xử lý
                                                        </c:when>
                                                        <c:when test="${order.status == 'CONFIRMED'}">
                                                            <span style="color: green">Đã xác nhận</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            ${order.status}
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <div class="dropdown">
                                                        <button class="btn btn-sm dropdown-toggle more-vertical"
                                                                type="button" data-toggle="dropdown" aria-haspopup="true"
                                                                aria-expanded="false">
                                                            <span class="text-muted sr-only">Action</span>
                                                        </button>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <a class="dropdown-item" href="viewOrder?orderId=${order.id}">Chi Tiết</a>
                                                            <a class="dropdown-item edit-order" href="updateOrder?orderId=${order.id}" data-toggle="modal" data-target="#varyModal">Sửa</a>

                                                            <a class="dropdown-item" href="deleteOrder?orderId=${order.id}">Xóa</a>
                                                        </div>
                                                    </div>
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
                    <form method="post" action="updateOrder">
                        <div class="modal-body">
                            <div class="form-group">
                                <label class="col-form-label">Trạng Thái</label>
                                <input type="hidden" id="orderId" name="orderId" value="">

                                <select class="form-control" name="orderStatus">
                                    <c:forEach items="${orderStatusesList}" var="orderStatus">
                                        <c:choose>
                                            <c:when test="${orderStatus == 'PROCESSING'}">
                                                <option value="${orderStatus}">Chờ xử lý</option>
                                            </c:when>
                                            <c:when test="${orderStatus == 'CONFIRMED'}">
                                                <option value="${orderStatus}">Đã xác nhận</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option>${orderStatus}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </select>
                            </div>
                    </div>
                        <div class="modal-footer">
                            <button type="button" class="btn mb-2 btn-secondary" data-dismiss="modal">Đóng
                            </button>
                            <button type="submit" class="btn mb-2 btn-primary">Xác Nhận</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- end-update-status-category -->
    </main> <!-- main -->
</div> <!-- .wrapper -->
<jsp:include page="layout/script.jsp"></jsp:include>
<script>
    $(document).ready(function () {
        $('.edit-order').click(function () {
            var orderId = $(this).data('orderid');
            $('#orderId').val(orderId);
        });
    });
</script>


</body>
</html>

