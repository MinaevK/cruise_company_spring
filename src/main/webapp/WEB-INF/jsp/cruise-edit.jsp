<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Cruises</title>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
</head>

<body>
<div>
<form:form method="post" modelAttribute="cruiseForm">
    <table border="0" cellpadding="5">
        <tr>
            <td>Name </td>
            <td><form:input value="${cruise.name}" path="name" /> </td>
        </tr>
        <tr>
            <td>Ship </td>
            <td>
                <select  id="ships" name="shipId">
                <c:forEach items="${ships}" var="ship">
                    <c:choose>
                        <c:when test="${ship.id == cruise.ship.id}">
                            <option selected value="${ship.id}">${ship.name}</option>
                        </c:when>
                        <c:otherwise>
                            <option value="${ship.id}">${ship.name}</option>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td>
                Departure Date:
            </td>
            <td>
                <form:input type="date" value="${cruise.departureDate}" path="departureDate"/>
            </td>
            <td>
                Arrival Date:
            </td>
            <td><form:input type="date" value="${cruise.arrivalDate}" path="arrivalDate"/></td>
        </tr>
        <tr>
            <td>Price </td>
            <td><form:input value="${cruise.cruisePrice}" path="cruisePrice" /></td>
        </tr>
        <table>
            <thead>Ports:</thead>
            <c:forEach items="${ports}" var="port">
                <tr>
                    <td>${port}</td>
                    <td>
                        <c:choose>
                            <c:when test="${cruise.getPorts().contains(port)}">
                                <input checked type="checkbox" name="portsChecked" value="${port}">
                            </c:when>
                            <c:otherwise>
                                <input type="checkbox" name="portsChecked" value="${port}">
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <button type="submit">Edit</button>
    </table>
    </div>
</form:form>
<a href="/">Main</a>
</body>
</html>