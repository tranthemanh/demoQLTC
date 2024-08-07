
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Hiển thị danh sách danh mục</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="style.css">
<body>
<!-- Header -->
<header class="bg-primary text-white text-center py-4 mb-4">
    <div class="container">
        <ul class="header-menu d-flex justify-content-center">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle text-white text-decoration-none" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Danh Mục
                </a>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="/categories_earn">Danh mục chi tiêu</a></li>
                    <li><a class="dropdown-item" href="/categories_spend">Danh mục thu</a></li>
                </ul>
            </li>
            <li><a href="/moneyspend" class="text-white text-decoration-none">Thêm khoản chi</a></li>
            <li><a href="/moneyearn" class="text-white text-decoration-none">Thêm khoản thu</a></li>
            <li><a href="/report" class="text-white text-decoration-none">Quản lý giao dịch</a></li>
            <li><a href="/wallets" class="text-white text-decoration-none">Ví tiền</a></li>
        </ul>
    </div>
</header>


<div class="container content">
    <div class="mb-3">
        <a href="categories_earn?action=create" class="btn btn-primary">
            <i class="fa fa-plus"></i> Thêm danh mục
        </a>
    </div>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>Tên danh mục</th>
            <th>Hành động</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${categories_earn}" var="category_earn">
            <tr>
                <td><c:out value="${category_earn.name}"/></td>
                <td>
                    <a href="/categories_earn?action=edit&id=${category_earn.id}" class="btn btn-warning btn-sm">
                        <i class="fa fa-pencil" aria-hidden="true"></i> Sửa
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<!-- Footer -->
<footer class="bg-dark text-white text-center py-3 mt-auto">
    <div class="container">
        <p>&copy; 2024 Quản lý danh mục chi tiêu. All Rights Reserved.</p>
    </div>
</footer>
</body>
</html>
