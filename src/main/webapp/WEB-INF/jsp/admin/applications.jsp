<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>User applications</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>

<body>
<div class="container">
    <table class="table table-hover table-bordered">
        <tr>
            <th>ID</th>
            <th>Arrival Date</th>
            <th>Departure Date</th>
            <th>Sending Date</th>
            <th>User email</th>
            <th>Select room</th>
        </tr>
        <c:forEach items="${allApplications}" var="appl">
            <form action="${pageContext.request.contextPath}/applications" method="post">
                <tr>
                    <td>${appl.id}</td>
                    <td>${appl.arrivalDate}</td>
                    <td>${appl.departureDate}</td>
                    <td>${appl.sendingDate}</td>
                    <td>${appl.user.email}</td>
                    <td>
                        <select id="rooms" name="Rooms" class="form-control">
                            <option value="top">Select room</option>
                            <c:forEach items="${rooms}" var="room">
                                <option value="${room.id}">${room.id}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td>
                            <input type="hidden" name="applicationId" value="${appl.id}"/>
                            <input type="hidden" name="action" value="confirm"/>
                            <button type="submit" class="btn btn-success">Confirm</button>
                    </td>
                </tr>
            </form>
        </c:forEach>
    </table>
</div>
</body>
</html>