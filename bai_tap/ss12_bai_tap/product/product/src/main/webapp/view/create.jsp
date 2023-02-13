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
    <title>Create Product</title>
</head>
<body>
<style>
    .message{
        color:green;
    }
</style>
<h1>Create new customer</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="product/create.jsp">Back to Product list</a>
</p>
<form method="post">
    <fieldset>
        <legend>Customer information</legend>
        <table>
            <tr>
                <td>Name Product: </td>
                <td><input type="text" name="name" ></td>
            </tr>
            <tr>
                <td>Price Product: </td>
                <td><input type="text" name="price" ></td>
            </tr>
            <tr>
                <td>Description Product: </td>
                <td><input type="text" name="description" ></td>
            </tr>
            <tr>
                <td>Brand Product: </td>
                <td><input type="text" name="brand" ></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Create Product"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
