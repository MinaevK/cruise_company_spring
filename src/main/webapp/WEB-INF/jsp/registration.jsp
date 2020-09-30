<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
    <title><spring:message code="title.registration"/></title>
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
<div class="container d-flex justify-content-center form_container">
    <form:form method="POST" modelAttribute="userForm">
    <h2><spring:message code="title.registration"/></h2>
    <div class="text-danger">
        <form:input type="text" path="username" placeholder="Name" autofocus="true"></form:input>
        <form:errors path="username"/>


    </div>
    <div class="text-danger">
        <form:input type="text" path="email" placeholder="Email" autofocus="true"></form:input>
        <form:errors path="email"></form:errors>
            ${emailError}
    </div>
    <div class="text-danger">
        <form:input type="password" path="password" placeholder="Password"></form:input>
        <form:errors path="password"></form:errors>
            ${passwordError}
    </div>
    <div>
        <form:input type="password" path="passwordConfirm" placeholder=""></form:input>

    </div>
    <div class="d-flex justify-content-center mt-3 login_container">
        <button type="submit" class="btn btn-primary btn-block"><spring:message code="button.registrate"/></button>
    </div>
    </form>
</div>

<div class="mt-4">
    <div class="d-flex justify-content-center links">
        <spring:message code="label.alreadyHaveAccount"/> <a href="/login"><spring:message code="button.login"/></a>
    </div>
</div>
</form:form>
</div>
</body>
</html>