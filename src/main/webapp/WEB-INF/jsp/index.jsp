<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<%@ page session = "true"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE HTML>

<html lang = "${sessionScope.lang}">
<head>
    <title>Main</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>
<body>

<sec:authorize access="isAuthenticated()">
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
                    <a href="${pageContext.request.contextPath}/logout"><fmt:message key="button.logout"/> <i class="fas fa-sign-out-alt"></i>   </a>
                </li>
            </ul>
        </div>
    </nav>
</sec:authorize>
<h4>Hello,
    <sec:authorize access="!isAuthenticated()">
        guest, please login, or registrate
    </sec:authorize>
    <sec:authorize access="isAuthenticated()">
        ${pageContext.request.userPrincipal.name}
    </sec:authorize>
</h4>
<div class="row">
    <div class="col-md-4">
        <div class="panel-body">
        <ul class="list-group">
            <sec:authorize access="!isAuthenticated()">
                <li class="list-group-item"><a href="${pageContext.request.contextPath}/login">Login</a></li>
                <li class="list-group-item"><a href="${pageContext.request.contextPath}/registration">Registrate</a></li>
            </sec:authorize>
            <sec:authorize access="hasRole('ROLE_ADMIN') and isAuthenticated()">
                <li class="list-group-item"><a href="${pageContext.request.contextPath}/admin/admin" >Users</a></li>
                <li class="list-group-item"><a href="${pageContext.request.contextPath}/admin/all-applications">All Applications</a></li>
                <li class="list-group-item"><a href="${pageContext.request.contextPath}/admin/cruises">Cruises editing</a></li>
                <li class="list-group-item"><a href="${pageContext.request.contextPath}/admin/ships">Ships editing</a></li>
                <li class="list-group-item"><a href="${pageContext.request.contextPath}/admin/cabins">Cabins editing</a></li>
            </sec:authorize>
            <sec:authorize access="hasRole('ROLE_USER') and isAuthenticated()">
                <li class="list-group-item"><a href="${pageContext.request.contextPath}/user/booking">Booking</a></li>
                <li class="list-group-item"><a href="${pageContext.request.contextPath}/user/user-applications">My Applications</a></li>
            </sec:authorize>
        </ul>
        </div>
    </div>
    <div class="container col-md-8">
        <div class="container">
            <table class="table table-hover table-bordered">
                <h4 class="text-center">All cruises</h4>
                <thead class="thead-dark">
                    <th>Cruise</th>
                    <th>Price</th>
                    <th>Departure Date</th>
                    <th>Arrival Date</th>
                </thead>
                <c:forEach items="${allCruises}" var="cruise">
                    <tr>
                        <td><a href="/cruise-info/${cruise.id}">${cruise.name}</a></td>
                        <td>${cruise.cruisePrice}</td>
                        <td>${cruise.departureDate}</td>
                        <td>${cruise.arrivalDate}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>

</body>
</html>