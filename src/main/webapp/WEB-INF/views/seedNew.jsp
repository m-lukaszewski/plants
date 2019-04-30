<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: uze
  Date: 28.04.19
  Time: 16:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dodawanie doniczek</title>
    <%@include file="/WEB-INF/views/styles.jspf" %>
</head>
<body>
<div class="container">

    <%@include file="/WEB-INF/views/header.jspf" %>

    <div>
        <form:form method="post" modelAttribute="seed">
            <div> Nazwa
                <form:input path="name"/>
                <form:errors path="name"/>
            </div>
            <div> Dni kiełkowania
                <form:input path="growDays"/>
                <form:errors path="growDays"/>
            </div>
            <div> Dni do rozsady
                <form:input path="plantDays"/>
                <form:errors path="plantDays"/>
            </div>
            <div> Uwagi
                <form:input path="comment"/>
                <form:errors path="comment"/>
            </div>

            <input type="submit" value="dodaj">
        </form:form>
    </div>
</div>
</body>
</html>
