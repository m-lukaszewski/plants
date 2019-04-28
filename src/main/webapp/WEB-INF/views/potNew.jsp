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
</head>
<body>
<%@include file="/WEB-INF/views/header.jspf" %>

<div>
    <form:form method="post" modelAttribute="pot">
        <div> Nazwa
            <form:input path="name"/>
            <form:errors path="name"/>
        </div>
        <div> Nasiona
            <form:select path="seed.id" items="${seeds}" itemLabel="name" itemValue="id"/>
            <form:errors path="seed.id"/>
        </div>
        <div> uwagi
            <form:input path="comment"/>
            <form:errors path="comment"/>
        </div>
        <input type="submit" value="dodaj">
    </form:form>
</div>
</body>
</html>
