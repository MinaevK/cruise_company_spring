<div>
<form:form method="post" modelAttribute="cruiseForm">
    <table border="0" cellpadding="5">
        <tr>
            <td>Name </td>
            <td><input placeholder="${cruise.name}" path="name" /></td>
        </tr>
        <tr>
            <td>Ship </td>
            <td><select id="ships" name="shipId">
                <option value="${cruise.ship}">${cruise.ship}</option>
                <c:forEach items="${ships}" var="ship">
                    <option value="${ship.id}">${ship.name}</option>
                </c:forEach>
            </select>
            </td>
        </tr>

        <tr>
            <td>Price </td>
            <td><input placeholder="${cruise.name}" path="cruisePrice" /></td>
        </tr>

        <tr>
            <td colspan="2"><button type="submit">Edit</button></td>
        </tr>
    </table>
    <a href="/">Main</a>
    </div>
    <c:forEach items="${ports}" var="port">
        <tr>
            <td>${port}</td>
            <td>
                <input type="checkbox" name="portsChecked" value="${port}">
                    <%--<button type="button">Add</button>--%>
            </td>
        </tr>
    </c:forEach>
</form:form>