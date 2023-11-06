<%--
  Created by IntelliJ IDEA.
  User: Xrahex
  Date: 11.10.2023
  Time: 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
  <link rel="stylesheet" href="panelcss.css" />
  <title>Panel</title>
  <style>

    body {
      background-color: #f8f8f8;
    }

    .porady {
      text-align: center;
    }
    .card {
      margin: 20px;
      padding: 20px;
      background-color: #fff;
      border-radius: 10px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    .welcome h1 {
      font-size: 2em;
      margin-bottom: 10px;
    }

    .welcome p {
      font-size: 1.2em;
      color: #555;
      margin-bottom: 20px;
    }

    .welcome a {
      display: inline-block;
      padding: 10px 20px;
      background-color: #007bff;
      color: #fff;
      text-decoration: none;
      border-radius: 5px;
      transition: background-color 0.3s;
    }

    .welcome a:hover {
      background-color: #0056b3;
    }

  </style>
</head>

<body>
<div class="d-flex" id="wrapper">
  <!-- Sidebar -->
  <jsp:include page="sidebar.jsp"></jsp:include>
  <!-- /#sidebar-wrapper -->

  <!-- Page Content -->
  <div id="page-content-wrapper">
    <nav class="navbar navbar-expand-lg navbar-light bg-transparent py-4 px-4">
      <div class="d-flex align-items-center">
        <i class="fas fa-align-left primary-text fs-4 me-3" id="menu-toggle"></i>
        <h2 class="fs-2 m-0">Panel</h2>
      </div>

      <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
              data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
              aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <c:if test="${empty requestScope.email}">
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle second-text fw-bold" href="#" id="navbarDropdown"
               role="button" data-bs-toggle="dropdown" aria-expanded="false">
              <i class="fas fa-user me-2"></i>${email.nickname}
            </a>
            </c:if>
            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
              <li><a class="dropdown-item" href="zmiana_hasla.jsp">Zmień hasło</a></li>
              <li><a class="dropdown-item" href="#">Wyloguj</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </nav>
    <div class="porady">
  <c:if test="${empty requestScope.email}">
    <div class="account-info card">
      <h2>Informacje o koncie</h2>
      <p>Email: ${email.email}</p>
      <p>Typ: ${email.type}</p>
    </div>
  </c:if>
    <div class="diet-tips">
      <h2>Porady Dietetyczne</h2>

      <div class="row">
        <div class="col-md-6">
          <div class="diet-tip card">
            <h3>Porada 1</h3>
            <p>Jedz regularnie i w umiarkowanych ilościach.</p>
          </div>
        </div>
        <div class="col-md-6">
          <div class="diet-tip card">
            <h3>Porada 2</h3>
            <p>Wybieraj zdrowe źródła białka, takie jak drób, ryby, tofu i rośliny strączkowe.</p>
          </div>
        </div>
      </div>

      <div class="row">
        <div class="col-md-6">
          <div class="diet-tip card">
            <h3>Porada 3</h3>
            <p>Unikaj przetworzonych produktów i słodzonych napojów.</p>
          </div>
        </div>
        <div class="col-md-6">
          <div class="diet-tip card">
            <h3>Porada 4</h3>
            <p>Zadbaj o zbilansowaną dietę zawierającą owoce, warzywa, pełnoziarniste produkty, orzechy i nasiona.</p>
          </div>
        </div>
      </div>

      <div class="row">
        <div class="col-md-6">
          <div class="diet-tip card">
            <h3>Porada 5</h3>
            <p>Pamiętaj o regularnej aktywności fizycznej.</p>
          </div>
        </div>
        <div class="col-md-6">
          <div class="diet-tip card">
            <h3>Porada 6</h3>
            <p>Staraj się spożywać różnorodne produkty, aby dostarczyć organizmowi składników odżywczych.</p>
          </div>
        </div>
      </div>
    </div>
    </div>
</div>
<!-- /#page-content-wrapper -->
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
<script>
  var el = document.getElementById("wrapper");
  var toggleButton = document.getElementById("menu-toggle");

  toggleButton.onclick = function () {
    el.classList.toggle("toggled");
  };
</script>
</body>

</html>
