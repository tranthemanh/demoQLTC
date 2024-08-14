<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Tài Chính</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="style.css">
</head>
<body>
<header class="bg-primary text-white text-center py-4 mb-4">
    <div class="container">
        <ul class="header-menu d-flex justify-content-center">
            <li><a href="/categories_earn" class="text-white text-decoration-none">Danh Mục</a></li>
            <li><a href="/moneyspend" class="text-white text-decoration-none">Thêm khoản chi</a></li>
            <li><a href="/moneyearn" class="text-white text-decoration-none">Thêm khoản thu</a></li>
            <li><a href="/report" class="text-white text-decoration-none">Quản lý giao dịch</a></li>
            <li><a href="/wallets" class="text-white text-decoration-none">Ví tiền</a></li>
        </ul>
    </div>
</header>

<main class="container content">
    <h2 class="text-center mb-4">Quản Lý Ví Tiền</h2>
    <div class="text-center mb-4">
        <a href="/wallets?action=create" class="btn btn-primary">Thêm ví tiền mới</a>
    </div>
    <caption class="fs-4 mb-3">Danh sách ví tiền</caption>
    <table class="table table-striped">
        <thead>
        <tr>
            <th></th>

            <th>Tên Ví</th>
            <th>Số Tiền</th>
            <th>Lựa Chọn</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${listWallet}" var="wallet">
            <tr>
                <td><i class="fas fa-wallet"></i></td>
                <td><c:out value="${wallet.name}"></c:out></td>
                <td><c:out value="${wallet.amount}"></c:out></td>
                <td>
                    <a href="/wallets?action=update&id=${wallet.id}" class="btn btn-warning btn-sm">Sửa</a>
                    <a href="/wallets?action=delete&id=${wallet.id}" class="btn btn-danger btn-sm">Xóa</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</main>

<footer class="bg-dark text-white text-center py-3 mt-4">
    <div class="container">
        <p>© 2024 Quản Lý Chi Tiêu. Tất cả các quyền được bảo lưu.</p>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>