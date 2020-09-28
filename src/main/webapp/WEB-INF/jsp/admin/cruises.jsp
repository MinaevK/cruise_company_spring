<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>

    <title>Cruises</title>
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
    <div class="container">
        <h1>Cruises</h1>
        <table class="table table-hover table-bordered">
            <tr>
                <th>Name </th>
                <th>Ship </th>
                <th>Price </th>
                <th>Departure date</th>
                <th>Arrival date</th>
            </tr>
            <c:forEach items="${allCruises}" var="cruise">
                <tr>
                    <td>${cruise.name}</td>
                    <td>${cruise.ship.name}</td>
                    <td>${cruise.cruisePrice}</td>
                    <td>${cruise.departureDate}</td>
                    <td>${cruise.arrivalDate}</td>
                    <td>
                        <a href="/admin/cruise-edit/${cruise.id}"  class="btn btn-info" role="button">Edit <i class="far fa-edit"></i></a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <button type="button" class="btn btn-info btn-block" data-toggle="collapse" data-target="#demo">Add new cruise <i class="fas fa-plus"></i></button>
    <div id="demo" class="collapse" style="padding-top: 2%">
        <h4>New cruise: </h4>
        <form:form method="post" modelAttribute="cruiseForm" class="form-inline">
            <div class="container">
                <div class="form-group">
                    <label for="name" class="control-label col-md-2">Name:</label>
                    <div class="form-group text-danger ">
                        <form:input path="name"  class="form-control" id="nameValid"/>
                        <form:errors path="name"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">Ship:</label>
                    <select id="ships" name="shipId" class="form-control">
                        <c:forEach items="${ships}" var="ship">
                            <option value="${ship.id}">${ship.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">Price:</label>
                    <div class="form-group text-danger ">
                        <form:input path="cruisePrice" class="form-control" />
                        <form:errors path="cruisePrice"></form:errors>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">Departure Date:</label>
                    <form:input type="date" path="departureDate"/>
                    <label class="control-label col-md-3">Arrival Date:</label>
                    <form:input type="date" path="arrivalDate"/>
                    <div class="form-group text-danger " style="padding-left: 1%"><form:errors/></div>
                </div>
            </div>

            <div class="container" style="padding-top: 2%">
                <h4>Select ports: </h4>
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
            <div><button type="submit" class="btn btn-success">Save</button></div>
        </form:form>

    </div>
</div>

</body>
</html>