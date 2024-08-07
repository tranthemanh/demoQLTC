<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 8/5/2024
  Time: 2:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Chi Tiêu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
</head>
<body>
<header class="bg-primary text-white text-center py-4 mb-4">
    <div class="container">
        <ul class="header-menu d-flex justify-content-center">
            <li><a href="/categories_earn" class="text-white text-decoration-none">Danh Mục</a></li>
            <li><a href="/moneyspand" class="text-white text-decoration-none">Thêm khoản chi</a></li>
            <li><a href="/moneyearn" class="text-white text-decoration-none">Thêm khoản thu</a></li>
            <li><a href="#" class="text-white text-decoration-none">Quản lý giao dịch</a></li>
            <li><a href="/wallets" class="text-white text-decoration-none">Ví tiền</a></li>
        </ul>
    </div>
</header>

<div class="container content">
    <h2 class="text-center mb-4">Thêm Khoản Chi</h2>
    <form method="post">
        <div class="row mb-3">
            <label for="date" class="col-sm-2 col-form-label">Ngày:</label>
            <div class="col-sm-10">
                <input type="date" name="date" id="date" class="form-control">
            </div>
        </div>
        <div class="row mb-3">
            <label for="amount" class="col-sm-2 col-form-label">Số Tiền:</label>
            <div class="col-sm-10">
                <input type="text" name="amount" id="amount" class="form-control">
            </div>
        </div>
        <div class="row mb-3">
            <label for="note" class="col-sm-2 col-form-label">Ghi Chú:</label>
            <div class="col-sm-10">
                <input type="text" name="note" id="note" class="form-control">
            </div>
        </div>
        <div class="row mb-3">
            <label for="categoryId" class="col-sm-2 col-form-label">Danh Mục:</label>
            <div class="col-sm-10">
                <select name="categoryId" id="categoryId" class="form-select">
                    <c:forEach items="${categories}" var="category">
                        <option value="${category.id}">${category.name}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="row mb-4">
            <label for="walletId" class="col-sm-2 col-form-label">Chọn Ví:</label>
            <div class="col-sm-10">
                <select name="walletId" id="walletId" class="form-select">
                    <c:forEach items="${wallets}" var="wallet">
                        <option value="${wallet.id}">${wallet.name}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="text-center">
            <button type="submit" class="btn btn-primary">Thêm</button>
        </div>
    </form>
</div>

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
