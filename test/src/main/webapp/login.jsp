<%--
  Created by IntelliJ IDEA.
  User: Xrahex
  Date: 05.07.2023
  Time: 14:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form class="mx-1 mx-md-4" action="signIn" method="post">
    <label for="email">Wpisz email</label><br>
    <input type="email" id="email" name="email"><br>
    <label for="password">Wpisz hasło:</label><br>
    <input type="text" id="password" name="password">
    <button type="submit">Zaloguj</button>
</form>
</body>
</html>
