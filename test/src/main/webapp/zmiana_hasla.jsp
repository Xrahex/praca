<%--
  Created by IntelliJ IDEA.
  User: Xrahex
  Date: 22.10.2023
  Time: 22:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Logowanie</title>
    <link rel="stylesheet" href="style3.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
<div class="ramka">
    <form class="mx-1 mx-md-4" action="changepassword" method="post">
        <h1>Zmiana hasła</h1>
        <div class="input">
            <div class="input-text">
                <input type="password" id="password" name="password" class="form-control form-control-lg" placeholder="Stare hasło" required>
                <i class='bx bx-envelope'></i>
            </div>
            <div class="input-text">
                <input type="password" id="password2" name="password2" class="form-control form-control-lg" placeholder="Nowe Hasło" required>
                <i class='bx bxs-lock'></i>
            </div>
        </div>
        <label><input type="checkbox">Zgadzam się na przetwarzanie danych osobowych.</label>
        <button type="submit" class="przycisk">Zmień hasło</button>
    </form>
</div>
</body>
</html>
