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
    <div class="container-fluid" style="background: url(images/panel.jpg) no-repeat; height: 100%; overflow:hidden; position: fixed">
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
