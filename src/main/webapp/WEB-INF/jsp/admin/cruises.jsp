<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>

    <title><spring:message code="title.cruises"/></title>
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
                        <a href="${pageContext.request.contextPath}/admin/cruises?lang=en"><spring:message
                                code="label.en"/></a>
                        <a href="${pageContext.request.contextPath}/admin/cruises?lang=ru"><spring:message
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
    <div class="container">
        <h1><spring:message code="label.cruises"/></h1>
        <table class="table table-hover table-bordered">
            <tr>
                <th><spring:message code="label.cruiseName"/></th>
                <th><spring:message code="label.shipName"/></th>
                <th><spring:message code="label.cruisePrice"/></th>
                <th><spring:message code="label.cruiseDepartureDate"/></th>
                <th><spring:message code="label.cruiseArrivalDate"/></th>
            </tr>
            <c:forEach items="${allCruises}" var="cruise">
                <tr>
                    <td>${cruise.name}</td>
                    <td>${cruise.ship.name}</td>
                    <td>${cruise.cruisePrice}</td>
                    <td>${cruise.departureDate}</td>
                    <td>${cruise.arrivalDate}</td>
                    <td>
                        <a href="/admin/cruise-edit/${cruise.id}" class="btn btn-info" role="button"><spring:message
                                code="button.edit"/> <i class="far fa-edit"></i></a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <button type="button" class="btn btn-info btn-block" data-toggle="collapse" data-target="#demo"><spring:message
            code="button.Add"/><i class="fas fa-plus"></i></button>
    <div id="demo" class="collapse" style="padding-top: 2%">
        <h4><spring:message code="label.newCruise"/></h4>
        <form:form method="post" modelAttribute="cruiseForm" class="form-inline">
            <div class="container">
                <div class="form-group">
                    <label for="name" class="control-label col-md-2"><spring:message code="label.cruiseName"/>:</label>
                    <div class="form-group text-danger ">
                        <form:input path="name" class="form-control" id="nameValid"/>
                        <form:errors path="name"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2"><spring:message code="label.shipName"/>:</label>
                    <select id="ships" name="shipId" class="form-control">
                        <c:forEach items="${ships}" var="ship">
                            <option value="${ship.id}">${ship.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2"><spring:message code="label.cruisePrice"/>:</label>
                    <div class="form-group text-danger ">
                        <form:input path="cruisePrice" class="form-control"/>
                        <form:errors path="cruisePrice"></form:errors>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2"><spring:message code="label.cruiseDepartureDate"/>:</label>
                    <form:input type="date" path="departureDate"/>
                    <label class="control-label col-md-3"><spring:message code="label.cruiseArrivalDate"/>:</label>
                    <form:input type="date" path="arrivalDate"/>
                    <div class="form-group text-danger " style="padding-left: 1%"><form:errors/></div>
                </div>
            </div>

            <div class="container" style="padding-top: 2%">
                <h4><spring:message code="label.selectPorts"/>: </h4>
                <table class="table">
                    <c:forEach items="${ports}" var="port">
                        <tr>
                            <td width="20">${port}</td>
                            <td>
                                <input type="checkbox" name="portsChecked" value="${port}">
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <br>
            <div>
                <button type="submit" class="btn btn-success"><spring:message code="button.save"/></button>
            </div>
        </form:form>

    </div>
</div>

</body>
</html>