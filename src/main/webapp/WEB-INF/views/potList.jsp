<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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

<div class="wrapper">
    <div class="middle">

        <div class="container">
            <main class="content">

                <table class="w3-table-all w3-hoverable sortable"style="width: 600px;">
                    <caption><h4><strong>Lista sadzonek</strong></h4></caption>
                    <thead>
                    <tr class="w3-green">
                        <th>id</th>
                        <th>doniczka</th>
                        <th>ziarno</th>
                        <th>zasiane</th>
                        <th>kiełkowanie</th>
                        <th>rozsada</th>
                        <th>przesadzone</th>
                        <th>cel</th>
<%--                        <th style="width: 200px;">uwagi</th>--%>
                        <th>akcja</th>

                    </tr>
                    </thead>
                    <c:forEach items="${pagedListHolder.pageList}" var="pot">

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
                                    <span style="color:red;">${pot.plantToGroundDate}</span>
                    </c:when>
                        <c:otherwise>${pot.plantToGroundDate}</c:otherwise>

                                </c:choose></td>
                            <td>${pot.isPlantedToGround}</td>
                            <td>${pot.destination.name}</td>
<%--                            <td style="width: 200px">${pot.comment}</td>--%>
                            <td><a href="/pot/edit/${pot.id}">
                                <button style='font-size:10px; width: 60px;'>Zmień <i class='fas fa-edit'></i>
                                </button>
                            </a><br>
                                <a href="#" onclick="confirmDelete(${pot.id}, '${pot.name}')">
                                    <button style='font-size:10px; width: 60px;'>Usuń <i class='fas fa-eraser'></i></button>
                                </a>

                            </td>

                        </tr>

                    </c:forEach>
                </table>
                <jsp:useBean id="pagedListHolder" scope="request"
                             type="org.springframework.beans.support.PagedListHolder"/>
                <c:url value="/pot/list" var="pagedLink">
                    <c:param name="p" value="~"/>
                </c:url>

                <tg:paging pagedListHolder="${pagedListHolder}"
                           pagedLink="${pagedLink}"/>
                <div class="nav">
                    <a href="/pot/add">
                        <button style='font-size:10px; width: 60px;'>Dodaj <i class='fas fa-plus'></i>
                        </button>
                    </a>
                </div>
                <div><strong>Legenda:</strong>
                <p style="color: green;">Kiełki powinny być widoczne.</p>
                <p style="color: red;">Rośliny powinno się przesadzić.</p>
                </div>
            </main>
        </div>

        <%@include file="/WEB-INF/views/menu.jspf" %>
    </div>
</div>
<%@include file="/WEB-INF/views/footer.jspf" %>

</body>
</html>
