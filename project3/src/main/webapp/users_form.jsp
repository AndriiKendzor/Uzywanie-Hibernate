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
        <c:if test="${users != null}">
            <form action="update" method="post">
        </c:if>
        <c:if test="${users == null}">
            <form action="insert" method="post">
        </c:if>
        <table border="1" cellpadding="5">
            <caption>
                <h2>
                    <c:if test="${users != null}">
                        Edit users
                    </c:if>
                    <c:if test="${users == null}">
                        Add New users
                    </c:if>
                </h2>
            </caption>
            <c:if test="${users != null}">
                <input type="hidden" name="id" value="<c:out value='${users.id}' />" />
            </c:if>
            <tr>
                <th>Name: </th>
                <td>
                    <input type="text" name="name" value="<c:out value='${users.name}' />" />
                </td>
            </tr>
            <tr>
                <th>Email: </th>
                <td>
                    <input type="text" name="email" value="<c:out value='${users.email}' />" />
                </td>
            </tr>
            <tr>
                <th>Country:</th>
                <td>
                    <input type="text" name="country" value="<c:out value='${users.country}' />" />
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Save" />
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
