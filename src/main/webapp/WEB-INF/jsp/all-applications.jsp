<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>All applications</title>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
</head>

<body>
<div>
    <table>
        <thead>
        <th>Cruise Name</th>
        <th>Departure Date</th>
        <th>Arrival Date</th>
        <th>User name</th>
        <th>Ship</th>
        <th>Room</th>
        </thead>
        <c:forEach items="${allApplications}" var="appl">
            <tr>
                <td>${appl.cruise.name}</td>
                <td>${appl.cruise.departureDate}</td>
                <td>${appl.cruise.arrivalDate}</td>
                <td>${appl.user.username}</td>
                <td>${appl.ship.name}</td>
                <td>${appl.cabin.number}</td>
                <td>
                    <c:choose>
                        <c:when test ="${appl.paid == false}">
                            <form action="${pageContext.request.contextPath}" method="post">
                                <input type="hidden" name="userId" value="${appl.id}"/>
                                <button type="submit">Confirm</button>
                            </form>
                        </c:when>
                        <c:otherwise>
                            <button type="submit" disabled>Confirm</button>
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
    </table>
    <a href="/">Main</a>
</div>
<%--<div>
    <table>
        <thead>
        <th>ID</th>
        <th>cost</th>
        </thead>
        <c:forEach items="${rooms}" var="room">
            <tr>
                <td>${room.id}</td>
                <td>${room.costPerDay}</td>
            </tr>
        </c:forEach>
    </table>

</div>--%>
</body>
</html>