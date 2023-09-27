<%--
  Created by IntelliJ IDEA.
  User: Xrahex
  Date: 26.09.2023
  Time: 23:15
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
    <form class="mx-1 mx-md-4" action="signIn" method="post">
      <h1>Logowanie</h1>
      <div class="input">
        <div class="input-text">
          <input type="email" id="email" name="email" class="form-control form-control-lg" placeholder="Email" required>
          <i class='bx bx-envelope'></i>
        </div>
        <div class="input-text">
          <input type="password" id="password" name="password" class="form-control form-control-lg" placeholder="Hasło" required>
          <i class='bx bxs-lock'></i>
        </div>
      </div>
      <label><input type="checkbox">Zgadzam się na przetwarzanie danych osobowych.</label>
      <button type="submit" class="przycisk">Zaloguj się</button>
    </form>
  </div>
  </body>
</html>