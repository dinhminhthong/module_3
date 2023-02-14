<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2/14/2023
  Time: 6:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Edit Users</title>
</head>
<body>
<h1>Edit Users</h1>
<p>
  <c:if test='${requestScope["message"] != null}'>
    <span class="message">${requestScope["message"]}</span>
  </c:if>
</p>
<p>
  <a href="/User"> Back To List Users</a>
</p>
<form action="/User?action=edit" method="post">
  <fieldset>
    <legend>User Information</legend>
    <table>
      <tr>
        <td>Name</td>
        <td><input type="hidden" name="id" value="${users.getId()}"></td>
      </tr>
      <tr>
        <td>Name</td>
        <td><input type="text" name="name" value="${users.getName()}"></td>
      </tr>
      <tr>
        <td>Email</td>
        <td><input type="text" name="email" value="${users.getEmail()}"></td>
      </tr>
      <tr>
        <td>Country</td>
        <td><input type="text" name="country" value="${users.getCountry()}"></td>
      </tr>
      <tr>
        <td></td>
        <td><button type="submit">Edit User</button></td>
      </tr>
    </table>
  </fieldset>
</form>
</body>
</html>