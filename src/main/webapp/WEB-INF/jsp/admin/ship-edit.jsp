<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>${shipForm.name}  editing</title>
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
<h4>${shipForm.name}</h4>
    <div id="demo" class="container">

    <form:form method="post" modelAttribute="shipForm">
        <div class="container">
            <div class="form-group">
                <label class="control-label col-md-2">Name:</label>
                <div class="form-group text-danger ">
                    <form:input path="name" value="${shipForm.name}" />
                    <form:errors path="name"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-2">Capacity:</label>
                <div class="form-group text-danger ">
                    <form:input path="capacity" value="${shipForm.capacity}"/>
                    <form:errors path="capacity"/>
                </div>
            </div>
            <td><button type="submit" class="btn btn-success ">Edit</button></td>
        </div>
</form:form>
</div>
</div>
</body>
</html>