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
    <h2>${cruise.name} (${cruise.departureDate} - ${cruise.arrivalDate})</h2>
    <h3>${cruise.ship.name}</h3>
    <table>
        <thead>
        <th>Number</th>
        <th>Class</th>
        <th>Price</th>
        </thead>
        <c:forEach items="${cabins}" var="cabin">
            <tr>
                <td>${cabin.number}</td>
                <td>${cabin.cabinClass}</td>
                <td>${cabin.price}</td>
                <td>
                    <form:form method="post" modelAttribute="bookingForm">
                        <input type="hidden" name="cabin" value="${cabin.id}"/>
                        <input type="hidden" name="cruise" value="${cruise.id}"/>
                        <input type="hidden" name="ship" value="${cruise.ship.id}"/>
                        <input type="hidden" name="cruisePrice" value="${cruise.cruisePrice}"/>
                        <input type="hidden" name="cabinPrice" value="${cabin.price}"/>
                        <button type="submit">Book</button>
                    </form>
                </td>
                </form:form>
            </tr>
        </c:forEach>
    </table>
</body>
</html>