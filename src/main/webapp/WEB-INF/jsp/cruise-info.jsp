<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>${cruise.name}</title>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
</head>

<body>
<div>
    <h2>${cruise.name}</h2>

    <p>Departure date: ${appl.cruise.departureDate}</p>
    <p>Arrival date: ${appl.cruise.arrivalDate}</p>
    <p>Ship: ${cruise.ship.name}</p>
    <p>Price: ${cruise.cruisePrice}</p>

    <p>Ports:</p>
    <ul>
        <c:forEach items="${cruise.getPorts()}" var="port" >
            <li>${port}</li>
        </c:forEach>
    </ul>

</div>

<a href="${pageContext.request.contextPath}/">Main</a>
<a href="${pageContext.request.contextPath}/booking">Cruises</a>
</body>
</html>