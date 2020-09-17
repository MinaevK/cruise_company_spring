<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>Main</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
</head>
<body>
<div>
    <h3>Hello, ${pageContext.request.userPrincipal.name}</h3>
    <sec:authorize access="!isAuthenticated()">
        <h4><a href="${pageContext.request.contextPath}/login">Login</a></h4>
        <h4><a href="${pageContext.request.contextPath}/registration">Registrate</a></h4>
    </sec:authorize>
    <sec:authorize access="isAuthenticated()">
        <h4><a href="${pageContext.request.contextPath}/logout">Logout</a></h4>
    </sec:authorize>
    <sec:authorize access="hasRole('ROLE_ADMIN') and isAuthenticated()">
        <h4><a href="${pageContext.request.contextPath}/admin">Users</a></h4>
        <h4><a href="${pageContext.request.contextPath}/all-applications">All Applications</a></h4>
        <h4><a href="${pageContext.request.contextPath}/cruises">Cruises editing</a></h4>
        <h4><a href="${pageContext.request.contextPath}/ship">Ships editing</a></h4>
        <h4><a href="${pageContext.request.contextPath}/cabins">Cabins editing</a></h4>
    </sec:authorize>
    <sec:authorize access="hasRole('ROLE_USER') and isAuthenticated()">
        <h4><a href="${pageContext.request.contextPath}/booking">Booking</a></h4>
        <h4><a href="${pageContext.request.contextPath}/user-applications">My Applications</a></h4>
    </sec:authorize>




</div>
</body>
</html>