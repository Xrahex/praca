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
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <title>Title</title>
</head>
<body>
<a href="add_your_diet.jsp">
<button>Dodaj własna diete</button>
</a>
<button>Wybierz diete dla Ciebie</button>
<table class="table table-striped table-bordered">
    <thead class="table-dark">
    <tr>
        <th>Nazwa listy</th>
        <th>Usuń</th>
        <th>Modyfikuj</th>
    </tr>
    </thead>
<c:if test="${!empty requestScope.showalldiets}">
    <c:forEach items="${requestScope.showalldiets}" var="wszystkiediety">
        <tr>
            <td>
                <a href="add_your_diet.jsp"
                   class="list-name">${wszystkiediety.name}</a>
<%--&lt;%&ndash;                <p class="list-id" style="display:none;">${wszystkiediety.id}</p>&ndash;%&gt;--%>
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
    <c:if test="${empty requestScope.showalldiets}">
        <tr>
            <td colspan="7" style="text-align: center;">
               Nie utworzyłeś żadnej swojej diety.
            </td>
        </tr>
    </c:if>
</table>
<button class="btn btn-outline-success" type="button" data-bs-toggle="modal"
        data-bs-target="#addExpenseListModal">
    <span class="fw-light fs-8">Dodaj listę wydatków</span>
</button>
<div class="modal" id="addExpenseListModal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Dodawanie listy wydatków</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="adddietlist" method="post" id="adddietlist">
                    <label class="fw-bold mt-2 mb-1" for="listName">Nazwa listy</label>
                    <input type="text" name="listName" id="listName"/>
                    <label class="fw-bold mt-2 mb-1" for="expenseLimit">Limit wydatków dla listy</label>
                    <input type="text" name="expenseLimit" id="expenseLimit"/>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Zamknij</button>
                <button type="submit" name="submit" form="adddietlist" class="btn btn-primary">Dodaj</button>
            </div>
        </div>
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
                <form action="${pageContext.request.contextPath}/expense/list/delete?list_id="
                      method="post"
                      id="confirmExpenseListDelete">
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

<div class="modal" id="modifyExpenseListConfirmationModal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"
                    id="modify-list-modal-title">Modyfikuj: </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/expense/list/update?list_id="
                      method="post"
                      id="confirmExpenseListModify">
                    <label class="fw-bold mt-2 mb-1" for="modifiedListName">Nazwa listy</label>
                    <input type="text" name="name" id="modifiedListName"/>
                    <label class="fw-bold mt-2 mb-1" for="modifiedExpenseLimit">Limit wydatków dla listy</label>
                    <input type="text" name="expenseLimit" id="modifiedExpenseLimit"/>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>
