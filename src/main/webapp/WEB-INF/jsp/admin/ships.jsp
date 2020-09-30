<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<!DOCTYPE html>
<html>
<head>
    <title>Ships</title>
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
                        <a href="${pageContext.request.contextPath}/admin/ships?lang=en"><spring:message
                                code="label.en"/></a>
                        <a href="${pageContext.request.contextPath}/admin/ships?lang=ru"><spring:message
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
    <h4><spring:message code="label.ships"/></h4>
    <table class="table table-hover table-bordered">
        <th><spring:message code="label.shipEditName"/></th>
        <th><spring:message code="label.capacity"/></th>
        <c:forEach items="${ships}" var="ship">
            <tr>
                <td>${ship.name}</td>
                <td>${ship.capacity}</td>
                <td>
                    <a href="/admin/ship-edit/${ship.id}" class="btn btn-info" role="button"><spring:message
                            code="button.edit"/> <i class="far fa-edit"></i></a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <button type="button" class="btn btn-info btn-block" data-toggle="collapse" data-target="#demo"><spring:message
            code="button.addNewShip"/><i class="fas fa-plus"></i></button>
    <div id="demo" class="collapse container">
        <form:form method="post" modelAttribute="shipForm">
            <h4><spring:message code="label.newShip"/></h4>
            <div class="container">
                <div class="form-group">
                    <label class="control-label col-md-2"><spring:message code="label.shipEditName"/>:</label>
                    <div class="form-group text-danger ">
                        <form:input path="name"/>
                        <form:errors path="name"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-2"><spring:message code="label.capacity"/>:</label>
                    <div class="form-group text-danger ">
                        <form:input path="capacity"/>
                        <form:errors path="capacity"/>
                    </div>
                </div>
                <button type="submit" class="btn btn-success"><spring:message code="button.save"/></button>
            </div>
        </form:form>
    </div>
</div>
</body>
</html>