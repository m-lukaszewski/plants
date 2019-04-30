<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: uze
  Date: 28.04.19
  Time: 17:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lista doniczek</title>
    <%@include file="/WEB-INF/views/styles.jspf" %>
</head>
<body>
<div class="container">
    <%@include file="/WEB-INF/views/header.jspf" %>

    <table border="1">
        <tr>
            <th>id</th>
            <th>doniczka</th>
            <th>ziarno</th>
            <th>zasiane</th>
            <th>kiełkowanie</th>
            <th>rozsada</th>
            <th>uwagi</th>

        </tr>
        <c:forEach items="${pots}" var="pot">

            <tr>

                <td>${pot.id}</td>
                <td>${pot.name}</td>
                <td>${pot.seed.name}</td>
                <td>${pot.created}</td>
                <td>${pot.germinate}</td>
                <td>${pot.plantToGroundDate}</td>
                <td>${pot.comment}</td>

            </tr>

        </c:forEach>
    </table>
    <div class="nav">
        <a href="/pot/add">Dodaj</a>
    </div>
</div>
</body>
</html>
