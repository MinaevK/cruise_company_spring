<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<!DOCTYPE html>
<html>
<head>
    <title>${cruise.name}</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
          integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>

<body>
<nav class="navbar header-top navbar-expand-lg">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="/"><spring:message code="label.mainName"/></a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li class="nav-item">
                <p>${pageContext.request.userPrincipal.name} </p>
            </li>
            <li class="nav-item">
                <a href="${pageContext.request.contextPath}/logout"><spring:message code="button.logout"/> <i
                        class="fas fa-sign-out-alt"></i> </a>
            </li>
        </ul>
    </div>
</nav>
<h3>${cruise.name}</h3>
<div class="container">


    <p><spring:message code="label.cruiseDepartureDate"/>: ${cruise.departureDate}</p>
    <p><spring:message code="label.cruiseArrivalDate"/>: ${cruise.arrivalDate}</p>
    <p><spring:message code="label.shipName"/>: ${cruise.ship.name}</p>
    <p><spring:message code="label.cruisePrice"/>: ${cruise.cruisePrice}</p>

    <h5><spring:message code="label.cruisePrice"/>:</h5>
    <ul>
        <c:forEach items="${cruise.getPorts()}" var="port">
            <li>${port}</li>
        </c:forEach>
    </ul>

</div>
</body>
</html>