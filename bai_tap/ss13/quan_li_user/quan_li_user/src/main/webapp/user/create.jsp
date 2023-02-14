<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2/14/2023
  Time: 6:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Create User</title>
</head>
<body>
<h1>Create New User</h1>

<p>
  <c:if test='${requestScope["message"] != null}'>
    <span class="message">${requestScope["message"]}</span>
  </c:if>
</p>
<p>
  <a href="/User">Back To User List</a>
</p>
<form action="/User?action=create" method="post">
  <fieldset>
    <legend> User Information</legend>
    <table>
      <tr>
        <td>Name</td>
        <td><input type="text" name="name"></td>
      </tr>
      <tr>
        <td>Email</td>
        <td><input type="text" name="email"></td>
      </tr>
      <tr>
        <td>country</td>
        <td><input type="text" name="country"></td>
      </tr>
      <tr>
        <td></td>
        <td><button type="submit" value="Create user">Create User </button></td>
      </tr>
    </table>
  </fieldset>
</form>
</body>
</html>