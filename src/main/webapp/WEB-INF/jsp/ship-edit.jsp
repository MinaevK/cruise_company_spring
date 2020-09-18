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
<h2>${ship.name}</h2>
<form:form method="post" modelAttribute="ship">
    <table>
        <tr>
            <td>Name: </td>
            <td><form:input path="name" value="${ship.name}" /></td>
        </tr>
        <tr>
            <td>Capacity: </td>
            <td><form:input path="capacity" value="${ship.capacity}"/></td>
        </tr>
        <tr>
            <td><button type="submit">Edit</button></td>
        </tr>
    </table>
</form:form>
</body>
</html>