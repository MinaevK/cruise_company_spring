<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
    <title><spring:message code="title.cabinBooking"/></title>
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
            <li class="nav-item" style="padding-right: 10px">
                <p>${pageContext.request.userPrincipal.name} </p>
            </li>
            <li class="nav-item">
                <a href="${pageContext.request.contextPath}/logout"><spring:message code="button.logout"/><i
                        class="fas fa-sign-out-alt"></i> </a>
            </li>
        </ul>
    </div>
</nav>
<div class="container">
    <h2>${cruise.name} (${cruise.departureDate} - ${cruise.arrivalDate})</h2>
    <h4>Ship: ${cruise.ship.name}</h4>
    <table class="table table-hover table-bordered">
        <thead>
        <th><spring:message code="label.number"/></th>
        <th><spring:message code="label.class"/></th>
        <th><spring:message code="label.cruisePrice"/></th>
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
                    <button type="submit" class="btn btn-success"><spring:message code="button.book"/></button>
                    </form>
                </td>
                </form:form>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>