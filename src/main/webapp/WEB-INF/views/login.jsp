<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: uze
  Date: 12.05.19
  Time: 21:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="icon" type="image/png" href="favicon.webp" />
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
    <link href="https://getbootstrap.com/docs/4.0/examples/signin/signin.css" rel="stylesheet" crossorigin="anonymous"/>
</head>
<body>
<div class="container">
    <form class="form-signin" method="post" action="/login">
        <h2 class="form-signin-heading">Logowanie</h2>
        <p>
            <label for="username" class="sr-only">Nazwa użytkownika</label>
            <input type="text" id="username" name="username" class="form-control" placeholder="Username" required autofocus>
        <p>
            <label for="password" class="sr-only">Hasło</label>
            <input type="password" id="password" name="password" class="form-control" placeholder="Password" required>
        </p>
        <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}" />
        <button class="btn btn-lg btn-primary btn-block" type="submit">Zaloguj</button>

    </form>
</div>
</body>
</html>
