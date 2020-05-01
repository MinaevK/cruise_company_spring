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
    <h3>Cabin number ${cabin.number}</h3>
    <table>
        <tr>
            <td>Ship </td>
            <td>Class </td>
            <td>Price </td>
        </tr>
            <tr>
                <td>${cabin.ship.name}</td>
                <td>${cabin.cabinClass}</td>
                <td>${cabin.price}</td>
            </tr>
    </table>
</div>

<div>
    <form:form method="post" modelAttribute="cabinForm">
    <table border="0" cellpadding="5">
        <tr>
            <td>Class </td>
            <td>
                <select id="cabinClasses" name="cabinClass">
                    <option value="${cabin.cabinClass}">${cabin.cabinClass}</option>
                    <c:forEach items="${cabinClasses}" var="cabinClass">
                        <option value="${cabinClass}">${cabinClass}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>

        <tr>
            <td>Price </td>
            <td><input type="text" placeholder="${cabin.price}" path="price"/></td>
        </tr>

        <tr>
            <td colspan="2"><button type="submit">Edit</button></td>
        </tr>
    </table>
    <a href="/">Main</a>
</div>

</form:form>
</body>
</html>