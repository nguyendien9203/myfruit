<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
<body class="vertical light">
    <div class="wrapper">
        <jsp:include page="layout/nav.jsp"></jsp:include>
        <jsp:include page="layout/aside.jsp"></jsp:include>
        <main role="main" class="main-content">
            <div class="container-fluid">
                <div class="row justify-content-center">
                    <div class="col-12">
                        <h2 class="h4 mb-1">Cập Nhật Danh Mục</h2>
                        <form method="post" action="editCategory" >
                            <div>
                                <a class="btn btn-primary mb-4" href="category"><span
                                        class="fe fe-16 fe-arrow-left"></span> Quay Lại </a>
                                <button class="btn btn-primary mb-4 float-right" type="submit">Cập Nhật</button>
                            </div>

                            <div class="errors">
                                <c:if test="${not empty errors}">
                                    <ul>
                                        <c:forEach items="${errors}" var="error">
                                            <li style="color: red">${error}</li>
                                        </c:forEach>
                                    </ul>
                                </c:if>
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

                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group mb-3">
                                        <input type="hidden" name="categoryId" value="${category.id}">
                                        <label for="product-name">Tên Danh Mục</label>
                                        <input type="text" id="product-name"  class="form-control" name="categoryName" value="${category.name}">
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div> <!-- .col-12 -->
                </div> <!-- .row -->
            </div> <!-- .container-fluid -->
        </main> <!-- main -->
    </div> <!-- .wrapper -->
    <jsp:include page="layout/script.jsp"></jsp:include>

    </body>
</html>

