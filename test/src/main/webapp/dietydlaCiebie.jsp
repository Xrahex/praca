<%--
  Created by IntelliJ IDEA.
  User: Xrahex
  Date: 05.08.2023
  Time: 20:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
  <link rel="stylesheet" href="panelcss.css" />
  <title>Diety dla Ciebie</title>
</head>
<body>
<div class="d-flex" id="wrapper">
  <!-- Sidebar -->
  <jsp:include page="sidebar.jsp"></jsp:include>
  <div class="container-fluid d-inline m-0 p-0">
    <div class="row align-items-center justify-content-center m-0 p-0" style="background-color: white; height: 84px">
      <div class="col-4 align-items-center justify-content-center text-center d-flex flex-column" style="padding-bottom: 4px">
        <h3>Przypisz dietę do swojego konta</h3>
        <a href="profile_page.jsp">
          <button class="btn btn-outline-success" type="button">
            <span class="fw-light fs-8">Wyszukaj dietę dla siebie</span>
          </button>
        </a>
      </div>
      <hr>
    </div>
  <table class="table table-striped table-bordered table-responsive table-hover mx-auto" style="width: 60rem;">
    <thead class="table-dark">
    <tr>
      <th>Nazwa listy</th>
      <th>Zapisz</th>
    </tr>
    </thead>
    <c:if test="${!empty requestScope.dietydlaciebie}">
      <c:forEach items="${requestScope.dietydlaciebie}" var="dietsforyou">
        <tr>
          <td>
            <a href="${pageContext.request.contextPath}/dietlistdetails?list_id=${dietsforyou.diet_list_id}"
               class="list-name">${dietsforyou.name}</a>
            <p class="list-id" style="display:none;">${dietsforyou.diet_list_id}</p>
          </td>
          <td class="text-center m-0">
            <button class="delete-expense-list btn btn-outline-danger" type="button"
                    data-bs-toggle="modal"
                    data-bs-target="#deleteExpenseListConfirmationModal"
                    id="deleteExpenseListButton">
                                                            <span class="input-group-text text-danger w-50 justify-content-center mx-auto">
                                                               <i class="fa-solid fa-cloud-arrow-down"></i>
                                                            </span>
            </button>
          </td>
        </tr>
      </c:forEach>
    </c:if>
    <c:if test="${empty requestScope.dietydlaciebie}">
      <tr>
        <td colspan="7" style="text-align: center;">
          Nie znaleziono diety dla Ciebie, sprawdź swoje odpowiedzi jeszcze raz.
        </td>
      </tr>
    </c:if>
  </table>
  </div>
  <div class="modal" id="deleteExpenseListConfirmationModal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title"
              id="delete-list-modal-title">Przypisz: </h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <p>Czy na pewno chcesz przypisać tą diete dla siebie?</p>
          <form action="${pageContext.request.contextPath}/asigndiet?list_id="
                method="post" method="post" id="confirmExpenseListDelete">
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Anuluj</button>
          <button type="submit" name="submit" form="confirmExpenseListDelete"
                  class="btn btn-primary">Potwierdź</button>
        </div>
      </div>
    </div>
  </div>
  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin-2.min.js"></script>
  <script src="js/demo/chart-area-demo.js"></script>

  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    $(".delete-expense-list").click(function () {
      let listName = $(this).parent().parent().find('.list-name').text();
      let listId = $(this).parent().parent().find('.list-id').text();
      $("#delete-list-modal-title").text('Przypisz: ' + listName);
      let actionAttr = $("#confirmExpenseListDelete").attr('action');
      $("#confirmExpenseListDelete").attr('action', actionAttr + listId);
    });
  </script>
  <script>
    $(".modify-expense-list").click(function () {
      let listName = $(this).parent().parent().find('.list-name').text();
      let listId = $(this).parent().parent().find('.list-id').text();
      $("#modify-list-modal-title").text('Modyfikuj: ' + listName);

      $("#modifiedListName").val(listName);
      $("#modifiedExpenseLimit").val(expenseLimit);

      let actionAttr = $("#confirmExpenseListModify").attr('action');
      $("#confirmExpenseListModify").attr('action', actionAttr + listId);
    });
  </script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>
