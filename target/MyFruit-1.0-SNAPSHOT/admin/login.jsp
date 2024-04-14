<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <link rel="icon" href="favicon.ico">
    <title>Login</title>
    <!-- Simple bar CSS -->
    <link rel="stylesheet" href="css/simplebar.css">
    <!-- Fonts CSS -->
    <link href="https://fonts.googleapis.com/css2?family=Overpass:ital,wght@0,100;0,200;0,300;0,400;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <!-- Icons CSS -->
    <link rel="stylesheet" href="css/feather.css">
    <!-- Date Range Picker CSS -->
    <link rel="stylesheet" href="css/daterangepicker.css">
    <!-- App CSS -->
    <link rel="stylesheet" href="css/app-light.css" id="lightTheme">
    <link rel="stylesheet" href="css/app-dark.css" id="darkTheme" disabled>
</head>
<body class="light ">
<div class="wrapper vh-100">
    <div class="row align-items-center h-100">

        <form class="col-lg-3 col-md-4 col-10 mx-auto text-center" method="post" action="login">
            <h1>Đăng Nhập</h1>
            <% String success = request.getParameter("success");
                if (success != null && success.equals("false")) { %>
            <p style="color: red;">Đăng nhập thất bại</p> <%
            } %>

            <% String error = request.getParameter("error");
                if (error != null && error.equals("emptyInput")) { %>
            <p style="color: red;">Vui lòng không được để trống</p>
            <% } else if (error != null && error.equals("lockedAccount")) { %>
            <p style="color: red;">Tài khoản này đã bị khóa</p> <%
            }
        %>
            <div class="form-group">
                <label for="inputEmail" class="sr-only">Tài Khoản</label>
                <input type="text" id="inputEmail" class="form-control form-control-lg" placeholder="Tài Khoản" name="username">
            </div>
            <div class="form-group">
                <label for="inputPassword" class="sr-only">Mật Khẩu</label>
                <input type="password" id="inputPassword" class="form-control form-control-lg" placeholder="Mật Khẩu" name="password">
            </div>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Đăng Nhập</button>
        </form>
    </div>
</div>
<jsp:include page="layout/script.jsp"></jsp:include>
</body>
</html>
