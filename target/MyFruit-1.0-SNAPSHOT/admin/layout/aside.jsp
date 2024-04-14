<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<aside class="sidebar-left border-right bg-white shadow" id="leftSidebar" data-simplebar>
    <a href="#" class="btn collapseSidebar toggle-btn d-lg-none text-muted ml-2 mt-3" data-toggle="toggle">
        <i class="fe fe-x"><span class="sr-only"></span></i>
    </a>
    <nav class="vertnav navbar navbar-light">
        <!-- nav bar -->
        <div class="w-100 mb-4 d-flex">
            <a class="navbar-brand mx-auto mt-2 flex-fill text-center" href="home">
                Admin
            </a>
        </div>
        <ul class="navbar-nav flex-fill w-100 mb-2">
            <li class="nav-item w-100">
                <a class="nav-link" href="home">
                    <i class="fe fe-home fe-16"></i>
                    <span class="ml-3 item-text">Bảng Điều Khiển</span>
                </a>
            </li>
        </ul>

        <p class="text-muted nav-heading mt-4 mb-1">
            <span>Apps</span>
        </p>
        <ul class="navbar-nav flex-fill w-100 mb-2">
            <li class="nav-item w-100">
                <a class="nav-link" href="product">
                    <i class="fe fe-layers fe-16"></i>
                    <span class="ml-3 item-text">Sản Phẩm</span>
                </a>
            </li>
            <li class="nav-item w-100">
                <a class="nav-link" href="category">
                    <i class="fe fe-calendar fe-16"></i>
                    <span class="ml-3 item-text">Danh Mục</span>
                </a>
            </li>
            <li class="nav-item w-100">
                <a class="nav-link" href="order">
                    <i class="fe fe-truck fe-16"></i>
                    <span class="ml-3 item-text">Đơn Hàng</span>
                </a>
            </li>
            <li class="nav-item w-100">
                <a class="nav-link" href="authentication">
                    <i class="fe fe-shield fe-16"></i>
                    <span class="ml-3 item-text">Phân Quyền</span>
                </a>
            </li>
        </ul>

    </nav>
</aside>
