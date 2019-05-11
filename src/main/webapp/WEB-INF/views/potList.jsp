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
    <script>
        function confirmDelete(id, name) {
            if (confirm("Na pewno usunąć \"" + name + "\"?")) {
                window.location.href = "/pot/del/" + id;
            }
        }
    </script>

</head>
<body>

<%@include file="/WEB-INF/views/menu.jspf" %>

<div class="w3-main" style="margin-left:400px;margin-top:50px;margin-right: 80px;">

    <table class="w3-table-all w3-hoverable" border="1" style="width: 600px;">
        <thead>
        <tr class="w3-green">
            <th>id</th>
            <th>doniczka</th>
            <th>ziarno</th>
            <th>zasiane</th>
            <th>kiełkowanie</th>
            <th>rozsada</th>
            <th style="width: 200px;">uwagi</th>
            <th>akcja</th>

        </tr>
        </thead>
        <c:forEach items="${pots}" var="pot">

            <tr>

                <td>${pot.id}</td>
                <td>${pot.name}</td>
                <td>${pot.seed.name}</td>
                <td>${pot.created}</td>
                <td><c:choose>
                    <c:when test="${pot.germinate <= currentDate}">
                        <span style="color: green;">${pot.germinate}</span>
                    </c:when>
                    <c:otherwise>${pot.germinate}</c:otherwise>
                </c:choose>
               </td>
                <td>
                    <c:choose>
                    <c:when test="${pot.plantToGroundDate <= currentDate}">
                    <span style="color:red;">${pot.plantToGroundDate}
                    </c:when>
                        <c:otherwise>${pot.plantToGroundDate}</c:otherwise>

                    </c:choose>
                <td style="width: 200px">${pot.comment}</td>
                <td>
                    <a href="#" onclick="confirmDelete(${pot.id}, '${pot.name}')"><button style='font-size:10px'>Usuń<i class='fas fa-eraser'></i></button></a>

                </td>

            </tr>

        </c:forEach>
    </table>
    <div class="nav">
        <a href="/pot/add"><button style='font-size:10px; width: 60px;'>Dodaj<i class='far fa-edit'></i></button></a>
    </div>

</div>

</body>
</html>
