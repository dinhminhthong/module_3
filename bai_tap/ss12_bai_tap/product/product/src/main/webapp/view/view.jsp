<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2/13/2023
  Time: 1:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>View Product</title>
</head>
<body>
<table>
  <tr>
    <td>Name Product: </td>
    <td>${requestScope["product"].getName()}</td>
  </tr>
  <tr>
    <td>Price Product: </td>
    <td>${requestScope["product"].getPrice()}</td>
  </tr>
  <tr>
    <td></td>
    <td><a href="/product">Back to product list</a></td>
  </tr>
</table>
</body>
</html>
