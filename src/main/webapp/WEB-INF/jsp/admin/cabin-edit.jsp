<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<!DOCTYPE html>
<html>
<head>
    <title><spring:message code="title.cabin"/> ${cabin.number} edit</title>
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
    <h3><spring:message code="label.cabin"/> ${cabin.number}, ${cabin.ship.name}</h3>
    <div>
        <form:form method="post" modelAttribute="cabinForm" class="form-inline">
        <div class="container">
            <div class="form-group">
                <label class="control-label col-md-2"><spring:message code="label.number"/>:</label>
                <label class="control-label col-md-2">${cabin.ship.id}</label>
            </div>
            <div class="form-group">
                <label class="control-label col-md-2"><spring:message code="label.class"/>:</label>
                <select id="cabinClasses" name="cabinClass" class="form-control">
                    <c:forEach items="${cabinClasses}" var="cabinClass">
                        <c:choose>
                            <c:when test="${cabinClass == cabin.cabinClass}">
                                <option selected value="${cabinClass}">${cabinClass}</option>
                            </c:when>
                            <c:otherwise>
                                <option value="${cabinClass}">${cabinClass}</option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label class="control-label col-md-2">Price:</label>
                <div class="form-group text-danger ">
                    <td><form:input type="text" value="${cabin.price}" path="price"/></td>
                    <td><form:errors path="price"/></td>
                </div>
            </div>
            <button type="submit" class="btn btn-success"><spring:message code="button.edit"/></button>
            <br>
        </div>
        <input type="hidden" name="shipId" value="${cabin.ship.id}"/>
    </div>
    </form:form>
</div>
</body>
</html>