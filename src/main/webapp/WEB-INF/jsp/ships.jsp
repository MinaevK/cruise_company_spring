<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Log in with your account</title>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
</head>

<body>
<div>
    <table>
        <th>Name </th>
        <th>Capacity </th>
        <c:forEach items="${ships}" var="ship">
            <tr>
                <td>${ship.name}</td>
                <td>${ship.capacity}</td>
                <td>
                    <a href="ship-edit/${ship.id}">Edit </a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<form:form method="post" modelAttribute="shipForm">
    <table>
        <tr>
            <td>Name: </td>
            <td><form:input path="name" /></td>
        </tr>
        <tr>
            <td>Capacity: </td>
            <td><form:input path="capacity" /></td>
        </tr>
        <tr>
            <td><button type="submit">Save</button></td>
        </tr>
    </table>
</form:form>
<a href="${pageContext.request.contextPath}/">Main</a>
</body>
</html>