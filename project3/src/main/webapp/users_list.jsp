<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Management Application</title>
</head>
<body>
    <center>
        <h1>User Management</h1>
        <h2>
            <a href="new">Add New User</a>
            &nbsp;&nbsp;&nbsp;
            <a href="list">List All Users</a>
        </h2>
    </center>
    <div align="center">
        <table border="1" cellpadding="5">
            <caption><h2>List of Users</h2></caption>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Country</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="user" items="${listUsers}">
                <tr>
                    <td><c:out value="${users.id}" /></td>
                    <td><c:out value="${users.name}" /></td>
                    <td><c:out value="${users.email}" /></td>
                    <td><c:out value="${users.country}" /></td>
                    <td>
                        <a href="edit?id=<c:out value='${users.id}' />">Edit</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="delete?id=<c:out value='${users.id}' />">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div> 
</body>
</html>
