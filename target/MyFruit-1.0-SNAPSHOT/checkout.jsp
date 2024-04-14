<%@ page import="vn.fpt.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>MyFruit - Thanh Toán</title>
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">

    <link rel="stylesheet" href="css/animate.css">

    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">


    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="goto-here">
    <jsp:include page="./layout/nav.jsp"></jsp:include>
    <div class="hero-wrap hero-bread" style="background-image: url('images/bg_1.jpg');">
        <div class="container">
            <div class="row no-gutters slider-text align-items-center justify-content-center">
                <div class="col-md-9 ftco-animate text-center">
                    <p class="breadcrumbs"><span class="mr-2"><a href="home">Trang Chủ</a></span> <span>Thanh Toán</span></p>
                    <h1 class="mb-0 bread">Thanh Toán</h1>
                </div>
            </div>
        </div>
    </div>

    <section class="ftco-section">
        <div class="container">
            <form action="checkout" method="post" class="billing-form">
                <c:if test="${not empty errors}">
                    <div class="alert alert-danger" role="alert">
                        <span class="fe fe-alert-circle fe-16 mr-2"></span>
                        <ul>
                            <c:forEach items="${errors}" var="error">
                                <li>${error}</li>
                            </c:forEach>
                        </ul>
                    </div>
                </c:if>
                <div class="row justify-content-center">

                    <div class="col-xl-7 ftco-animate">
                            <h3 class="mb-4 billing-heading">Chi Tiết Thanh Toán</h3>
                            <div class="row align-items-end">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Tên Khách Hàng</label>
                                            <input type="text" class="form-control" placeholder="Họ và tên" name="fullName">
                                        </div>
                                    </div>
                                    <div class="w-100"></div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Địa Chỉ Vận Chuyển</label>
                                            <input type="text" class="form-control" placeholder="Địa chỉ" name="address">
                                        </div>
                                    </div>
                                    <div class="w-100"></div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Số Điện Thoại</label>
                                            <input type="text" class="form-control" placeholder="Số điện thoại" name="phone">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Email</label>
                                            <input type="text" class="form-control" placeholder="Địa chỉ email" name="email">
                                        </div>
                                    </div>
                                    <div class="w-100"></div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Ghi chú</label>
                                            <textarea name="note" id="" cols="30" rows="7" class="form-control" placeholder="Ghi chú" ></textarea>
                                        </div>
                                    </div>
                                </div>
                        </div>
                    <div class="col-xl-5">
                            <div class="row mt-5 pt-3">
                                <div class="col-md-12 d-flex mb-5">

                                    <c:set var="totalPrice" value="0"/>
                                    <c:forEach items="${sessionScope.order.orderItem}" var="orderItem">
                                        <c:set var="totalPrice" value="${totalPrice + (orderItem.price * orderItem.qty)}"/>
                                    </c:forEach>

                                    <c:set var="shippingFee" value="0"/>
                                    <c:if test="${totalPrice > 500000}">
                                        <c:set var="shippingFee" value="20600"/>
                                    </c:if>

                                    <c:set var="vat" value="${totalPrice * 0.1}"/>

                                    <input type="hidden" value="${totalPrice + shippingFee + vat}" name="orderTotal">

                                    <div class="cart-detail cart-total p-3 p-md-4">
                                        <h3 class="billing-heading mb-4">Tổng Đơn Hàng</h3>
                                        <p class="d-flex">
                                            <span>Tổng Sản Phẩm</span>
                                            <span><fmt:formatNumber value="${totalPrice}" type="currency" currencySymbol="đ" pattern="###,###,###đ"/></span>
                                        </p>
                                        <p class="d-flex">
                                            <span>Phí Vận Chuyển</span>
                                            <span><fmt:formatNumber value="${shippingFee}" type="currency" currencySymbol="đ" pattern="###,###,###đ"/></span>
                                        </p>
                                        <p class="d-flex">
                                            <span>VAT 10%</span>
                                            <span><fmt:formatNumber value="${vat}" type="currency" currencySymbol="đ" pattern="###,###,###đ"/></span>
                                        </p>
                                        <hr>

                                        <c:set var="grandTotal" value="${totalPrice + shippingFee + vat}"/>
                                        <p class="d-flex total-price">
                                            <span>Tổng</span>
                                            <span><fmt:formatNumber value="${grandTotal}" type="currency" currencySymbol="đ" pattern="###,###,###đ"/></span>
                                        </p>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="cart-detail p-3 p-md-4">
                                        <h3 class="billing-heading mb-4">Phương Thức Thanh Toán</h3>
                                        <div class="form-group">
                                            <div class="col-md-12">
                                                <div class="radio">
                                                    <label><input type="radio" name="paymentMethod" class="mr-2" value="cod">Thanh Toán Khi Giao Hàng</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-12">
                                                <div class="radio">
                                                    <label><input type="radio" name="paymentMethod" class="mr-2" value="banking">Chuyển Khoản</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-12">
                                                <div class="checkbox">
                                                    <label><input type="checkbox" value="" id="agreeCheckbox" class="mr-2" onchange="toggleSubmitButton()">Tôi đã đọc và chấp nhận các điều khoản và điều kiện</label>
                                                </div>
                                            </div>
                                        </div>
                                        <%
                                            session = request.getSession(false);
                                            if (session == null || session.getAttribute("user") == null) {
                                                response.sendRedirect("login");
                                            } else {
                                                User user = (User) session.getAttribute("user");
                                        %>
                                        <input type="submit" value="Đặt Hàng" class="btn btn-primary py-3 px-4" id="submitButton" disabled>

                                        <%
                                            }
                                        %>

                                    </div>
                                </div>
                            </div>
                        </div> <!-- .col-md-8 -->
                </div>
            </form><!-- END -->
        </div>
    </section> <!-- .section -->
    <jsp:include page="./layout/footer.jsp"></jsp:include>
    <jsp:include page="./layout/loader.jsp"></jsp:include>
    <jsp:include page="./layout/script.jsp"></jsp:include>
    <script>
        function toggleSubmitButton() {
            var checkbox = document.getElementById("agreeCheckbox");
            var submitButton = document.getElementById("submitButton");

            if (checkbox.checked) {
                submitButton.disabled = false;
            } else {
                submitButton.disabled = true;
            }
        }
    </script>

</body>
</html>
