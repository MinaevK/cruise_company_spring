<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>My applications</title>
</head>
<body>
<div>
    <h2>My applications^</h2>

    <div>
        <table>
            <thead>
            <th>ID</th>
            <th>arrivalDate</th>
            <th>departureDate</th>
            <th>sendingDate</th>
            </thead>
            <c:forEach items="${allUsersBills}" var="bill">
                <tr>
                    <td>${bill.id}</td>
                    <td>${bill.arrivalDate}</td>
                    <td>${bill.departureDate}</td>
                    <td>${bill.sendingDate}</td>
                </tr>
            </c:forEach>
        </table>
    </div>

    <a href="/">Main</a>
</div>
</body>
</html>