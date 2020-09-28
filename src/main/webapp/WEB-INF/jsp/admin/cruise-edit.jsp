<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Cruise: ${cruise.name}</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>

<body>
<nav class="navbar header-top navbar-expand-lg" >
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="/">Cruise booking</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li class="nav-item">
                <p>${pageContext.request.userPrincipal.name}  </p>
            </li>
            <li class="nav-item">
                <a href="${pageContext.request.contextPath}/logout">Logout <i class="fas fa-sign-out-alt"></i>   </a>
            </li>
        </ul>
    </div>
</nav>
<div class="container">
    <h3>Edit ${cruise.name}</h3>
<form:form method="post" modelAttribute="cruiseForm" class="form-inline">
    <div class="container">
        <div class="form-group">
            <label class="control-label col-md-2">Name:</label>
            <div class="form-group text-danger ">
                <form:input value="${cruise.name}" path="name" />
                <form:errors path="name"/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-2">Ship:</label>
            <div class="form-group">
                <select  id="ships" name="shipId">
                    <c:forEach items="${ships}" var="ship">
                        <c:choose>
                            <c:when test="${ship.id == cruise.ship.id}">
                                <option selected value="${ship.id}">${ship.name}</option>
                            </c:when>
                            <c:otherwise>
                                <option value="${ship.id}">${ship.name}</option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </select>
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-md-2">Departure Date:</label>
            <form:input type="date" value="${cruise.departureDate}" path="departureDate"/>
            <label class="control-label col-md-3">Arrival Date:</label>
            <form:input type="date" value="${cruise.arrivalDate}" path="arrivalDate"/>
            <div class="form-group text-danger " style="padding-left: 1%"><form:errors/></div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-2">Price:</label>
            <div class="form-group text-danger ">
                <form:input value="${cruise.cruisePrice}" path="cruisePrice" />
                <form:errors path="cruisePrice"/>
            </div>
        </div>
        <table class="table">
            <h5>Ports: </h5>
            <c:forEach items="${ports}" var="port">
                <tr>
                    <td width="20">${port}</td>
                    <td>
                        <c:choose>
                            <c:when test="${cruise.getPorts().contains(port)}">
                                <input checked type="checkbox" name="portsChecked" value="${port}">
                            </c:when>
                            <c:otherwise>
                                <input type="checkbox" name="portsChecked" value="${port}">
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <button type="submit" class="btn btn-success">Edit</button>

    </div>

    </div>
</form:form>
</body>
</html>