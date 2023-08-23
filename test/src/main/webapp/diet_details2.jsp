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
    <title>Title</title>
</head>
<body>
<div class="container h-100">
    <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4"><a href="${pageContext.request.contextPath}/alldiets"><svg xmlns="http://www.w3.org/2000/svg" width="40" height="43" fill="currentColor" class="bi bi-box-arrow-left" viewBox="0 0 16 16">
        <path fill-rule="evenodd" d="M6 12.5a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v2a.5.5 0 0 1-1 0v-2A1.5 1.5 0 0 1 6.5 2h8A1.5 1.5 0 0 1 16 3.5v9a1.5 1.5 0 0 1-1.5 1.5h-8A1.5 1.5 0 0 1 5 12.5v-2a.5.5 0 0 1 1 0v2z"/>
        <path fill-rule="evenodd" d="M.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L1.707 7.5H10.5a.5.5 0 0 1 0 1H1.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3z"/>
    </svg></a>      Dodaj produkty</p>
    <c:if test="${!empty requestScope.dietlist}">
    <div class="row">
        <div class="col-md-7">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">
                        <p>Dodane produkty</p>
                    </h5>
                    <table class="table table-striped table-bordered">
                        <thead class="table-dark">
                        <tr>
                            <th style="text-align: center;">Nazwa</th>
                            <th style="text-align: center;">Wartość</th>
                            <th style="text-align: center;">Twoja część</th>
                            <th style="text-align: center;">Nieprzydzielone</th>
                            <th colspan="2" style="text-align: center;">Operacje</th>
                        </tr>
                        </thead>
                        <c:if test="${!empty requestScope.dietwithproducts}">
                            <c:forEach items="${requestScope.dietwithproducts}" var="expense">
                                <tr>
                                    <td class="text-center m-0">
                                        <button class="delete-expense btn btn-outline-danger" type="button"
                                                data-bs-toggle="modal"
                                                data-bs-target="#RemoveExpense"
                                                id="deleteExpenseListButton">
                                                            <span class="input-group-text text-danger w-50 justify-content-center mx-auto">
                                                                <i class="fa fa-trash" aria-hidden="true"></i>
                                                            </span>
                                        </button>
                                    </td>
                                    <td class="text-center m-0">
                                        <button class="modify-expense btn btn-outline-dark" type="button"
                                                data-bs-toggle="modal"
                                                data-bs-target="#editExpenseModal"
                                                id="modifyExpenseListButton">
                                                            <span class="input-group-text text-dark w-50 justify-content-center mx-auto">
                                                                <i class="fa fa-pen-to-square" aria-hidden="true"></i>
                                                            </span>
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>
                        <c:if test="${empty requestScope.expenses}">
                            <tr>
                                <td colspan="5" style="text-align: center;">
                                    Nie dodałeś jeszcze żadnych wydatków.
                                </td>
                            </tr>
                        </c:if>
                    </table>
                    <button class="btn btn-outline-success" type="button" data-bs-toggle="modal"
                            data-bs-target="#addExpenseModal">
                        <span class="fw-light fs-8">Dodaj Wydatek</span>
                    </button>
                    <button class="btn btn-primary">
                        <span class="fw-light fs-8">Suma wszystkich wydatków: <fmt:formatNumber type="CURRENCY" maxFractionDigits="2" value="${suma_wydatkow}"/></span>
                    </button>
                    <button class="btn btn-success">
                        <span class="fw-light fs-8">Suma twoich wydatków: <fmt:formatNumber type="CURRENCY" maxFractionDigits="2" value="${suma_wydatkow_t}"/></span>
                    </button>
                </div>
            </div>
        </div>
    </div>
    </c:if>
    <c:if test="${empty requestScope.dietlist}">
    Lista o podanym identyfikatorze nie istnieje.
    </c:if>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>
