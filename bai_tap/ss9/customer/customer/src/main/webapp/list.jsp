<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2/10/2023
  Time: 10:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<a href="/customer"></a>
<h1 style="text-align: center">Danh Sách Khách Hàng</h1>
<table class="table table-bordered table-striped table-success">
    <thead>
    <tr>
        <td>Họ và tên</td>
        <td>Ngày Sinh</td>
        <td>Quê Quán</td>
        <td>Ảnh</td>
    </tr>
    <c:forEach var="customer" items="${customerList}">
        <tr>
        <td>${customer.name}</td>
        <td>${customer.date}</td>
        <td>${customer.address}</td>
        <td><img src="${customer.photo}" style="height: 100px;wight:100px"></td>
        </tr>
    </c:forEach>
    </tr>
    </thead>
</table>
<a class="btn btn-outline-secondary" href="/" type="submit">quay lại</a>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
