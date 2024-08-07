<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 8/7/2024
  Time: 10:12 AM
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 8/7/2024
  Time: 10:12 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Báo Cáo Thống Kê Thu Chi</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
</head>
<body>
<header class="bg-primary text-white text-center py-4 mb-4">
    <div class="container">
        <ul class="header-menu d-flex justify-content-center">
            <li><a href="/categories_earn" class="text-white text-decoration-none">Danh Mục</a></li>
            <li><a href="/moneyspend" class="text-white text-decoration-none">Thêm khoản chi</a></li>
            <li><a href="/moneyearn" class="text-white text-decoration-none">Thêm khoản thu</a></li>
            <li><a href="/report" class="text-white text-decoration-none">Báo cáo</a></li>
            <li><a href="/wallets" class="text-white text-decoration-none">Ví tiền</a></li>
        </ul>
    </div>
</header>

<div class="container content">
    <h2 class="text-center mb-4">Báo Cáo Thống Kê Thu Chi</h2>
    <form method="post" class="mb-4">
        <div class="row mb-3">
            <label for="startDate" class="col-sm-2 col-form-label">Ngày bắt đầu:</label>
            <div class="col-sm-4">
                <input type="date" name="startDate" id="startDate" class="form-control" required>
            </div>
            <label for="endDate" class="col-sm-2 col-form-label">Ngày kết thúc:</label>
            <div class="col-sm-4">
                <input type="date" name="endDate" id="endDate" class="form-control" required>
            </div>
        </div>
        <div class="text-center">
            <button type="submit" class="btn btn-primary">Xem Báo Cáo</button>
        </div>
    </form>

    <c:if test="${not empty spendings}">
        <h3>Thông tin chi tiêu</h3>
        <table class="table table-striped">
            <thead>
            <tr>
                <th>STT</th>
                <th>Ngày</th>
                <th>Số Tiền</th>
                <th>Ghi Chú</th>
                <th>Tên Danh Mục</th>
                <th>Tên Ví</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${spendings}" var="spending" varStatus="status">
                <tr>
                    <td>${status.index + 1}</td>
                    <td>${spending.date}</td>
                    <td>${spending.amount}</td>
                    <td>${spending.note}</td>
                    <td>${spending.categoryName}</td>
                    <td>${spending.walletName}</td>
                </tr>
            </c:forEach>
            </tbody>
            <tfoot>
            <tr>
                <td colspan="2"><strong>Tổng chi:</strong></td>
                <td colspan="4">${totalSpending}</td>
            </tr>
            </tfoot>
        </table>
    </c:if>

    <c:if test="${not empty earnings}">
        <h3>Thông tin thu nhập</h3>
        <table class="table table-striped">
            <thead>
            <tr>
                <th>STT</th>
                <th>Ngày</th>
                <th>Số Tiền</th>
                <th>Ghi Chú</th>
                <th>Tên Danh Mục</th>
                <th>Tên Ví</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${earnings}" var="earning" varStatus="status">
                <tr>
                    <td>${status.index + 1}</td>
                    <td>${earning.date}</td>
                    <td>${earning.amount}</td>
                    <td>${earning.note}</td>
                    <td>${earning.categoryName}</td>
                    <td>${earning.walletName}</td>
                </tr>
            </c:forEach>
            </tbody>
            <tfoot>
            <tr>
                <td colspan="2"><strong>Tổng thu:</strong></td>
                <td colspan="4">${totalEarning}</td>
            </tr>
            </tfoot>
        </table>
    </c:if>
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
