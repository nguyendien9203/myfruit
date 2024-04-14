<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<main role="main" class="main-content">
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-12">
                <div class="row">
                    <div class="col-md-6 col-xl-3 mb-4">
                        <div class="card shadow border-0">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col-3 text-center">
                          <span class="circle circle-sm bg-primary-light">
                            <i class="fe fe-16 fe-shopping-bag text-white mb-0"></i>
                          </span>
                                    </div>
                                    <div class="col pr-0">
                                        <p class="small text-muted mb-0">Doanh Thu Hàng Tháng</p>
                                        <span class="h3 mb-0">
                                            <fmt:formatNumber value="${totalRevenueInMonth}" type="currency" currencySymbol="đ" pattern="###,###,###đ"/>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6 col-xl-3 mb-4">
                        <div class="card shadow border-0">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col-3 text-center">
                          <span class="circle circle-sm bg-primary">
                            <i class="fe fe-16 fe-inbox text-white mb-0"></i>
                          </span>
                                    </div>
                                    <div class="col">
                                        <p class="small text-muted mb-0">Doanh Thu Hôm Nay</p>
                                        <span class="h3 mb-0">
                                            <span class="h3 mb-0">
                                                <c:choose>
                                                    <c:when test="${totalRevenueToday == null}">
                                                        0
                                                    </c:when>
                                                    <c:otherwise>
                                                        <fmt:formatNumber value="${totalRevenueToday}" type="currency" currencySymbol="đ" pattern="###,###,###đ"/>
                                                    </c:otherwise>
                                                </c:choose>


                                            </span>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6 col-xl-3 mb-4">
                        <div class="card shadow border-0">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col-3 text-center">
                          <span class="circle circle-sm bg-primary">
                            <i class="fe fe-16 fe-shopping-cart text-white mb-0"></i>
                          </span>
                                    </div>
                                    <div class="col pr-0">
                                        <p class="small text-muted mb-0">Đơn Hàng Hôm Nay</p>
                                        <span class="h3 mb-0">
                                            ${ordersCountToday}

                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                </div> <!-- end section -->

                <div class="row">
                    <!-- Recent orders -->
                    <div class="col-md-12">
                        <h6 class="mb-3">Đơn Hàng Gần Nhất</h6>
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
                    </div> <!-- / .col-md-3 -->
                </div> <!-- end section -->
            </div>
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
