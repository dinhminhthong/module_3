<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2/14/2023
  Time: 6:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/bootstrap.min.js"></script>
<html>
<head>
  <title>User List</title>
</head>
<body>
<h1 style="text-align: center">USERS</h1>
<button style="background: green"><a href="/User?action=create">Create User</a></button>

<p>
  <a href="/User?action=sort">Sort By Name User</a>
</p>

<form action="/User?action=search" method="post">
  <input type="text" name="search">
  <button type="submit">Search</button>
  <table class="table table-striped">
    <tr>
      <td>ID</td>
      <td>Name</td>
      <td>Email</td>
      <td>Country</td>
      <td>Edit</td>
      <td>Delete</td>
    </tr>
    <c:forEach var="user" items="${userList}">
      <tr>
        <td><a href="/User?action=view&id=${user.getId()}">${user.getId()}</a></td>
        <td>${user.getName()}</td>
        <td>${user.getEmail()}</td>
        <td>${user.getCountry()}</td>
        <td><a href="/User?action=edit&id=${user.getId()}">Edit</a></td>
        <td><a href="/User?action=delete&id=${user.getId()}">Delete</a></td>
      </tr>
    </c:forEach>
  </table>
</form>
</body>

</html>