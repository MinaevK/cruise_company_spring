<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<!DOCTYPE html>
<html>
<head>
    <title><spring:message code="title.allApplications"/></title>
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
                    <span style="float: right">
                        <a href="${pageContext.request.contextPath}/admin/all-applications?lang=en"><spring:message
                                code="label.en"/></a>
                        <a href="${pageContext.request.contextPath}/admin/all-applications?lang=ru"><spring:message
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

<div class="container">
    <table class="table table-hover table-bordered">
        <tr>
            <th><spring:message code="label.cruiseName"/></th>
            <th><spring:message code="label.cruiseDepartureDate"/></th>
            <th><spring:message code="label.cruiseArrivalDate"/></th>
            <th><spring:message code="label.username"/></th>
            <th><spring:message code="label.shipName"/></th>
            <th><spring:message code="label.room"/></th>
            <th><spring:message code="label.applicationDate"/></th>
            <th><spring:message code="label.cruisePrice"/></th>
            <th><spring:message code="button.confirm"/></th>
        </tr>
        <c:forEach items="${allApplications}" var="appl">
            <tr>
                <td>${appl.cruise.name}</td>
                <td>${appl.cruise.departureDate}</td>
                <td>${appl.cruise.arrivalDate}</td>
                <td>${appl.user.username}</td>
                <td>${appl.ship.name}</td>
                <td>${appl.cabin.number}</td>
                <td>${appl.applicationDate}</td>
                <td>${appl.price}</td>
                <td>
                    <c:choose>
                        <c:when test="${appl.paid == false}">
                            <form action="${pageContext.request.contextPath}" method="post">
                                <input type="hidden" name="userId" value="${appl.id}"/>
                                <button type="submit" class="btn btn-success"><spring:message
                                        code="button.confirm"/></button>
                            </form>
                        </c:when>
                        <c:otherwise>
                            <button type="submit" class="btn" disabled><spring:message code="label.confirmed"/></button>
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>