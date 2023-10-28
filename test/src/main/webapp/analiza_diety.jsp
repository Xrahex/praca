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
    <script src="https://www.gstatic.com/charts/loader.js"></script>
    <script>
        google.charts.load('current', {packages: ['corechart']});
        google.charts.setOnLoadCallback(drawChart);
    </script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <link rel="stylesheet" href="panelcss.css" />
    <title>Lista diet</title>
</head>
<body>
<div class="d-flex" id="wrapper">
    <!-- Sidebar -->
    <jsp:include page="sidebar.jsp"></jsp:include>
    <c:set var="id_opcji" value="${0}"></c:set>
    <c:set var="test1" value="${0}"></c:set>
    <c:if test="${!empty requestScope.showalldiets}">
    <div class="col-sm-6">
        <label class="fw-bold mt-2 mb-1" for="dieta_analiza">Wybierz diete do analizy</label><br>
            <select name="dieta_analiza" id="dieta_analiza" onchange="changeContent()">
                <c:forEach items="${requestScope.showalldiets}" var="wszystkiediety">
                    <option value=${id_opcji}>${wszystkiediety.name}</option>
                    <c:set var="id_opcji" value="${id_opcji+1}"></c:set>
                </c:forEach>
            </select>
    </div>
    </c:if>
    <div id="dynamiczna-tresc">
        <div id="piechart" style="width: 900px; height: 500px;"></div>
        <div id="piechart2" style="width: 900px; height: 500px;"></div>
    </div

    <c:if test="${empty requestScope.showalldiets}">
        <p>Dodaj swoją diete lub wypełnij formularz i przypisz sobie jakaś</p>
    </c:if>
    </div>
    <%
    String s=request.getParameter("m");
    pageContext.setAttribute("wychodze",s);
    %>
    <script>
    function changeContent() {
        var selectedOption = document.getElementById("dieta_analiza").value;
        var dynamicznaTresc = document.getElementById("dynamiczna-tresc");

        window.location.replace("analizadiety?m="+selectedOption);
        dynamicznaTresc.innerHTML = "<p>Hej${wychodze} ${requestScope.showalldiets[wychodze].name}</p>";
    }
    </script>
    <script type="text/javascript">
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {

        var data = google.visualization.arrayToDataTable([
            ['Skład diety', 'Ze względu na składniki'],
            ['bialko',     ${requestScope.showalldiets[wychodze].bialko}],
            ['weglowodany',  ${requestScope.showalldiets[wychodze].weglowodany}],
            ['tłuszcz',   ${requestScope.showalldiets[wychodze].tluszcz}],
            ['kwasy tłuszczowe',  ${requestScope.showalldiets[wychodze].kwasy_tluszczowe}],
            ['błonnik',     ${requestScope.showalldiets[wychodze].blonnik}],
            ['sól',     ${requestScope.showalldiets[wychodze].sol}],
            ['cukry',     ${requestScope.showalldiets[wychodze].cukry}]
        ]);

        var options = {
            title: 'Składniki w twojej diecie',
            is3D: true,
        };


        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);

    }
    function drawbialko() {
        <c:if test="${!empty email && email.plec =='kobieta' }">
        var data = google.visualization.arrayToDataTable([
            ['Skład diety', 'Ze względu na składniki'],
            ['bialko',     ${requestScope.showalldiets[wychodze].bialko}]
        ]);

        var options = {
            title: 'Zalecana ilość białka',
            is3D: true,
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart2'));

        chart.draw(data, options);
        </c:if>
    }
    </script>
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>
