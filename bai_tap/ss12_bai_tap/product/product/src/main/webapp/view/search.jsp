<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2/13/2023
  Time: 1:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Search Product</title>
</head>
<body>
<h3> Product is:</h3>
<table border="1">
  <tr>
    <td>Name Product</td>
    <td>Price Product</td>
    <td>Edit Product</td>
    <td>Delete Product</td>
  </tr>
  <c:forEach items='${requestScope["products"]}' var="products">
    <tr>
      <td><a href="/product?action=view&id=${products.getId()}">${products.getName()}</a></td>
      <td>${products.getPrice()}</td>
      <td><a href="/product?action=edit&id=${products.getId()}">Edit</a></td>
      <td><a href="/product?action=delete&id=${products.getId()}">Delete</a></td>
    </tr>
  </c:forEach>
</table>
</body>
</html>