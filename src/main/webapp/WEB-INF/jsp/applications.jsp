<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Log in with your account</title>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
</head>

<body>
<div>
    <table>
        <thead>
        <th>ID</th>
        <th>Arrival Date</th>
        <th>Departure Date</th>
        <th>Sending Date</th>
        <th>User email</th>
        <th>Select room</th>
        </thead>
        <c:forEach items="${allApplications}" var="appl">
            <form action="${pageContext.request.contextPath}/applications" method="post">
                <tr>
                    <td>${appl.id}</td>
                    <td>${appl.arrivalDate}</td>
                    <td>${appl.departureDate}</td>
                    <td>${appl.sendingDate}</td>
                    <td>${appl.user.email}</td>
                    <td>
                        <select id="rooms" name="Rooms">
                            <option value="top">Select room</option>
                            <c:forEach items="${rooms}" var="room">
                                <option value="${room.id}">${room.id}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td>
                            <input type="hidden" name="applicationId" value="${appl.id}"/>
                            <input type="hidden" name="action" value="confirm"/>
                            <button type="submit">Confirm</button>
                    </td>
                </tr>
            </form>
        </c:forEach>
    </table>
    <a href="/">Main</a>
</div>
<%--<div>
    <table>
        <thead>
        <th>ID</th>
        <th>cost</th>
        </thead>
        <c:forEach items="${rooms}" var="room">
            <tr>
                <td>${room.id}</td>
                <td>${room.costPerDay}</td>
            </tr>
        </c:forEach>
    </table>

</div>--%>
</body>
</html>