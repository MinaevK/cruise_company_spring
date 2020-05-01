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
    <form:form method="post" modelAttribute="excursionForm">
    <table border="0" cellpadding="5">
        <tr>
            <td>Name</td>
            <td><form:input path="name" /></td>
        </tr>
        <tr>
            <td>Port </td>
            <td><select id="ports" name="port">
                <option value="top">Select port</option>
                <c:forEach items="${ports}" var="port">
                    <option value="${port}">${port}</option>
                </c:forEach>
            </select>
            </td>
        </tr>

        <tr>
            <td colspan="2"><button type="submit">Save</button></td>
        </tr>
    </table>
    <a href="/">Main</a>
</div>

</form:form>
</body>
</html>