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
                            <h2 class="h4 mb-1">Đơn Hàng #${order.id}</h2>
                            <p class="mb-3 text-muted"><fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
                            <a class="btn btn-primary mb-4" href="order"><span class="fe fe-16 fe-arrow-left"></span> Quay Lại </a>
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


                                                <c:forEach items="${order.orderItem}" var="orderItem">
                                                    <tr>
                                                        <td>
                                                            <p class="mb-0">${orderItem.product.name}</p>
                                                            <small class="mb-0 text-muted">#${orderItem.product.SKU}</small>
                                                        </td>
                                                        <td>
                                                            <fmt:formatNumber value="${orderItem.price}" type="currency" currencySymbol="đ" pattern="###,###,###đ"/>
                                                        </td>
                                                        <td>${orderItem.qty}</td>
                                                        <td>
                                                            <fmt:formatNumber value="${orderItem.price * orderItem.qty}" type="currency" currencySymbol="đ" pattern="###,###,###đ"/>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>

                                            <c:set var="totalPrice" value="0"/>
                                            <c:forEach items="${order.orderItem}" var="orderItem">
                                                <c:set var="totalPrice" value="${totalPrice + (orderItem.price * orderItem.qty)}"/>
                                            </c:forEach>

                                            <c:set var="shippingFee" value="0"/>
                                            <c:if test="${totalPrice > 500000}">
                                                <c:set var="shippingFee" value="20600"/>
                                            </c:if>

                                            <c:set var="vat" value="${totalPrice * 0.1}"/>

                                            <div class="col-md-5 float-right">
                                                <div class="text-right mr-2">
                                                    <p class="row mb-2 h6">
                                                        <span class="col-sm-6 text-muted">Tổng Sản Phẩm: </span>
                                                        <strong class="col-sm-6">
                                                            <fmt:formatNumber value="${totalPrice}" type="currency" currencySymbol="đ" pattern="###,###,###đ"/>
                                                        </strong>
                                                    </p>
                                                    <p class="row mb-2 h6">
                                                        <span class="col-sm-6 text-muted">Phí Vận Chuyển: </span>
                                                        <strong class="col-sm-6">
                                                            <fmt:formatNumber value="${shippingFee}" type="currency" currencySymbol="đ" pattern="###,###,###đ"/>
                                                        </strong>
                                                    </p>
                                                    <p class="row mb-2 h6">
                                                        <span class="col-sm-6 text-muted">VAT(10%): </span>
                                                        <strong class="col-sm-6">
                                                            <fmt:formatNumber value="${vat}" type="currency" currencySymbol="đ" pattern="###,###,###đ"/>
                                                        </strong>
                                                    </p>

                                                    <c:set var="grandTotal" value="${totalPrice + shippingFee + vat}"/>
                                                    <p class="row mb-2 h6">
                                                        <span class="col-sm-6 text-muted">Tổng: </span>
                                                        <strong class="col-sm-6">
                                                            <fmt:formatNumber value="${grandTotal}" type="currency" currencySymbol="đ" pattern="###,###,###đ"/>
                                                        </strong>
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
                                                <p class="col-sm-7">#${order.user.id}</p>
                                            </div>

                                            <div class="row">
                                                <label class="col-sm-5 text-muted">Tên Khách Hàng:</label>
                                                <p class="col-sm-7">${order.user.fullName}</p>
                                            </div>

                                            <div class="row">
                                                <label class="col-sm-5 text-muted">Email:</label>
                                                <p class="col-sm-7">${order.user.email}</p>
                                            </div>

                                            <div class="row">
                                                <label class="col-sm-5 text-muted">Số Điện Thoại:</label>
                                                <p class="col-sm-7">${order.user.phone}</p>
                                            </div>

                                        </div> <!-- /.card-body -->
                                    </div> <!-- /.card -->

                                    <div class="card shadow mb-4">
                                        <div class="card-body">
                                            <h5 class="mb-4"><strong>Địa Chỉ Giao Hàng</strong></h5>

                                            <div class="row">
                                                <label class="col-sm-5 text-muted">Người Nhận:</label>
                                                <p class="col-sm-7">${order.address.fullName}</p>
                                            </div>

                                            <div class="row">
                                                <label class="col-sm-5 text-muted">Email:</label>
                                                <p class="col-sm-7">${order.address.email}</p>
                                            </div>

                                            <div class="row">
                                                <label class="col-sm-5 text-muted">Số Điện Thoại:</label>
                                                <p class="col-sm-7">${order.address.phone}</p>
                                            </div>

                                            <div class="row">
                                                <label class="col-sm-5 text-muted">Địa Chỉ:</label>
                                                <p class="col-sm-7">${order.address.address}</p>
                                            </div>

                                            <div class="row">
                                                <label class="col-sm-5 text-muted">Ghi Chú:</label>
                                                <p class="col-sm-7">${order.address.note_address}</p>
                                            </div>
                                        </div> <!-- /.card-body -->
                                    </div> <!-- /.card -->
                                </div> <!-- /.col -->
                            </div>
                        </div> <!-- end section -->
                    </div> <!-- .col-12 -->

            </div> <!-- .container-fluid -->
        </main> <!-- main -->
    </div> <!-- .wrapper -->
    <jsp:include page="layout/script.jsp"></jsp:include>
</body>
</html>

