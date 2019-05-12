<%--
  Created by IntelliJ IDEA.
  User: uze
  Date: 12.05.19
  Time: 20:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Logout</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
    <link href="https://getbootstrap.com/docs/4.0/examples/signin/signin.css" rel="stylesheet" crossorigin="anonymous"/>
</head>
<body>
<div class="container">
    <form class="form-signin" method="post" action="/logout">
        <h2 class="form-signin-heading">Na pewno chcesz się wylogować?</h2>
        <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}" />
        <button class="btn btn-lg btn-primary btn-block" type="submit">Log Out</button>
        <button class="btn btn-lg btn-primary btn-block" type="button"><a href="/" style="color: white;">powrót</a> </button>
    </form>
</div>
</body>
</html>
