<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

<%@include file="/WEB-INF/views/menu.jspf" %>

<div class="w3-main" style="margin-left:300px;margin-top:20px;margin-right: 80px;">


    <h2 class="w3-green">Dodawanie nasion</h2>
    <form:form method="post" modelAttribute="seed">
        <div> Nazwa
            <form:input path="name" class="w3-input"/>
            <form:errors path="name"/>
        </div>
        <div> Dni kiełkowania
            <form:input path="growDays" class="w3-input"/>
            <form:errors path="growDays"/>
        </div>
        <div> Dni do rozsady
            <form:input path="plantDays" class="w3-input"/>
            <form:errors path="plantDays"/>
        </div>
        <div> Uwagi
            <form:input path="comment" class="w3-input"/>
            <form:errors path="comment"/>
        </div>

        <input type="submit" value="dodaj">
    </form:form>
</div>
</div>
</body>
</html>
