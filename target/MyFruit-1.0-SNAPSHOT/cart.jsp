<%@ page import="vn.fpt.entity.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Fruit - Giỏ Hàng</title>
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
                    <p class="breadcrumbs"><span class="mr-2"><a href="home">Trang Chủ</a></span> <span>Giỏ Hàng</span></p>
                    <h1 class="mb-0 bread">Giỏ Hàng</h1>
                </div>
            </div>
        </div>
    </div>

    <section class="ftco-section ftco-cart">
        <div class="container">
            <%
                String order = request.getParameter("order");
                if (order != null && order.equals("true")) {
            %>
            <div class="alert alert-success" role="alert">
                <span class="fe fe-alert-circle fe-16 mr-2"></span> Đặt hàng thành công
            </div>
            <%
                }
            %>

            <c:if test="${empty sessionScope.order or empty sessionScope.order.orderItem}">
                <div class="alert alert-info" role="alert">
                    <span class="fe fe-alert-circle fe-16 mr-2"></span> Không có sản phẩm nào trong giỏ hàng
                </div>
            </c:if>

            <c:if test="${not empty sessionScope.order and not empty sessionScope.order.orderItem}">

                <%
                    String add = request.getParameter("add");
                    if (add != null && add.equals("true")) {
                %>
                <div class="alert alert-success" role="alert">
                    <span class="fe fe-alert-circle fe-16 mr-2"></span> Đã thêm vào giỏ hàng thành công
                </div>
                <%
                    }
                %>

                <%
                    String update = request.getParameter("update");
                    if (update != null && update.equals("true")) {
                %>
                <div class="alert alert-success" role="alert">
                    <span class="fe fe-alert-circle fe-16 mr-2"></span> Cập nhật giỏ hàng thành công
                </div>
                <%
                    }
                %>

                <%
                    String delete = request.getParameter("delete");
                    if (delete != null && delete.equals("true")) {
                %>
                <div class="alert alert-success" role="alert">
                    <span class="fe fe-alert-circle fe-16 mr-2"></span> Một sản phẩm trong giỏ hàng đã được xóa thành công
                </div>
                <%
                    }
                %>
                <div class="row">
                    <div class="col-md-12 ftco-animate">
                        <div class="cart-list">
                            <table class="table">
                                <thead class="thead-primary">
                                <tr class="text-center">
                                    <th>&nbsp;</th>
                                    <th>&nbsp;</th>
                                    <th>Tên Sản Phẩm</th>
                                    <th>Giá</th>
                                    <th>Số Lượng</th>
                                    <th>Tổng Tiền</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${sessionScope.order.orderItem}" var="orderItem">
                                    <tr class="text-center">
                                        <td class="product-remove">
                                            <a href="deleteCart?productId=${orderItem.product.id}"><span class="ion-ios-close"></span></a>
                                        </td>
                                        <td class="image-prod">
                                            <div class="img" style="background-image:url(${pageContext.request.contextPath}/images/uploads/${orderItem.product.image});"></div>
                                        </td>
                                        <td class="product-name">
                                            <h3>${orderItem.product.name}</h3>
                                        </td>
                                        <td class="price">
                                            <fmt:formatNumber value="${orderItem.price}" type="currency" currencySymbol="đ" pattern="###,###,###đ"/>
                                        </td>
                                        <td class="quantity">
                                            <form method="post" action="updateCart">
                                                <div class="input-group mb-3">
                                                    <input type="hidden" value="${orderItem.product.id}" name="productId">
                                                    <input type="text" name="quantity" class="quantity form-control input-number" value="${orderItem.qty}" min="1" max="100">
                                                    <span class="input-group-btn ml-2">
                                                        <button type="submit" class="quantity-right-plus btn" data-type="plus" data-field=""><i class="ion-ios-arrow-forward"></i></button>
                                                    </span>
                                                </div>
                                            </form>
                                        </td>
                                        <td class="total">
                                            <fmt:formatNumber value="${orderItem.price * orderItem.qty}" type="currency" currencySymbol="đ" pattern="###,###,###đ"/>
                                        </td>
                                    </tr>
                                </c:forEach>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="row justify-content-end">
                    <div class="col-lg-4 mt-5 cart-wrap ftco-animate">
                        <c:set var="totalPrice" value="0"/>
                        <c:forEach items="${sessionScope.order.orderItem}" var="orderItem">
                            <c:set var="totalPrice" value="${totalPrice + (orderItem.price * orderItem.qty)}"/>
                        </c:forEach>

                        <c:set var="shippingFee" value="0"/>
                        <c:if test="${totalPrice > 500000}">
                            <c:set var="shippingFee" value="20600"/>
                        </c:if>

                        <c:set var="vat" value="${totalPrice * 0.1}"/>

                        <div class="cart-total mb-3">
                            <h3>Tổng Đơn Hàng</h3>
                            <p class="d-flex">
                                <span>Tổng sản phẩm</span>
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
                        <p>
                            <a href="checkout" class="btn btn-primary py-3 px-4 mr-2">Thanh Toán</a>
                            <a href="product" class="btn btn-black py-3 px-4">Tiếp Tục Mua</a>
                        </p>
                    </div>
                </div>
            </c:if>
        </div>
    </section>
    <jsp:include page="./layout/footer.jsp"></jsp:include>
    <jsp:include page="./layout/loader.jsp"></jsp:include>
    <jsp:include page="./layout/script.jsp"></jsp:include>


</body>
</html>
