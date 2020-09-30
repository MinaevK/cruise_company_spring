<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
    <title><spring:message code="title.cabins"/></title>
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
                        <a href="${pageContext.request.contextPath}/admin/cabins?lang=en"><spring:message
                                code="label.en"/></a>
                        <a href="${pageContext.request.contextPath}/admin/cabins?lang=ru"><spring:message
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
<div>
    <table class="table table-hover table-bordered">
        <tr>
            <th><spring:message code="label.shipName"/></th>
            <th><spring:message code="label.number"/></th>
            <th><spring:message code="label.class"/></th>
            <th><spring:message code="label.cruisePrice"/></th>
        </tr>
        <c:forEach items="${allCabins}" var="cabin">
            <tr>
                <td>${cabin.ship.name}</td>
                <td>${cabin.number}</td>
                <td>${cabin.cabinClass}</td>
                <td>${cabin.price}</td>
                <td>
                    <a href="/admin/cabin-edit/${cabin.id}" class="btn btn-info" role="button"><spring:message
                            code="button.edit"/> <i class="far fa-edit"></i></a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

<button type="button" class="btn btn-info btn-block" data-toggle="collapse" data-target="#demo"><spring:message
        code="button.addNewCabin"/><i class="fas fa-plus"></i></button>
<div id="demo" class="collapse">
    <form:form method="post" modelAttribute="cabinForm" class="form-inline">
        <h4><spring:message code="label.newCabin"/></h4>
        <div class="container">
            <div class="form-group">
                <label class="control-label col-md-2"><spring:message code="label.number"/>:</label>
                <div class="form-group text-danger ">
                    <form:input path="number"/>
                    <form:errors path="number"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-2"><spring:message code="label.shipName"/>:</label>
                <div class="form-group">
                    <select id="ships" name="shipId">
                        <c:forEach items="${ships}" var="ship">
                            <option value="${ship.id}">${ship.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-2"><spring:message code="label.class"/>:</label>
                <div class="form-group">
                    <select id="cabinClasses" name="cabinClass">
                        <c:forEach items="${cabinClasses}" var="cabinClass">
                            <option value="${cabinClass}">${cabinClass}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-2"><spring:message code="label.cruisePrice"/>:</label>
                <div class="form-group text-danger ">
                    <form:input path="price"/>
                    <form:errors path="price"></form:errors>
                </div>
            </div>

        </div>
        <div class="container">
            <button type="submit" class="btn btn-success"><spring:message code="button.save"/></button>
        </div>
    </form:form>
</div>
</body>
</html>