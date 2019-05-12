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
    <script>
        function confirmDelete(id, name) {
            if (confirm("Na pewno usunąć \"" + name + "\"?")) {
                window.location.href = "/seed/del/" + id;
            }
        }
    </script>

</head>
<body>
<div class="wrapper">
    <div class="middle">

        <div class="container">
            <main class="content">
                <table class="w3-table-all w3-hoverable" border="1" style="width: 600px;" border="1">
                    <thead>
                    <tr class="w3-green">
                        <th>id</th>
                        <th>nazwa</th>
                        <th>kiełkowanie</th>
                        <th>rozsada</th>
                        <th style="width: 200px;">uwagi</th>
                        <th>akcja</th>

                    </tr>
                    </thead>
                    <c:forEach items="${seeds}" var="seed">

                        <tr>

                            <td>${seed.id}</td>
                            <td>${seed.name}</td>
                            <td>${seed.growDays} dni</td>
                            <td>${seed.plantDays} dni</td>
                            <td style="width: 200px">${seed.comment}</td>
                            <td>
                                <a href="/seed/edit/${seed.id}">
                                    <button style='font-size:10px; width: 60px;'>Zmień <i class='fas fa-edit'></i>
                                    </button>
                                </a><br>
                                <a href="#" onclick="confirmDelete(${seed.id}, '${seed.name}')">
                                    <button style='font-size:10px; width: 60px;'>Usuń <i class='fas fa-eraser'></i>
                                    </button>
                                </a>
                            </td>


                        </tr>

                    </c:forEach>
                </table>
                <div class="nav">
                    <a href="/seed/add" class="nav">
                        <button style='font-size:10px; width: 60px; '>Dodaj <i class='far fa-edit'></i></button>
                    </a>
                </div>
            </main>
        </div>

        <%@include file="/WEB-INF/views/menu.jspf" %>

    </div>
</div>


</body>
</html>
