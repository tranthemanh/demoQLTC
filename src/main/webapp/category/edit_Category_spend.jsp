<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Cập nhật danh mục</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="style.css">
</head>
<body>
<!-- Header -->
<header class="bg-primary text-white text-center py-3 mb-4">
    <div class="container">
        <h1>Quản lý danh mục thu</h1>
    </div>
</header>

<!-- Main Content -->
<div class="container content">
    <h2>Cập nhật danh mục</h2>

    <!-- Hiển thị thông báo nếu có -->
    <c:if test="${not empty message}">
        <p style="color: green;">${message}</p>
    </c:if>

    <!-- Form cập nhật danh mục -->
    <form method="post">
        <input type="hidden" name="id" value="${category_spend.id}"/>

        <div class="mb-3">
            <label for="name" class="form-label">Tên danh mục:</label>
            <input type="text" id="name" name="name" value="${category_spend.name}" class="form-control" required/>
        </div>

        <div class="mb-3">
            <label for="note" class="form-label">Ghi chú:</label>
            <textarea id="note" name="note" class="form-control" required>${category_spend.note}</textarea>
        </div>

        <div>
            <button type="submit" class="btn btn-primary">Cập nhật</button>
        </div>
    </form>

    <!-- Nút quay lại -->
    <div class="mt-3">
        <a href="categories_earn" class="btn btn-secondary">
            <i class="fa fa-arrow-left" aria-hidden="true"></i> Quay lại danh sách danh mục
        </a>
    </div>
</div>

<!-- Footer -->
<footer class="bg-dark text-white text-center py-3 mt-4">
    <div class="container">
        <p>&copy; 2024 Quản lý danh mục thu. All Rights Reserved.</p>
    </div>
</footer>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
