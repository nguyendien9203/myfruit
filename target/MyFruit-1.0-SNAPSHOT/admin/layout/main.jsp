<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                                        <span class="h3 mb-0">$1250</span>
                                        <span class="small text-muted">+5.5%</span>
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
                                        <span class="h3 mb-0">$80</span>
                                        <span class="small text-muted">+5.5%</span>
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
                                        <span class="h3 mb-0">20</span>
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
                        <table class="table table-hover table-borderless border-v">
                            <thead>
                            <tr role="row">
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
                            <td>#1331</td>
                            <td>2020-12-26 01:32:21</td>
                            <td>Kasimir Lindsey</td>
                            <td>(697) 486-2101</td>
                            <td>996-3523 Et Ave</td>
                            <td>$3.64</td>
                            <td>Chuyển khoản</td>
                            <td>Chờ xử lý</td>
                            <td>
                                <div class="dropdown">
                                    <button class="btn btn-sm dropdown-toggle more-vertical"
                                            type="button" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false">
                                        <span class="text-muted sr-only">Action</span>
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-right">
                                        <a class="dropdown-item" href="viewOrder.jsp">Chi Tiết</a>
                                        <a class="dropdown-item" data-toggle="modal"
                                           data-target="#varyModal" data-whatever="@mdo"
                                           href="#">Sửa</a>
                                        <a class="dropdown-item" href="#">Xóa</a>
                                    </div>
                                </div>
                            </td>
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
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label class="col-form-label">Trạng Thái</label>
                            <select class="form-control">
                                <option>Chờ xử lý</option>
                                <option>Đang xử lý</option>
                                <option>Đã giao hàng</option>
                            </select>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn mb-2 btn-secondary" data-dismiss="modal">Đóng
                    </button>
                    <button type="button" class="btn mb-2 btn-primary">Xác Nhận</button>
                </div>
            </div>
        </div>
    </div>
    <!-- end-update-status-category -->
</main> <!-- main -->
