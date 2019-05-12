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

    <link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.8.3.js"></script>
    <script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
    <script>
        $(function() {
            $( ".datepicker" ).datepicker({ dateFormat: 'm/dd/y' });
        });
    </script>
</head>
<body>
<div class="wrapper">
    <div class="middle">

        <div class="container">
            <main class="content">

                <h2>Modyfikacja doniczek</h2>
                <form:form method="post" modelAttribute="pot" cssStyle="width: 400px;">
                    <div> Nazwa
                        <form:input path="name" class="w3-input"/>
                        <form:errors style="color:red" path="name"/>
                    </div>
                    <div> Utworzona
                        <form:input path="created" class="w3-input datepicker" id="datepicker"/>
                        <form:errors style="color:red" path="created"/>
                    </div>
                    <div> Nasiona
                        <form:select path="seed.id" items="${seeds}" itemLabel="name" itemValue="id" class="w3-input"/>
                        <form:errors style="color:red" path="seed"/>
                    </div>
                    <div> uwagi
                        <form:input path="comment" class="w3-input"/>
                        <form:errors style="color:red" path="comment"/>
                    </div>
                    <input type="submit" value="dodaj">
                </form:form></main>
        </div>

        <%@include file="/WEB-INF/views/menu.jspf" %>

    </div>
</div>

</body>
</html>
