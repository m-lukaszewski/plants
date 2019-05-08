<%@ page import="java.time.LocalDate" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: uze
  Date: 28.04.19
  Time: 14:53
  To change this template use File | Settings | File Templates.
--%>


<%
    LocalDate dateakt = LocalDate.now();
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/WEB-INF/views/styles.jspf" %>

</head>
<body>
<%@include file="/WEB-INF/views/menu.jspf" %>
<div class="w3-main" style="margin-left:400px;margin-top:50px;margin-right: 80px;">

</div>
</body>
</html>
