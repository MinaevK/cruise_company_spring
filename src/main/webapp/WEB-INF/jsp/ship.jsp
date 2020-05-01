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
<%--<div>
    <form action="${pageContext.request.contextPath}/ship" method="post">
        <div>
            <p>Capacity</p>
            <input name="capacity" placeholder="Capacity"/>
        </div>
        <div>
            <p>Ship name</p>
            <input name="name" placeholder="Name"/>
        </div>
        <button type="submit">Confirm</button>
    </form>

    <a href="/">Main</a>
</div>--%>
<form:form action="ship" method="post" modelAttribute="shipForm">
    <table border="0" cellpadding="5">
        <tr>
            <td>Name: </td>
            <td><form:input path="name" /></td>
        </tr>
        <tr>
            <td>Capacity: </td>
            <td><form:input path="capacity" /></td>
        </tr>
        <tr>
            <td colspan="2"><button type="submit">Save</button></td>
        </tr>
    </table>
</form:form>
</body>
</html>