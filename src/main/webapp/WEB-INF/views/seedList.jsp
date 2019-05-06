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
    <%@include file="/WEB-INF/views/styles.jspf" %>
</head>
<body>

<%@include file="/WEB-INF/views/menu.jspf" %>

<div class="w3-main" style="margin-left:400px;margin-top:50px;margin-right: 80px;">


    <table class="w3-table-all w3-hoverable" border="1" style="width: 600px;" border="1">
        <thead>
        <tr class="w3-green">
            <th>id</th>
            <th>nazwa</th>
            <th>dni kiełkowania</th>
            <th>dni do rozsady</th>
            <th style="width: 200px;">uwagi</th>
            <th>akcja</th>

        </tr>
        </thead>
        <c:forEach items="${seeds}" var="seed">

            <tr>

                <td>${seed.id}</td>
                <td>${seed.name}</td>
                <td>${seed.growDays}</td>
                <td>${seed.plantDays}</td>
                <td>${seed.comment}</td>
                <td>
                    <a href="/seed/edit/${seed.id}">Zmień</a>
                    <a href="/seed/del/${seed.id}">Usuń</a>
                </td>


            </tr>

        </c:forEach>
    </table>
    <div class="nav">
        <a href="/seed/add" class="nav">Dodaj</a>
    </div>
</div>
</body>
</html>
