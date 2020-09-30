<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<!DOCTYPE html>
<html>
<head>
    <title><spring:message code="title.myApplication"/></title>
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
<div>
    <nav class="navbar header-top navbar-expand-lg">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="/"><spring:message code="label.mainName"/></a>
            </div>
            <ul class="nav navbar-nav navbar-right">
                <li class="nav-item" style="padding-right: 10px">
                    <span style="float: right">
                        <a href="${pageContext.request.contextPath}/user/user-applications?lang=en"><spring:message
                                code="label.en"/></a>
                        <a href="${pageContext.request.contextPath}/user/user-applications?lang=ru"><spring:message
                                code="label.ru"/></a>
                    </span>
                </li>
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
    <h4><spring:message code="label.myApplications"/></h4>
    <div class="container">
        <table class="table table-hover table-bordered">
            <thead>
            <th><spring:message code="label.cruiseName"/></th>
            <th><spring:message code="label.cruiseDepartureDate"/></th>
            <th><spring:message code="label.cruiseArrivalDate"/></th>
            <th><spring:message code="label.shipName"/></th>
            <th><spring:message code="label.room"/></th>
            <th><spring:message code="label.cruisePrice"/></th>
            <th><spring:message code="label.paid"/></th>
            </thead>
            <c:forEach items="${userApplications}" var="appl">
            <tr>
                <td>${appl.cruise.name}</td>
                <td>${appl.cruise.departureDate}</td>
                <td>${appl.cruise.arrivalDate}</td>
                <td>${appl.ship.name}</td>
                <td>${appl.cabin.number}</td>
                <td>${appl.price}</td>
                <c:choose>
                <c:when test="${appl.paid == true}">
                <td class="text-success"><spring:message code="label.paid"/></td>
                </c:when>
                <c:otherwise>
                <td class="text-secondary"><spring:message code="label.notPaid"/></td>
                </c:otherwise>
                </c:choose>
                </c:forEach>
        </table>
    </div>
</div>
</body>
</html>