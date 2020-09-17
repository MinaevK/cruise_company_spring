<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Cabin ${cabin.number} edit</title>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
</head>

<body>
<div>
    <h3>Cabin ${cabin.number}, ${cabin.ship.name}</h3>
</div>

<div>
    <form:form method="post" modelAttribute="cabinForm">
        <p>Class
            <select id="cabinClasses" name="cabinClass">
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
        </p>
        <p>Price: <input type="text" value="${cabin.price}" path="price"/>
        </p>

        <button type="submit">Edit</button><br>
    <a href="/">Main</a>
</div>

</form:form>
</body>
</html>