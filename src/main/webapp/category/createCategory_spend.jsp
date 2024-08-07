<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 8/2/2024
  Time: 3:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Them moi danh muc</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"></head>
    <link rel="stylesheet" href="style.css">
<body>
<!-- Header -->
<header class="bg-primary text-white text-center py-3 mb-4">
    <div class="container">
        <h1>Quản lý danh mục thu</h1>
    </div>
</header>
<div class="container">
    <h1> Them Danh Muc Thu</h1>
    <h3><a href="/categories_spend" class="btn btn-secondary"><i class="fa fa-arrow-left" aria-hidden="true"></i> Back</a></h3>
    <c:out value="${message}"></c:out>
    <form method="post">
        <div class="mb-3">
            <label for="name">Nhap ten <span style="color: red">*</span></label>
            <input type="text" name="name" id="name" placeholder="Nhap ten" maxlength="255" class="form-control"
                   required/>
        </div>
        <div class="mb-3">
            <label for="note">Nhap ghi chu</label>
            <input type="text" name="note" id="note" placeholder="Nhap ghi chu" class="form-control"/>
        </div>
        <button type="submit" class="btn btn-primary">Them</button>
    </form>
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
