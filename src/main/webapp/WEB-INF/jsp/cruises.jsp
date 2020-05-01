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
        <thead>Name </thead>
        <thead>Ship </thead>
        <thead>Price </thead>
        <c:forEach items="${allCruises}" var="cruise">
            <tr>
                <td>${cruise.name}</td>
                <td>${cruise.ship.name}</td>
                <td>${cruise.cruisePrice}</td>
                <td>
                    <a href="cruise-edit/${cruise.id}">Edit </a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<div>
    <form:form method="post" modelAttribute="cruiseForm">
    <table border="0" cellpadding="5">
        <tr>
            <td>Name </td>
            <td><form:input path="name" /></td>
        </tr>
        <tr>
            <td>Ship </td>
            <td><select id="ships" name="shipId">
                <option value="top">Select cruise</option>
                <c:forEach items="${ships}" var="ship">
                    <option value="${ship.id}">${ship.name}</option>
                </c:forEach>
            </select>
            </td>
        </tr>
<%--        <tr>
            <td>Ports </td>
            <td>
                <select id="ports" name="ports">
                    <option value="top">Select ports</option>
                    <c:forEach items="${ports}" var="port">
                        <option value="${port}">${port}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>--%>

        <tr>
            <td>Price </td>
            <td><form:input path="cruisePrice" /></td>
        </tr>

        <tr>
            <td colspan="2"><button type="submit">Save</button></td>
        </tr>
    </table>
    <a href="/">Main</a>
</div>
<c:forEach items="${ports}" var="port">
        <tr>
            <td>${port}</td>
            <td>
                <input type="checkbox" name="portsChecked" value="${port}">
                    <%--<button type="button">Add</button>--%>
            </td>
        </tr>
</c:forEach>
</form:form>

</body>
</html>