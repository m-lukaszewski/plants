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
    <title>Lista nasion</title>
</head>
<body>
<%@include file="/WEB-INF/views/header.jspf" %>

<table border="1">
    <tr>
        <th>id</th>
        <th>nazwa</th>
        <th>czas kiełkowania</th>
        <th>czas rozsadzania</th>
        <th>uwagi</th>

    </tr>
    <c:forEach items="${seeds}" var="seed">

        <tr>

            <td>${seed.id}</td>
            <td>${seed.name}</td>
            <td>${seed.growTime}</td>
            <td>${seed.plantTime}</td>
            <td>${seed.comment}</td>


        </tr>

    </c:forEach>
</table>
<a href="/seed/add">Dodaj</a>
</body>
</html>
