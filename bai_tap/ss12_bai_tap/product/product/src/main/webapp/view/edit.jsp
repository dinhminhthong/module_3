<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2/13/2023
  Time: 1:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
  <title>Edit Product</title>
</head>
<body>

<h1>Edit Product</h1>
<p>
  <c:if test='${requestScope["message"] != null}'>
    <span class="message">${requestScope["message"]}</span>
  </c:if>
</p>
<p>
  <a href="/product">Back to product list</a>
</p>
<form method="post">
  <fieldset>
    <legend>Product information</legend>
    <table>
      <tr>
        <td>Name Product: </td>
        <td><input type="text" name="name"  value="${requestScope["product"].getName()}"></td>
      </tr>
      <tr>
        <td>Price Product: </td>
        <td><input type="text" name="price" value="${requestScope["product"].getPrice()}"></td>
      </tr>
      <tr>
        <td></td>
        <td><input type="submit" value="Update Product"></td>
      </tr>
    </table>
  </fieldset>
</form>
</body>
</html>