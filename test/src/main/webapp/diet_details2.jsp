<%@ page import="com.example.test.beans.Product" %>
<%@ page import="java.util.List" %><%--
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
    <title>Dodaj produkt</title>
    <link rel="stylesheet" href="panelcss.css" />
</head>
<body>
<div class="d-flex" id="wrapper">
<jsp:include page="sidebar.jsp"></jsp:include>
    <div class="container-fluid d-inline m-0 p-0">
        <div class="row align-items-center justify-content-center m-0 p-0" style="background-color: white; height: 84px">
            <div class="col-4 align-items-center justify-content-center text-center d-flex flex-column" style="padding-bottom: 4px">
                <h3>Dodaj produkty</h3>
                    <button class="btn btn-outline-success" type="button" data-bs-toggle="modal"
                            data-bs-target="#addExpenseListModal">
                        <span class="fw-light fs-8">Dodaj produkt</span>
                    </button>
            </div>
            <hr>
        </div>
    <div class="modal" id="addExpenseListModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Dodawanie listy produktów</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="${pageContext.request.contextPath}/addproductsnaidanie?list_id=${pageContext.request.getParameter("list_id")}" method="post" id="addExpenseList">
                        <label class="fw-bold mt-2 mb-1" for="productname">Nazwa produktu</label><br>
                        <input type="text" name="productname" id="productname"/><br>
                        <label class="fw-bold mt-2 mb-1" for="calorie">Liczba kalorii</label><br>
                        <input type="number" step="1" min="0" value="0" name="calorie" id="calorie"/><br>
                        <label class="fw-bold mt-2 mb-1" for="poradnia">Pora dnia</label><br>
                        <select name="poradnia" id="poradnia">
                            <option value="1">Śniadanie</option>
                            <option value="2">Przekąska</option>
                            <option value="3">Obiad</option>
                            <option value="4">Podwieczorek</option>
                            <option value="5">Kolacja</option>
                        </select><br>
                        <label class="fw-bold mt-2 mb-1" for="bialko">Liczba bialka</label><br>
                        <input type="number" step="0.01" min="0" value="0.0" name="bialko" id="bialko"/><br>
                        <label class="fw-bold mt-2 mb-1" for="weglowodany">Liczba weglowodanów</label><br>
                        <input type="number" step="0.01" min="0" value="0.0" name="weglowodany" id="weglowodany"/><br>
                        <label class="fw-bold mt-2 mb-1" for="tluszcz">Liczba tłuszczów</label><br>
                        <input type="number" step="0.01" min="0" value="0.0" name="tluszcz" id="tluszcz"/><br>
                        <label class="fw-bold mt-2 mb-1" for="kwasy_tluszczowe">Liczba kwasów tłuszczowych</label><br>
                        <input type="number" step="0.01" min="0" value="0.0" name="kwasy_tluszczowe" id="kwasy_tluszczowe"/><br>
                        <label class="fw-bold mt-2 mb-1" for="blonnik">Liczba błonnika</label><br>
                        <input type="number" step="0.01" min="0" value="0.0" name="blonnik" id="blonnik"/><br>
                        <label class="fw-bold mt-2 mb-1" for="sol">Liczba soli</label><br>
                        <input type="number" step="0.01" min="0" value="0.0" name="sol" id="sol"/><br>
                        <label class="fw-bold mt-2 mb-1" for="cukry">Liczba cukru</label><br>
                        <input type="number" step="0.01" min="0" value="0.0" name="cukry" id="cukry"/><br>
                        <label class="fw-bold mt-2 mb-1" for="czas_przygotowania">Czas przygotowania</label><br>
                        <select name="czas_przygotowania" id="czas_przygotowania">
                            <option value="0">Mniej niż 30 min</option>
                            <option value="1">Powyżej 30 min</option>
                            <option value="2">Powyżej godziny</option>>
                        </select><br>
                        <label class="fw-bold mt-2 mb-1" for="zawiera_laktoze">Czy produkt zawiera laktoze?</label><br>
                        <select name="zawiera_laktoze" id="zawiera_laktoze">
                            <option value="0">Nie</option>
                            <option value="1">Tak</option>
                        </select><br>
                        <label class="fw-bold mt-2 mb-1" for="zawiera_gluten">Czy produkt zawiera gluten?</label><br>
                        <select name="zawiera_gluten" id="zawiera_gluten">
                            <option value="0">Nie</option>
                            <option value="1">Tak</option>
                        </select><br>
                        <label class="fw-bold mt-2 mb-1" for="jest_wegetarianski">Czy produkt jest wegetariański?</label><br>
                        <select name="jest_wegetarianski" id="jest_wegetarianski">
                            <option value="0">Nie</option>
                            <option value="1">Tak</option>
                        </select><br>
                        <label class="fw-bold mt-2 mb-1" for="jest_weganski">Czy produkt jest wegański?</label><br>
                        <select name="jest_weganski" id="jest_weganski">
                            <option value="0">Nie</option>
                            <option value="1">Tak</option>
                        </select><br>

                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Zamknij</button>
                    <button type="submit" name="submit" form="addExpenseList" class="btn btn-primary">Dodaj</button>
                </div>
            </div>
        </div>
    </div>
        <div class="center">
            <div class="row">
                <div class="col-10">
                <div class="card">
                <div class="card-body">
                    <p class="list-id" style="display:none;">${requestScope.dietlist.diet_list_id}</p>
                    <h5 class="card-title">
                        <p class="m-0 p-0" style="background-color: white">Śniadanie (7:00-9:00)</p>
                    </h5>
                    <table class="table table-striped table-bordered">
                        <thead class="table-dark">
                        <tr>
                            <th style="text-align: center;">Nazwa produktu</th>
                            <th style="text-align: center;">Wartość kaloryczna</th>
                            <th style="text-align: center;">Białko</th>
                            <th style="text-align: center;">Węglowodany</th>
                            <th style="text-align: center;">Tłuszcze</th>
                            <th style="text-align: center;">Kwasy tłuszczowe</th>
                            <th style="text-align: center;">Błonnik</th>
                            <th style="text-align: center;">Sól</th>
                            <th style="text-align: center;">Cukry</th>
                            <th colspan="2" style="text-align: center;">Operacje</th>
                        </tr>
                        </thead>
                        <c:if test="${!empty requestScope.dietwithproducts1}">
                            <c:forEach items="${requestScope.dietwithproducts1}" var="produktyzdiet">
                                <tr>
                                    <td>
                                    <p class="product_id" style="display:none;">${produktyzdiet.product_id}</p>
                                    <p class="poradnia" style="display: none">${produktyzdiet.poradnia}</p>
                                    <p class="product_name">${produktyzdiet.name}</p>
                                    </td>
                                    <td>
                                    <p class="product_calorie">${produktyzdiet.calorie}</p>
                                    </td>
                                    <td>
                                    <p class="product_bialko">${produktyzdiet.bialko}</p>
                                    </td>
                                    <td>
                                    <p class="product_weglowodany">${produktyzdiet.weglowodany}</p>
                                    </td>
                                    <td>
                                        <p class="product_tluszcz">${produktyzdiet.tluszcz}</p>
                                    </td>
                                    <td>
                                        <p class="product_kwasy_tluszczowe">${produktyzdiet.kwasy_tluszczowe}</p>
                                    </td>
                                    <td>
                                        <p class="product_blonnik">${produktyzdiet.blonnik}</p>
                                    </td>
                                    <td>
                                        <p class="product_sol">${produktyzdiet.sol}</p>
                                    </td>
                                    <td>
                                        <p class="product_cukry">${produktyzdiet.cukry}</p>
                                    </td>
                                    <td class="text-center m-0">
                                        <button class="delete-expense-list btn btn-outline-danger" type="button"
                                                data-bs-toggle="modal"
                                                data-bs-target="#deleteExpenseListConfirmationModal"
                                                id="deleteExpenseListButton2">
                                                            <span class="input-group-text text-danger w-50 justify-content-center mx-auto">
                                                                <i class="fa fa-trash" aria-hidden="true"></i>
                                                            </span>
                                        </button>
                                    </td>
                                    <td class="text-center m-0">
                                        <button class="modify-expense-list btn btn-outline-dark" type="button"
                                                data-bs-toggle="modal"
                                                data-bs-target="#modifyExpenseListConfirmationModal"
                                                id="modifyExpenseListButton2">
                                                            <span class="input-group-text text-dark w-50 justify-content-center mx-auto">
                                                                <i class="fa fa-pen-to-square" aria-hidden="true"></i>
                                                            </span>
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>
                        <c:if test="${empty requestScope.dietwithproducts1}">
                            <tr>
                                <td colspan="5" style="text-align: center;">
                                    Nie dodałeś jeszcze żadnych produktów.
                                </td>
                            </tr>
                        </c:if>
                    </table>
                </div>
                </div>
                    <div class="card">
                        <div class="card-body">
                            <p class="list-id" style="display:none;">${requestScope.dietlist.diet_list_id}</p>
                            <h5 class="card-title">
                                <p class="m-0 p-0" style="background-color: white">Przekąska (9:00-12:00)</p>
                            </h5>
                            <table class="table table-striped table-bordered">
                                <thead class="table-dark">
                                <tr>
                                    <th style="text-align: center;">Nazwa produktu</th>
                                    <th style="text-align: center;">Wartość kaloryczna</th>
                                    <th style="text-align: center;">Białko</th>
                                    <th style="text-align: center;">Węglowodany</th>
                                    <th style="text-align: center;">Tłuszcze</th>
                                    <th style="text-align: center;">Kwasy tłuszczowe</th>
                                    <th style="text-align: center;">Błonnik</th>
                                    <th style="text-align: center;">Sól</th>
                                    <th style="text-align: center;">Cukry</th>
                                    <th colspan="2" style="text-align: center;">Operacje</th>
                                </tr>
                                </thead>
                                <c:if test="${!empty requestScope.dietwithproducts2}">
                                    <c:forEach items="${requestScope.dietwithproducts2}" var="produktyzdiet">
                                        <tr>
                                            <td>
                                                <p class="product_id" style="display:none;">${produktyzdiet.product_id}</p>
                                                <p class="poradnia" style="display: none">${produktyzdiet.poradnia}</p>
                                                <p class="product_name">${produktyzdiet.name}</p>
                                            </td>
                                            <td>
                                                <p class="product_calorie">${produktyzdiet.calorie}</p>
                                            </td>
                                            <td>
                                                <p class="product_bialko">${produktyzdiet.bialko}</p>
                                            </td>
                                            <td>
                                                <p class="product_weglowodany">${produktyzdiet.weglowodany}</p>
                                            </td>
                                            <td>
                                                <p class="product_tluszcz">${produktyzdiet.tluszcz}</p>
                                            </td>
                                            <td>
                                                <p class="product_kwasy_tluszczowe">${produktyzdiet.kwasy_tluszczowe}</p>
                                            </td>
                                            <td>
                                                <p class="product_blonnik">${produktyzdiet.blonnik}</p>
                                            </td>
                                            <td>
                                                <p class="product_sol">${produktyzdiet.sol}</p>
                                            </td>
                                            <td>
                                                <p class="product_cukry">${produktyzdiet.cukry}</p>
                                            </td>
                                            <td class="text-center m-0">
                                                <button class="delete-expense-list btn btn-outline-danger" type="button"
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#deleteExpenseListConfirmationModal"
                                                        id="deleteExpenseListButton3">
                                                            <span class="input-group-text text-danger w-50 justify-content-center mx-auto">
                                                                <i class="fa fa-trash" aria-hidden="true"></i>
                                                            </span>
                                                </button>
                                            </td>
                                            <td class="text-center m-0">
                                                <button class="modify-expense-list btn btn-outline-dark" type="button"
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#modifyExpenseListConfirmationModal"
                                                        id="modifyExpenseListButton3">
                                                            <span class="input-group-text text-dark w-50 justify-content-center mx-auto">
                                                                <i class="fa fa-pen-to-square" aria-hidden="true"></i>
                                                            </span>
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${empty requestScope.dietwithproducts2}">
                                    <tr>
                                        <td colspan="5" style="text-align: center;">
                                            Nie dodałeś jeszcze żadnych produktów.
                                        </td>
                                    </tr>
                                </c:if>
                            </table>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <p class="list-id" style="display:none;">${requestScope.dietlist.diet_list_id}</p>
                            <h5 class="card-title">
                                <p class="m-0 p-0" style="background-color: white">Obiad (13:00-16:00)</p>
                            </h5>
                            <table class="table table-striped table-bordered">
                                <thead class="table-dark">
                                <tr>
                                    <th style="text-align: center;">Nazwa produktu</th>
                                    <th style="text-align: center;">Wartość kaloryczna</th>
                                    <th style="text-align: center;">Białko</th>
                                    <th style="text-align: center;">Węglowodany</th>
                                    <th style="text-align: center;">Tłuszcze</th>
                                    <th style="text-align: center;">Kwasy tłuszczowe</th>
                                    <th style="text-align: center;">Błonnik</th>
                                    <th style="text-align: center;">Sól</th>
                                    <th style="text-align: center;">Cukry</th>
                                    <th colspan="2" style="text-align: center;">Operacje</th>
                                </tr>
                                </thead>
                                <c:if test="${!empty requestScope.dietwithproducts3}">
                                    <c:forEach items="${requestScope.dietwithproducts3}" var="produktyzdiet">
                                        <tr>
                                            <td>
                                                <p class="product_id" style="display:none;">${produktyzdiet.product_id}</p>
                                                <p class="poradnia" style="display: none">${produktyzdiet.poradnia}</p>
                                                <p class="product_name">${produktyzdiet.name}</p>
                                            </td>
                                            <td>
                                                <p class="product_calorie">${produktyzdiet.calorie}</p>
                                            </td>
                                            <td>
                                                <p class="product_bialko">${produktyzdiet.bialko}</p>
                                            </td>
                                            <td>
                                                <p class="product_weglowodany">${produktyzdiet.weglowodany}</p>
                                            </td>
                                            <td>
                                                <p class="product_tluszcz">${produktyzdiet.tluszcz}</p>
                                            </td>
                                            <td>
                                                <p class="product_kwasy_tluszczowe">${produktyzdiet.kwasy_tluszczowe}</p>
                                            </td>
                                            <td>
                                                <p class="product_blonnik">${produktyzdiet.blonnik}</p>
                                            </td>
                                            <td>
                                                <p class="product_sol">${produktyzdiet.sol}</p>
                                            </td>
                                            <td>
                                                <p class="product_cukry">${produktyzdiet.cukry}</p>
                                            </td>
                                            <td class="text-center m-0">
                                                <button class="delete-expense-list btn btn-outline-danger" type="button"
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#deleteExpenseListConfirmationModal"
                                                        id="deleteExpenseListButton4">
                                                            <span class="input-group-text text-danger w-50 justify-content-center mx-auto">
                                                                <i class="fa fa-trash" aria-hidden="true"></i>
                                                            </span>
                                                </button>
                                            </td>
                                            <td class="text-center m-0">
                                                <button class="modify-expense-list btn btn-outline-dark" type="button"
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#modifyExpenseListConfirmationModal"
                                                        id="modifyExpenseListButton4">
                                                            <span class="input-group-text text-dark w-50 justify-content-center mx-auto">
                                                                <i class="fa fa-pen-to-square" aria-hidden="true"></i>
                                                            </span>
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${empty requestScope.dietwithproducts3}">
                                    <tr>
                                        <td colspan="5" style="text-align: center;">
                                            Nie dodałeś jeszcze żadnych produktów.
                                        </td>
                                    </tr>
                                </c:if>
                            </table>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <p class="list-id" style="display:none;">${requestScope.dietlist.diet_list_id}</p>
                            <h5 class="card-title">
                                <p class="m-0 p-0" style="background-color: white">Podwieczorek (16:00-18:00)</p>
                            </h5>
                            <table class="table table-striped table-bordered">
                                <thead class="table-dark">
                                <tr>
                                    <th style="text-align: center;">Nazwa produktu</th>
                                    <th style="text-align: center;">Wartość kaloryczna</th>
                                    <th style="text-align: center;">Białko</th>
                                    <th style="text-align: center;">Węglowodany</th>
                                    <th style="text-align: center;">Tłuszcze</th>
                                    <th style="text-align: center;">Kwasy tłuszczowe</th>
                                    <th style="text-align: center;">Błonnik</th>
                                    <th style="text-align: center;">Sól</th>
                                    <th style="text-align: center;">Cukry</th>
                                    <th colspan="2" style="text-align: center;">Operacje</th>
                                </tr>
                                </thead>
                                <c:if test="${!empty requestScope.dietwithproducts4}">
                                    <c:forEach items="${requestScope.dietwithproducts4}" var="produktyzdiet">
                                        <tr>
                                            <td>
                                                <p class="product_id" style="display:none;">${produktyzdiet.product_id}</p>
                                                <p class="poradnia" style="display: none">${produktyzdiet.poradnia}</p>
                                                <p class="product_name">${produktyzdiet.name}</p>
                                            </td>
                                            <td>
                                                <p class="product_calorie">${produktyzdiet.calorie}</p>
                                            </td>
                                            <td>
                                                <p class="product_bialko">${produktyzdiet.bialko}</p>
                                            </td>
                                            <td>
                                                <p class="product_weglowodany">${produktyzdiet.weglowodany}</p>
                                            </td>
                                            <td>
                                                <p class="product_tluszcz">${produktyzdiet.tluszcz}</p>
                                            </td>
                                            <td>
                                                <p class="product_kwasy_tluszczowe">${produktyzdiet.kwasy_tluszczowe}</p>
                                            </td>
                                            <td>
                                                <p class="product_blonnik">${produktyzdiet.blonnik}</p>
                                            </td>
                                            <td>
                                                <p class="product_sol">${produktyzdiet.sol}</p>
                                            </td>
                                            <td>
                                                <p class="product_cukry">${produktyzdiet.cukry}</p>
                                            </td>
                                            <td class="text-center m-0">
                                                <button class="delete-expense-list btn btn-outline-danger" type="button"
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#deleteExpenseListConfirmationModal"
                                                        id="deleteExpenseListButton5">
                                                            <span class="input-group-text text-danger w-50 justify-content-center mx-auto">
                                                                <i class="fa fa-trash" aria-hidden="true"></i>
                                                            </span>
                                                </button>
                                            </td>
                                            <td class="text-center m-0">
                                                <button class="modify-expense-list btn btn-outline-dark" type="button"
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#modifyExpenseListConfirmationModal"
                                                        id="modifyExpenseListButton5">
                                                            <span class="input-group-text text-dark w-50 justify-content-center mx-auto">
                                                                <i class="fa fa-pen-to-square" aria-hidden="true"></i>
                                                            </span>
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${empty requestScope.dietwithproducts4}">
                                    <tr>
                                        <td colspan="5" style="text-align: center;">
                                            Nie dodałeś jeszcze żadnych produktów.
                                        </td>
                                    </tr>
                                </c:if>
                            </table>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <p class="list-id" style="display:none;">${requestScope.dietlist.diet_list_id}</p>
                            <h5 class="card-title">
                                <p class="m-0 p-0" style="background-color: white">Kolacja (18:00-20:00)</p>
                            </h5>
                            <table class="table table-striped table-bordered">
                                <thead class="table-dark">
                                <tr>
                                    <th style="text-align: center;">Nazwa produktu</th>
                                    <th style="text-align: center;">Wartość kaloryczna</th>
                                    <th style="text-align: center;">Białko</th>
                                    <th style="text-align: center;">Węglowodany</th>
                                    <th style="text-align: center;">Tłuszcze</th>
                                    <th style="text-align: center;">Kwasy tłuszczowe</th>
                                    <th style="text-align: center;">Błonnik</th>
                                    <th style="text-align: center;">Sól</th>
                                    <th style="text-align: center;">Cukry</th>
                                    <th colspan="2" style="text-align: center;">Operacje</th>
                                </tr>
                                </thead>
                                <c:if test="${!empty requestScope.dietwithproducts5}">
                                    <c:forEach items="${requestScope.dietwithproducts5}" var="produktyzdiet">
                                        <tr>
                                            <td>
                                                <p class="product_id" style="display:none;">${produktyzdiet.product_id}</p>
                                                <p class="poradnia" style="display: none">${produktyzdiet.poradnia}</p>
                                                <p class="product_name">${produktyzdiet.name}</p>
                                            </td>
                                            <td>
                                                <p class="product_calorie">${produktyzdiet.calorie}</p>
                                            </td>
                                            <td>
                                                <p class="product_bialko">${produktyzdiet.bialko}</p>
                                            </td>
                                            <td>
                                                <p class="product_weglowodany">${produktyzdiet.weglowodany}</p>
                                            </td>
                                            <td>
                                                <p class="product_tluszcz">${produktyzdiet.tluszcz}</p>
                                            </td>
                                            <td>
                                                <p class="product_kwasy_tluszczowe">${produktyzdiet.kwasy_tluszczowe}</p>
                                            </td>
                                            <td>
                                                <p class="product_blonnik">${produktyzdiet.blonnik}</p>
                                            </td>
                                            <td>
                                                <p class="product_sol">${produktyzdiet.sol}</p>
                                            </td>
                                            <td>
                                                <p class="product_cukry">${produktyzdiet.cukry}</p>
                                            </td>
                                            <td class="text-center m-0">
                                                <button class="delete-expense-list btn btn-outline-danger" type="button"
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#deleteExpenseListConfirmationModal"
                                                        id="deleteExpenseListButton">
                                                            <span class="input-group-text text-danger w-50 justify-content-center mx-auto">
                                                                <i class="fa fa-trash" aria-hidden="true"></i>
                                                            </span>
                                                </button>
                                            </td>
                                            <td class="text-center m-0">
                                                <button class="modify-expense-list btn btn-outline-dark" type="button"
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#modifyExpenseListConfirmationModal"
                                                        id="modifyExpenseListButton">
                                                            <span class="input-group-text text-dark w-50 justify-content-center mx-auto">
                                                                <i class="fa fa-pen-to-square" aria-hidden="true"></i>
                                                            </span>
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${empty requestScope.dietwithproducts5}">
                                    <tr>
                                        <td colspan="5" style="text-align: center;">
                                            Nie dodałeś jeszcze żadnych produktów.
                                        </td>
                                    </tr>
                                </c:if>
                            </table>
                        </div>
                    </div>
                </div>
            <div class="col-2">
                <button class="btn btn-primary mb-5 mt-5" style="width: 100%; margin-right: 20px;" >
                    <span class="fw-light fs-8">Wszystkie kalorie:${requestScope.liczbacalorie}</span>
                </button>
                <br>
                <button class="btn btn-primary mb-5" style="width: 100%">
                    <span class="fw-light fs-8">Licznik bialko:${requestScope.liczbabialko}</span>
                </button>
                <br>
                <button class="btn btn-primary mb-5" style="width: 100%">
                    <span class="fw-light fs-8">Licznik weglowodanów:${requestScope.liczbaweglowodany}</span>
                </button>
                <br>
                <button class="btn btn-primary mb-5" style="width: 100%">
                    <span class="fw-light fs-8">Licznik tłuszczy:${requestScope.liczbatluszcz}</span>
                </button>
                <br>
                <button class="btn btn-primary mb-5" style="width: 100%">
                    <span class="fw-light fs-8">Licznik kwasów tłuszczowych:${requestScope.liczbakwasy_tluszczowe}</span>
                </button>
                <br>
                <button class="btn btn-primary mb-5" style="width: 100%">
                    <span class="fw-light fs-8">Licznik błonnika:${requestScope.liczbablonnik}</span>
                </button>
                <br>
                <button class="btn btn-primary mb-5" style="width: 100%">
                    <span class="fw-light fs-8">Licznik soli:${requestScope.liczbasol}</span>
                </button>
                <br>
                <button class="btn btn-primary mb-5" style="width: 100%">
                    <span class="fw-light fs-8">Licznik cukrów:${requestScope.liczbacukry}</span>
                </button>
            </div>
        </div>


            <div class="modal" id="deleteExpenseListConfirmationModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"
                        id="delete-list-modal-title">Usuń: </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>Czy na pewno chcesz usunąć tę listę?</p>
                    <form action="${pageContext.request.contextPath}/deleteproduct?list_id=${pageContext.request.getParameter("list_id")}&product_id="
                          method="post"
                          id="confirmExpenseListDelete">
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Anuluj</button>
                    <button id="sendToServletButton" type="submit" name="submit" form="confirmExpenseListDelete"
                            class="btn btn-primary">Potwierdź</button>
                </div>
            </div>
        </div>
    </div>
        </div>


    <div class="modal" id="deleteExpenseListConfirmationModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"
                        id="delete-list-modal-title3">Usuń: </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>Czy na pewno chcesz usunąć tę listę?</p>
                    <form action="${pageContext.request.contextPath}/deleteproduct?list_id=${pageContext.request.getParameter("list_id")}&product_id="
                          method="post"
                          id="confirmExpenseListDelete3">
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Anuluj</button>
                    <button id="sendToServletButton3" type="submit" name="submit" form="confirmExpenseListDelete"
                            class="btn btn-primary">Potwierdź</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal" id="deleteExpenseListConfirmationModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"
                        id="delete-list-modal-title2">Usuń: </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>Czy na pewno chcesz usunąć tę listę?</p>
                    <form action="${pageContext.request.contextPath}/deleteproduct?list_id=${pageContext.request.getParameter("list_id")}&product_id="
                          method="post"
                          id="confirmExpenseListDelete2">
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Anuluj</button>
                    <button id="sendToServletButton2" type="submit" name="submit" form="confirmExpenseListDelete"
                            class="btn btn-primary">Potwierdź</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal" id="modifyExpenseListConfirmationModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"
                        id="modify-list-modal-title">Modyfikuj: </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="${pageContext.request.contextPath}/modifyproduct?list_id=${pageContext.request.getParameter("list_id")}&product_id="
                          method="post"
                          id="confirmExpenseListModify">
                        <label class="fw-bold mt-2 mb-1" for="modifiedproductName">Nazwa produktu</label><br>
                        <input type="text" name="name" id="modifiedproductName"/><br>
                        <label class="fw-bold mt-2 mb-1" for="modifiedcalorie">Liczba kalorii</label><br>
                        <input type="number" step="1" min="0" name="calorie" id="modifiedcalorie"/><br>
                        <label class="fw-bold mt-2 mb-1" for="modifiedpora_dnia">Pora dnia</label><br>
                        <select name="poradnia" id="modifiedpora_dnia">
                            <option value="1">Śniadanie</option>
                            <option value="2">Przekąska</option>
                            <option value="3">Obiad</option>
                            <option value="4">Podwieczorek</option>
                            <option value="5">Kolacja</option>
                        </select><br>
                        <label class="fw-bold mt-2 mb-1" for="modifiedbialko">Liczba bialka</label><br>
                        <input type="number" step="0.01" min="0" name="bialko" id="modifiedbialko"/><br>
                        <label class="fw-bold mt-2 mb-1" for="modifiedweglowodany">Liczba weglowodanów</label><br>
                        <input type="number" step="0.01" min="0" name="weglowodany" id="modifiedweglowodany"/><br>
                        <label class="fw-bold mt-2 mb-1" for="modifiedtluszcz">Liczba tłuszczów</label><br>
                        <input type="number" step="0.01" min="0" name="tluszcz" id="modifiedtluszcz"/><br>
                        <label class="fw-bold mt-2 mb-1" for="modifiedkwasy_tluszczowe">Liczba kwasów tłuszczowych</label><br>
                        <input type="number" step="0.01" min="0" name="kwasy_tluszczowe" id="modifiedkwasy_tluszczowe"/><br>
                        <label class="fw-bold mt-2 mb-1" for="modifiedblonnik">Liczba błonnika</label><br>
                        <input type="number" step="0.01" min="0" name="blonnik" id="modifiedblonnik"/><br>
                        <label class="fw-bold mt-2 mb-1" for="modifiedsol">Liczba soli</label><br>
                        <input type="number" step="0.01" min="0" name="sol" id="modifiedsol"/><br>
                        <label class="fw-bold mt-2 mb-1" for="modifiedcukry">Liczba cukru</label><br>
                        <input type="number" step="0.01" min="0" name="cukry" id="modifiedcukry"/><br>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Anuluj</button>
                    <button type="submit" name="submit" form="confirmExpenseListModify"
                            class="btn btn-primary">Potwierdź</button>
                </div>
            </div>
        </div>
    </div>

    <c:if test="${empty requestScope.dietlist}">
    Lista o podanym identyfikatorze nie istnieje.
    </c:if>

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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    <script>
        $(".delete-expense-list").click(function () {
            let listName = $(this).parent().parent().find('.list-name').text();
            let product_id = $(this).parent().parent().find('.product_id').text();
            $("#delete-list-modal-title").text('Usuń: ' + listName);

            let actionAttr = $("#confirmExpenseListDelete").attr('action');
            $("#confirmExpenseListDelete").attr('action', actionAttr + product_id);
        });
    </script>
    <script>
        $(".modify-expense-list").click(function () {
            let productName = $(this).parent().parent().find('.product_name').text();
            let product_id = $(this).parent().parent().find('.product_id').text();
            let productcalorie=  $(this).parent().parent().find('.product_calorie').text();
            let productpora_dnia =  $(this).parent().parent().find('.poradnia').text();
            let productbialko=  $(this).parent().parent().find('.product_bialko').text();
            let productweglowodany=  $(this).parent().parent().find('.product_weglowodany').text();
            let producttluszcz=  $(this).parent().parent().find('.product_tluszcz').text();
            let productkwasy_tluszczowe=  $(this).parent().parent().find('.product_kwasy_tluszczowe').text();
            let productblonnik=  $(this).parent().parent().find('.product_blonnik').text();
            let productsol=  $(this).parent().parent().find('.product_sol').text();
            let productcukry=  $(this).parent().parent().find('.product_cukry').text();
            $("#modify-list-modal-title").text('Modyfikuj: ' + productName);

            $("#modifiedproductName").val(productName);
            $("#modifiedcalorie").val(productcalorie);
            $("#modifiedbialko").val(productbialko);
            $("#modifiedpora_dnia").val(productpora_dnia);
            $("#modifiedweglowodany").val(productweglowodany);
            $("#modifiedtluszcz").val(producttluszcz);
            $("#modifiedkwasy_tluszczowe").val(productkwasy_tluszczowe);
            $("#modifiedblonnik").val(productblonnik);
            $("#modifiedsol").val(productsol);
            $("#modifiedcukry").val(productcukry);

            let actionAttr = $("#confirmExpenseListModify").attr('action');
            $("#confirmExpenseListModify").attr('action', actionAttr + product_id);
        });
    </script>
</body>
</html>
