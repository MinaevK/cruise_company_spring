<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Booking</title>
</head>

<body>
<div>
    <table>
        <thead>
        <th>Cruise</th>
        <th>Price</th>
        <th>Departure Date</th>
        <th>Arrival Date</th>
        </thead>
        <c:forEach items="${cruises}" var="cruise">
            <tr>
                <td>${cruise.name}</td>
                <td>${cruise.cruisePrice}</td>
                <td>${cruise.departureDate}</td>
                <td>${cruise.arrivalDate}</td>
                <td>
                    <a href="booking-cabin/${cruise.id}"> Select </a>
                </td>

            </tr>
        </c:forEach>
    </table>
</body>
</html>