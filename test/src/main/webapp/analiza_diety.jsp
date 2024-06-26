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
<div class="d-flex" id="wrapper" style="overflow: hidden;">
    <!-- Sidebar -->
    <jsp:include page="sidebar.jsp"></jsp:include>
    <div class="container-fluid d-inline m-0 p-0">
        <div class="row align-items-center justify-content-center m-0 p-0" style="background-color: white; height: 84px">
            <div class="col-12 align-items-center justify-content-center text-center d-flex flex-column" style="padding-bottom: 4px">
                <h3>Analiza diety</h3>
                <%
                    String s=request.getParameter("m");
                    int dietki = Integer.parseInt(request.getParameter("dietlist"));
                    double calorie_w = Double.parseDouble(request.getParameter("diet_calorie"));
                    pageContext.setAttribute("wychodze",s);
                    pageContext.setAttribute("dietyy_id",dietki);
                    pageContext.setAttribute("diet_calorie",calorie_w);
                %>
                <script>
                    function changeContent() {
                        var selectedOption = document.getElementById("dieta_analiza").value;
                        var dynamicznaTresc = document.getElementById("dynamiczna-tresc");
                        dynamicznaTresc.innerHTML = "<p>Hej${wychodze} ${requestScope.showalldiets[wychodze].diet_list_id}</p>";

                        var list_id = "${requestScope.showalldiets[wychodze].diet_list_id}";
                        var calorie = ${requestScope.showalldiets[wychodze].calorie};

                        window.location.replace("analizadiety?m=" + selectedOption + "&dietlist=" + list_id + "&diet_calorie=" + calorie);
                    }
                </script>
                <div class="col-12 d-flex justify-content-center align-items-center mb-3">
                    <a href="proponowane_produkty?list_id=${dietyy_id}&calorie=${diet_calorie}">
                        <button class="w-100 btn btn-outline-success btn-lg" type="submit" href="proponowane_p" style="transform: scale(0.8)">Sprawdź produkty uzupełniające</button>
                    </a>
                </div>
                <hr>
            </div>
        </div>
    <c:set var="id_opcji" value="${0}"></c:set>
    <c:set var="test1" value="${0}"></c:set>
    <c:if test="${!empty requestScope.showalldiets}">
    <div class="container-fluid d-inline p-0 m-0">
    <div class="d-flex justify-content-center">
        <label class="fw-bold mt-2 mb-1" for="dieta_analiza">Wybierz diete do analizy </label><br>
            <select name="dieta_analiza" id="dieta_analiza" onchange="changeContent()">
                <option></option>
                <c:forEach items="${requestScope.showalldiets}" var="wszystkiediety">
                    <option value=${id_opcji}>${wszystkiediety.name}</option>
                    <c:set var="id_opcji" value="${id_opcji+1}"></c:set>
                </c:forEach>
            </select>
    </div>
    </c:if>
    <div id="dynamiczna-tresc" class="row">
        <div class="col-6">
            <div id="piechart" style="width: 800px; height: 500px;"></div>
        </div>
        <div class="col-6">
            <div id="piechart9" style="width: 800px; height: 500px;"></div>
        </div>
        <div class="col-12 justify-content-center align-items-center">
            <div id="roznice" style="width: 100%; height: 700px;"></div>
        </div>
    </div>
    </div>
    </div>

    <c:if test="${empty requestScope.showalldiets}">
        <p>Dodaj swoją diete lub wypełnij formularz i przypisz sobie jakaś</p>
    </c:if>
    </div>
    <script type="text/javascript">
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart);
    google.charts.setOnLoadCallback(drawcalorie);
    google.charts.load('current', {'packages':['bar']});
    google.charts.setOnLoadCallback(drawroznice);
    google.charts.setOnLoadCallback(drawcalorie2);

    function drawChart() {

        var data = google.visualization.arrayToDataTable([
            ['Skład diety', 'Ze względu na składniki'],
            ['białko',     ${requestScope.showalldiets[wychodze].bialko}],
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
            backgroundColor: 'transparent',
        };


        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);

    }
    function drawcalorie() {

        var data = google.visualization.arrayToDataTable([
            ['Skład diety', 'Ze względu na składniki'],
            ['Kalorie w diecie',     ${requestScope.showalldiets[wychodze].calorie}],
            ['Twoje zapotrzebowanie',  ${profil.CPM}]
        ]);

        var options = {
            title: 'Liczba kalorii',
            is3D: true,
            backgroundColor: 'transparent',
        };


        var chart = new google.visualization.PieChart(document.getElementById('piechart9'));

        chart.draw(data, options);

    }

    function drawcalorie2() {
        var data = google.visualization.arrayToDataTable([
            ['Liczba kalorii', 'Odpowiednia liczba kalorii', 'Liczba kalorii w diecie', 'Różnica'],
            ['Kalorie',  ${profil.CPM},  ${requestScope.showalldiets[wychodze].calorie},  ${profil.CPM}-${requestScope.showalldiets[wychodze].calorie}]
        ]);

        var options = {
            chart: {
                title: 'Liczba kalorii',
                subtitle: 'Różnica między zapotrzebowaniem kalorycznym',
            }
        };

        var chart = new google.charts.Bar(document.getElementById('caloriekolumna'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
    }

    function drawroznice() {
    <c:if test="${!empty profil && profil.plec =='kobieta'}">
        var data = google.visualization.arrayToDataTable([
            ['Składnik odżywczy', 'Wskazane Dzienne Spożycie', 'Ilość składnika w diecie', 'Różnica'],
            ['Białko', 50,  ${requestScope.showalldiets[wychodze].bialko}, 50- ${requestScope.showalldiets[wychodze].bialko}],
            ['Węglowodany', 270, ${requestScope.showalldiets[wychodze].weglowodany}, 270-${requestScope.showalldiets[wychodze].weglowodany}],
            ['Tłuszcz', 70, ${requestScope.showalldiets[wychodze].tluszcz}, 70-${requestScope.showalldiets[wychodze].tluszcz}],
            ['Kwasy tłuszczowe nasycone', 20,  ${requestScope.showalldiets[wychodze].kwasy_tluszczowe}, 20- ${requestScope.showalldiets[wychodze].kwasy_tluszczowe}],
            ['Błonnik',25 , ${requestScope.showalldiets[wychodze].blonnik} ,25-  ${requestScope.showalldiets[wychodze].blonnik}],
            ['Sól',6 ,${requestScope.showalldiets[wychodze].sol},6-${requestScope.showalldiets[wychodze].sol}],
            ['Cukry',90 ,${requestScope.showalldiets[wychodze].cukry},90 -${requestScope.showalldiets[wychodze].cukry}]
        ]);
    </c:if>
    <c:if test="${!empty profil && profil.plec =='mezczyzna'}">
        var data = google.visualization.arrayToDataTable([
            ['Składnik odżywczy', 'Wskazane Dzienne Spożycie', 'Ilość składnika w diecie', 'Różnica'],
            ['Białko', 60,  ${requestScope.showalldiets[wychodze].bialko}, 60- ${requestScope.showalldiets[wychodze].bialko}],
            ['Węglowodany', 340, ${requestScope.showalldiets[wychodze].weglowodany}, 340-${requestScope.showalldiets[wychodze].weglowodany}],
            ['Tłuszcz', 80, ${requestScope.showalldiets[wychodze].tluszcz}, 80-${requestScope.showalldiets[wychodze].tluszcz}],
            ['Kwasy tłuszczowe nasycone', 30,  ${requestScope.showalldiets[wychodze].kwasy_tluszczowe}, 30- ${requestScope.showalldiets[wychodze].kwasy_tluszczowe}],
            ['Błonnik',25 , ${requestScope.showalldiets[wychodze].blonnik} ,25-  ${requestScope.showalldiets[wychodze].blonnik}],
            ['Sól',6 ,${requestScope.showalldiets[wychodze].sol},6-${requestScope.showalldiets[wychodze].sol}],
            ['Cukry',110 ,${requestScope.showalldiets[wychodze].cukry},110 -${requestScope.showalldiets[wychodze].cukry}]
        ]);
    </c:if>
        var options = {
            chart: {
                title: 'Wskazane Dzienne Spożycie',
                subtitle: 'W zależności od danego składnika odżywczego',
            }
        };

        var chart = new google.charts.Bar(document.getElementById('roznice'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
    }


    <%--function drawbialko() {--%>
    <%--    <c:if test="${!empty profil && profil.plec =='kobieta'}">--%>
    <%--    var data = google.visualization.arrayToDataTable([--%>
    <%--        ['Skład diety', 'Ze względu na składniki'],--%>
    <%--        ['Aktualna ilość białka',     ${requestScope.showalldiets[wychodze].bialko}],--%>
    <%--        ['Brakująca ilość białka',    50- ${requestScope.showalldiets[wychodze].bialko} ]--%>
    <%--    ]);--%>
    <%--    </c:if>--%>
    <%--    <c:if test="${!empty profil && profil.plec =='mezczyzna'}">--%>
    <%--    var data = google.visualization.arrayToDataTable([--%>
    <%--        ['Skład diety', 'Ze względu na składniki'],--%>
    <%--        ['Aktualna ilość białka',     ${requestScope.showalldiets[wychodze].bialko}],--%>
    <%--        ['Brakująca ilość białka',    60- ${requestScope.showalldiets[wychodze].bialko} ]--%>
    <%--    ]);--%>
    <%--    </c:if>--%>
    <%--    var options = {--%>
    <%--        title: 'Wskazane dzienne spożycie białka',--%>
    <%--        is3D: true,--%>
    <%--        backgroundColor: 'transparent',--%>
    <%--    };--%>

    <%--    var chart = new google.visualization.PieChart(document.getElementById('piechart2'));--%>

    <%--    chart.draw(data, options);--%>
    <%--}--%>
    <%--function drawbialko() {--%>
    <%--    <c:if test="${!empty profil && profil.plec =='kobieta'}">--%>
    <%--    var data = google.visualization.arrayToDataTable([--%>
    <%--        ['Skład diety', 'Ze względu na składniki'],--%>
    <%--        ['Aktualna ilość białka',     ${requestScope.showalldiets[wychodze].bialko}],--%>
    <%--        ['Brakująca ilość białka',    50- ${requestScope.showalldiets[wychodze].bialko} ]--%>
    <%--    ]);--%>
    <%--    </c:if>--%>
    <%--    <c:if test="${!empty profil && profil.plec =='mezczyzna'}">--%>
    <%--        var data = google.visualization.arrayToDataTable([--%>
    <%--        ['Skład diety', 'Ze względu na składniki'],--%>
    <%--        ['Aktualna ilość białka',     ${requestScope.showalldiets[wychodze].bialko}],--%>
    <%--        ['Brakująca ilość białka',    60- ${requestScope.showalldiets[wychodze].bialko} ]--%>
    <%--        ]);--%>
    <%--    </c:if>--%>
    <%--    var options = {--%>
    <%--        title: 'Wskazane dzienne spożycie białka',--%>
    <%--        is3D: true,--%>
    <%--        backgroundColor: 'transparent',--%>
    <%--    };--%>

    <%--    var chart = new google.visualization.PieChart(document.getElementById('piechart2'));--%>

    <%--    chart.draw(data, options);--%>
    <%--}--%>
    <%--function drawbweglowodany() {--%>
    <%--    <c:if test="${!empty profil && profil.plec =='kobieta'}">--%>
    <%--    var data = google.visualization.arrayToDataTable([--%>
    <%--        ['Skład diety', 'Ze względu na składniki'],--%>
    <%--        ['Aktualna ilość węglowodanów',     ${requestScope.showalldiets[wychodze].weglowodany}],--%>
    <%--        ['Brakująca ilość węglowodanów',    270- ${requestScope.showalldiets[wychodze].weglowodany} ]--%>
    <%--    ]);--%>
    <%--    </c:if>--%>
    <%--    <c:if test="${!empty profil && profil.plec =='mezczyzna'}">--%>
    <%--    var data = google.visualization.arrayToDataTable([--%>
    <%--        ['Skład diety', 'Ze względu na składniki'],--%>
    <%--        ['Aktualna ilość węglowodanów',     ${requestScope.showalldiets[wychodze].weglowodany}],--%>
    <%--        ['Brakująca ilość węglowodanów',    340- ${requestScope.showalldiets[wychodze].weglowodany} ]--%>
    <%--    ]);--%>
    <%--    </c:if>--%>
    <%--    var options = {--%>
    <%--        title: 'Wskazane dzienne spożycie węglowodanów',--%>
    <%--        is3D: true,--%>
    <%--        backgroundColor: 'transparent',--%>
    <%--    };--%>

    <%--    var chart = new google.visualization.PieChart(document.getElementById('piechart3'));--%>

    <%--    chart.draw(data, options);--%>
    <%--}--%>
    <%--function drawtluszcz() {--%>
    <%--    <c:if test="${!empty profil && profil.plec =='kobieta'}">--%>
    <%--    var data = google.visualization.arrayToDataTable([--%>
    <%--        ['Skład diety', 'Ze względu na składniki'],--%>
    <%--        ['Aktualna ilość tłuszczu',     ${requestScope.showalldiets[wychodze].tluszcz}],--%>
    <%--        ['Brakująca ilość tłuszczu',    70- ${requestScope.showalldiets[wychodze].tluszcz} ]--%>
    <%--    ]);--%>
    <%--    </c:if>--%>
    <%--    <c:if test="${!empty profil && profil.plec =='mezczyzna'}">--%>
    <%--    var data = google.visualization.arrayToDataTable([--%>
    <%--        ['Skład diety', 'Ze względu na składniki'],--%>
    <%--        ['Aktualna ilość tłuszczu',     ${requestScope.showalldiets[wychodze].tluszcz}],--%>
    <%--        ['Brakująca ilość tłuszczu',   80- ${requestScope.showalldiets[wychodze].tluszcz} ]--%>
    <%--    ]);--%>
    <%--    </c:if>--%>
    <%--    var options = {--%>
    <%--        title: 'Wskazane dzienne spożycie tłuszczu',--%>
    <%--        is3D: true,--%>
    <%--        backgroundColor: 'transparent',--%>
    <%--    };--%>

    <%--    var chart = new google.visualization.PieChart(document.getElementById('piechart4'));--%>

    <%--    chart.draw(data, options);--%>
    <%--}--%>
    <%--function drawkwasytluszczowe() {--%>
    <%--    <c:if test="${!empty profil && profil.plec =='kobieta'}">--%>
    <%--    var data = google.visualization.arrayToDataTable([--%>
    <%--        ['Skład diety', 'Ze względu na składniki'],--%>
    <%--        ['Aktualna ilość kwasów tłuszczowych',     ${requestScope.showalldiets[wychodze].kwasy_tluszczowe}],--%>
    <%--        ['Brakująca ilość kwasów tłuszczowych',    20- ${requestScope.showalldiets[wychodze].kwasy_tluszczowe} ]--%>
    <%--    ]);--%>
    <%--    </c:if>--%>
    <%--    <c:if test="${!empty profil && profil.plec =='mezczyzna'}">--%>
    <%--    var data = google.visualization.arrayToDataTable([--%>
    <%--        ['Skład diety', 'Ze względu na składniki'],--%>
    <%--        ['Aktualna ilość kwasów tłuszczowych',     ${requestScope.showalldiets[wychodze].kwasy_tluszczowe}],--%>
    <%--        ['Brakująca ilość kwasów tłuszczowych',    30- ${requestScope.showalldiets[wychodze].kwasy_tluszczowe} ]--%>
    <%--    ]);--%>
    <%--    </c:if>--%>
    <%--    var options = {--%>
    <%--        title: 'Wskazane dzienne spożycie kwasów tłuszczowych',--%>
    <%--        is3D: true,--%>
    <%--        backgroundColor: 'transparent',--%>
    <%--    };--%>

    <%--    var chart = new google.visualization.PieChart(document.getElementById('piechart5'));--%>

    <%--    chart.draw(data, options);--%>
    <%--}--%>
    <%--function drawblonnik() {--%>
    <%--    <c:if test="${!empty profil && profil.plec =='kobieta'}">--%>
    <%--    var data = google.visualization.arrayToDataTable([--%>
    <%--        ['Skład diety', 'Ze względu na składniki'],--%>
    <%--        ['Aktualna ilość błonnika',     ${requestScope.showalldiets[wychodze].blonnik}],--%>
    <%--        ['Brakująca ilość błonnika',    25- ${requestScope.showalldiets[wychodze].blonnik} ]--%>
    <%--    ]);--%>
    <%--    </c:if>--%>
    <%--    <c:if test="${!empty profil && profil.plec =='mezczyzna'}">--%>
    <%--    var data = google.visualization.arrayToDataTable([--%>
    <%--        ['Skład diety', 'Ze względu na składniki'],--%>
    <%--        ['Aktualna ilość błonnika',     ${requestScope.showalldiets[wychodze].blonnik}],--%>
    <%--        ['Brakująca ilość błonnika',    25- ${requestScope.showalldiets[wychodze].blonnik} ]--%>
    <%--    ]);--%>
    <%--    </c:if>--%>
    <%--    var options = {--%>
    <%--        title: 'Wskazane dzienne spożycie błonnika',--%>
    <%--        is3D: true,--%>
    <%--        backgroundColor: 'transparent',--%>
    <%--    };--%>

    <%--    var chart = new google.visualization.PieChart(document.getElementById('piechart6'));--%>

    <%--    chart.draw(data, options);--%>
    <%--}--%>
    <%--function drawsol() {--%>
    <%--    <c:if test="${!empty profil && profil.plec =='kobieta'}">--%>
    <%--    var data = google.visualization.arrayToDataTable([--%>
    <%--        ['Skład diety', 'Ze względu na składniki'],--%>
    <%--        ['Aktualna ilość soli',     ${requestScope.showalldiets[wychodze].sol}],--%>
    <%--        ['Brakująca ilość soli',    6- ${requestScope.showalldiets[wychodze].sol} ]--%>
    <%--    ]);--%>
    <%--    </c:if>--%>
    <%--    <c:if test="${!empty profil && profil.plec =='mezczyzna'}">--%>
    <%--    var wynik=0;--%>
    <%--    if (6- ${requestScope.showalldiets[wychodze].sol} > 0) {--%>
    <%--        wynik = 6- ${requestScope.showalldiets[wychodze].sol};--%>
    <%--    }--%>
    <%--    else {--%>
    <%--        wynik = 0;--%>
    <%--    }--%>
    <%--    var data = google.visualization.arrayToDataTable([--%>
    <%--        ['Skład diety', 'Ze względu na składniki'],--%>
    <%--        ['Aktualna ilość soli',     ${requestScope.showalldiets[wychodze].sol}],--%>
    <%--        ['Brakująca ilość soli',   wynik ]--%>

    <%--    ]);--%>
    <%--    </c:if>--%>
    <%--    var options = {--%>
    <%--        title: 'Wskazane dzienne spożycie soli',--%>
    <%--        is3D: true,--%>
    <%--        backgroundColor: 'transparent',--%>
    <%--    };--%>

    <%--    var chart = new google.visualization.PieChart(document.getElementById('piechart7'));--%>

    <%--    chart.draw(data, options);--%>
    <%--}--%>
    <%--function drawsol() {--%>
    <%--    var currentSodium = ${requestScope.showalldiets[wychodze].sol};--%>
    <%--    var difference = 6 - currentSodium;--%>

    <%--    difference = difference < 0 ? 0 : difference;--%>

    <%--    var data = google.visualization.arrayToDataTable([--%>
    <%--        ['Skład diety', 'Ze względu na składniki'],--%>
    <%--        ['Aktualna ilość soli', currentSodium],--%>
    <%--        ['Brakująca ilość soli', difference ]--%>
    <%--    ]);--%>

    <%--    var options = {--%>
    <%--        title: 'Wskazane dzienne spożycie soli',--%>
    <%--        is3D: true,--%>
    <%--        backgroundColor: 'transparent',--%>
    <%--    };--%>

    <%--    var chart = new google.visualization.PieChart(document.getElementById('piechart7'));--%>

    <%--    chart.draw(data, options);--%>
    <%--}--%>
    <%--function drawcukry() {--%>
    <%--    <c:if test="${!empty profil && profil.plec =='kobieta'}">--%>
    <%--    var data = google.visualization.arrayToDataTable([--%>
    <%--        ['Skład diety', 'Ze względu na składniki'],--%>
    <%--        ['Aktualna ilość cukru',     ${requestScope.showalldiets[wychodze].cukry}],--%>
    <%--        ['Brakująca ilość cukru',    90- ${requestScope.showalldiets[wychodze].cukry} ]--%>
    <%--    ]);--%>
    <%--    </c:if>--%>
    <%--    <c:if test="${!empty profil && profil.plec =='mezczyzna'}">--%>
    <%--    var data = google.visualization.arrayToDataTable([--%>
    <%--        ['Skład diety', 'Ze względu na składniki'],--%>
    <%--        ['Aktualna ilość cukru',     ${requestScope.showalldiets[wychodze].cukry}],--%>
    <%--        ['Brakująca ilość cukru',    110- ${requestScope.showalldiets[wychodze].cukry} ]--%>
    <%--    ]);--%>
    <%--    </c:if>--%>
    <%--    var options = {--%>
    <%--        title: 'Wskazane dzienne spożycie cukru',--%>
    <%--        is3D: true,--%>
    <%--        backgroundColor: 'transparent',--%>
    <%--    };--%>

    <%--    var chart = new google.visualization.PieChart(document.getElementById('piechart8'));--%>

    <%--    chart.draw(data, options);--%>
    <%--}--%>
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
