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
        <thead>Ship </thead>
        <thead>Number </thead>
        <thead>Class </thead>
        <thead>Price </thead>
    <c:forEach items="${allCabins}" var="cabin">
            <tr>
                <td>${cabin.ship.name}</td>
                <td>${cabin.number}</td>
                <td>${cabin.cabinClass}</td>
                <td>${cabin.price}</td>
                <td>
                    <a href="cabin-edit/${cabin.id}">Edit </a>
                </td>
            </tr>
    </c:forEach>
    </table>
</div>

<div>
    <form:form method="post" modelAttribute="cabinForm">
        <table border="0" cellpadding="5">
            <tr>
                <td>Number</td>
                <td><form:input path="number" /></td>
            </tr>
            <tr>
                <td>Ship </td>
                <td><select id="ships" name="shipId">
                        <c:forEach items="${ships}" var="ship">
                            <option value="${ship.id}">${ship.name}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Class </td>
                <td>
                    <select id="cabinClasses" name="cabinClass">
                        <c:forEach items="${cabinClasses}" var="cabinClass">
                            <option value="${cabinClass}">${cabinClass}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Price </td>
                <td><form:input path="price" /></td>
            </tr>

            <tr>
                <td><button type="submit">Save</button></td>
            </tr>
        </table>
    <a href="/">Main</a>
</div>

</form:form>
</body>
</html>