<%--
  Created by IntelliJ IDEA.
  User: Xrahex
  Date: 26.09.2023
  Time: 23:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
      <c:if test="${!empty status}">
        <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
          <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
            <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
          </symbol>
        </svg>
        <div class="alert alert-danger d-flex align-items-center" role="alert">
          <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
          <div>
            Błędne dane logowania!
          </div>
        </div>
      </c:if>
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
      <div class="" style="text-align: center">
      <p class="">Nie masz konta? <a href="rejestracja.jsp" class="align-content-center">Zarejestruj</a></p>
      </div>
      <br>
      <button type="submit" class="przycisk">Zaloguj się</button>
    </form>
  </div>
  </body>
</html>