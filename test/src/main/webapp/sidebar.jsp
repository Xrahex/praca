<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Xrahex
  Date: 23.10.2023
  Time: 17:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="bg-white" id="sidebar-wrapper">
  <div class="sidebar-heading text-center py-4 primary-text fs-4 fw-bold text-uppercase border-bottom"><i class="fa-solid fa-heart-pulse me-2"></i>CaliCounter</div>
  <div class="list-group list-group-flush my-3">
    <a href="dashboard.jsp" class="list-group-item list-group-item-action bg-transparent second-text active"><i class="fa-solid fa-house me-2"></i>Panel</a>
    <a href="profile_page.jsp" class="list-group-item list-group-item-action bg-transparent second-text active"><i class="fa-solid fa-heart me-2"></i>Wybierz diete</a>
    <a href="alldiets" class="list-group-item list-group-item-action bg-transparent second-text active"><i class="fa-solid fa-rectangle-list me-2"></i>Twoje diety</a>
    <a href="saveddiet" class="list-group-item list-group-item-action bg-transparent second-text active"><i class="fa-solid fa-star me-2"></i>Zapisane diety</a>
    <a href="analizadiety?m=0&dietlist=0&diet_calorie=0" class="list-group-item list-group-item-action bg-transparent second-text active"><i class="fa-solid fa-chart-pie me-2"></i>Analiza diety</a>
    <c:if test="${!empty email && email.type =='admin' }">
      <a href="allusers" class="list-group-item list-group-item-action bg-transparent second-text active"><i class="fa-solid fa-circle-user me-2"></i>Użytkownicy</a>
      <a href="adminalldiets" class="list-group-item list-group-item-action bg-transparent second-text active"><i class="fa-solid fa-box me-2"></i>Wszystkie diety</a>
    </c:if>
    <a href="logout" onclick="return confirm('Czy na pewno chcesz się wylogować?')" class="list-group-item list-group-item-action bg-transparent text-danger fw-bold"><i
            class="fas fa-power-off me-2"></i>Logout</a>
  </div>
</div>