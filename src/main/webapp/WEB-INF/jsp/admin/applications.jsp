<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title><spring:message code="title.userApplications"/></title>
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
                    <span style="float: right">
                        <a href="${pageContext.request.contextPath}/admin/applications?lang=en"><spring:message
                                code="label.en"/></a>
                        <a href="${pageContext.request.contextPath}/admin/applications?lang=ru"><spring:message
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
            <th><spring:message code="label.id"/></th>
            <th><spring:message code="label.cruiseArrivalDate"/></th>
            <th><spring:message code="label.cruiseDepartureDate"/></th>
            <th><spring:message code="label.sendingDate"/></th>
            <th><spring:message code="label.userEmail"/></th>
            <th><spring:message code="label.selectRoom"/></th>
        </tr>
        <c:forEach items="${allApplications}" var="appl">
            <form action="${pageContext.request.contextPath}/applications" method="post">
                <tr>
                    <td>${appl.id}</td>
                    <td>${appl.arrivalDate}</td>
                    <td>${appl.departureDate}</td>
                    <td>${appl.sendingDate}</td>
                    <td>${appl.user.email}</td>
                    <td>
                        <select id="rooms" name="Rooms" class="form-control">
                            <option value="top"><spring:message code="label.selectRoom"/></option>
                            <c:forEach items="${rooms}" var="room">
                                <option value="${room.id}">${room.id}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td>
                        <input type="hidden" name="applicationId" value="${appl.id}"/>
                        <input type="hidden" name="action" value="confirm"/>
                        <button type="submit" class="btn btn-success"><spring:message code="button.select"/></button>
                    </td>
                </tr>
            </form>
        </c:forEach>
    </table>
</div>
</body>
</html>