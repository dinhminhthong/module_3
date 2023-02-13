<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2/13/2023
  Time: 1:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Delete Product</title>
</head>
<body>
<h1>Delete Product</h1>
<p>
  <a href="/product">Back to product list</a>
</p>
<form method="post">
  <h3>Are you sure?</h3>
  <fieldset>
    <legend>Product information</legend>
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
        <td><input type="submit" value="Delete Product"></td>
        <td><a href="/product">Back to product list</a></td>
      </tr>
    </table>
  </fieldset>
</form>
</body>
</html>
