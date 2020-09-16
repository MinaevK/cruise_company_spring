<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>My applications</title>
</head>
<body>
<div>
    <h2>My applications</h2>

    <div>
        <table>
            <thead>
            <th>Cruise Name</th>
            <th>Departure Date</th>
            <th>Arrival Date</th>
            <th>Ship</th>
            <th>Room</th>
            <th>Paid</th>
            </thead>
            <c:forEach items="${userApplications}" var="appl">
                <tr>
                    <td>${appl.cruise.name}</td>
                    <td>${appl.cruise.departureDate}</td>
                    <td>${appl.cruise.arrivalDate}</td>
                    <td>${appl.ship.name}</td>
                    <td>${appl.cabin.number}</td>
                    <td><c:choose>
                        <c:when test="${appl.paid == true}">
                            Paid
                        </c:when>
                        <c:otherwise>
                            Not paid
                        </c:otherwise>
                    </c:choose>
                </tr>
            </c:forEach>
        </table>
    </div>

    <a href="/">Main</a>
</div>
</body>
</html>