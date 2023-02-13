<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2/13/2023
  Time: 1:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
  <title>Product List</title>
</head>
<body>
<h1> Products</h1>
<button><a href="product?action=create">Create New Product</a></button><br>

<form action="/product?action=searchByName" method="post">
  <input type="text" name="searchName">
  <button type="submit">Search</button>
</form>

</p>
<table border="1">
  <tr>
    <td>Id Product</td>
    <td>Name Product</td>
    <td>Price Product</td>
    <td>Edit Product</td>
    <td>Delete Product</td>
  </tr>
  <c:forEach items='${requestScope["products"]}' var="product">
    <tr>
      <td><a href="/product?action=view&id=${product.getId()}">
          ${product.getName()}</a></td>
      <td>${product.getPrice()}</td>
      <td><a href="/product?action=edit&id=${product.getId()}">Edit</a></td>
      <td><a href="/product?action=delete&id=${product.getId()}">Delete</a></td>
    </tr>
  </c:forEach>
</table>
</body>
</html>