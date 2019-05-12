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

<div class="wrapper">
    <div class="middle">

        <div class="container">
            <main class="content">
                <h5>
                    <div style="padding: 15px;">
                        <strong>Aplikacja Plants Manager</strong></div>
                    <p>Projekt końcowy (według własnej koncepcji) w ramach kursu Junior Java Developer w CodersLab.
                    </p>
                    <div style="padding: 15px;"><strong>Funkcjonalność aplikacji:</strong></div>
                    <ul>
                        <li>Katalogowanie nasion</li>
                        <li>Katalogowanie doniczek z wysianymi nasionami</li>
                        <li>Obliczanie czasu kiełkowania</li>
                        <li>Obliczanie czasu do przygotowania rozsady</li>
                        <li>Paginacja i sortowanie danych widoku</li>
                        <li>Pokazywanie skróconej prognozy pogody *przydatne do planowania rozsady*</li>
                        <li>Logowanie z wykorzystaniem Spring-Security</li>
                    </ul>
                    <div style="padding: 15px;"><strong>TODO</strong></div>
                    <ul>
                        <li>Integracja z kalendarzem Google + powiadomienia o możliwych rozsadach</li>
                    </ul>
                    <div style="padding: 15px;"><strong>Wykorzystane technologie:</strong></div>
                    <ul>
                        <li>Java ;-)</li>
                        <li>Spring Boot</li>
                        <li>Java Persistence API</li>
                        <li>Spring Data</li>
                        <li>JSP</li>
                        <li>Javascript</li>
                        <li>JQuery</li>
                        <li>HTML(chyba że nie widać)</li>
                        <li>Apache Tomcat</li>
                    </ul>

                    <div style="padding: 15px;"><strong>Kod wykorzystany zgodnie z opdowiednimi licencjami:</strong></div>
                    <ul>
                        <li><a href="https://gramthanos.github.io/jsCalendar/">jsCalendar</a></li>

                        <li><a href="https://www.meteoblue.com/en/weather/widget/setupday">Widget z API MeteoBlue</a></li>
                        <li>
                            <a href="https://www.needpix.com/photo/download/1539102/background-stationary-plants-foliage-greens-branches-vines-hanging-leaves>">Tło
                                autorstwa Circe Denyer (publicdomainpictures.net)</a></li>
                    </ul>
                </h5>
            </main><!-- .content -->
        </div><!-- .container-->
        <%@include file="/WEB-INF/views/menu.jspf" %>
    </div>

</div>

</body>
</html>
