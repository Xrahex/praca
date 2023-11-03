<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en" data-bs-theme="auto">
<head><script src="../assets/js/color-modes.js"></script>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.112.5">
    <title>Zmiana profilu</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/checkout/">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <link rel="stylesheet" href="panelcss.css" />

    <!-- Custom styles for this template -->
    <link href="checkout.css" rel="stylesheet">
</head>
<style>
    h2,h4,label {
        color:white;
        text-shadow: 0 0 4px black, 0 0 4px black, 0 0 4px black, 0 0 4px black, 0 0 4px black, 0 0 4px black, 0 0 4px black, 0 0 4px black, 0 0 4px black, 0 0 4px black, 0 0 4px black, 0 0 4px black, 0 0 4px black, 0 0 4px black, 0 0 4px black, 0 0 4px black, 0 0 4px black, 0 0 4px black, 0 0 4px black, 0 0 4px black;
        -webkit-font-smoothing: antialiased
    }
</style>
<body class="bg-body-tertiary">
<div class="d-flex" id="wrapper" style="background: url(images/panel.jpg) no-repeat; height: 100%; width: 100%; overflow:hidden; position: fixed;">
    <!-- Sidebar -->
<jsp:include page="sidebar.jsp"></jsp:include>
<div class="container">
    <main>
        <div class="row">
            <div class="py-5 text-center col-12">
                <h2>Na początku uzupełnij swoje dane!</h2>
            </div>
            <div class="align-items-center justify-content-center card border-dark" style="background-color: transparent; backdrop-filter: blur(15px)">
                <div class="card-body">
                    <div class="col-12">
                        <h4 class="mb-3 text-center">Dane adresowe</h4>
                    </div>
                    <hr>
                <form class="needs-validation" novalidate action="changepersonals" method="post">
                    <div class="row g-3">
                        <div class="col-5">
                            <label for="firstName" class="form-label">Imie</label>
                            <input type="text" class="form-control" id="firstName" name="firstName" placeholder="" value="" required>
                            <div class="invalid-feedback">
                                Valid first name is required.
                            </div>
                        </div>
                        <div class="col-5">
                            <label for="lastName" class="form-label">Nazwisko</label>
                            <input type="text" class="form-control" id="lastName" name="lastName" placeholder="" value="" required>
                            <div class="invalid-feedback">
                                Valid last name is required.
                            </div>
                        </div>
                        <div class="col-2">
                            <label class="fw-bold mt-2 mb-1" for="plec">Płeć</label><br>
                            <select name="plec" id="plec">
                                <option value="kobieta">Kobieta</option>
                                <option value="mezczyzna">Mężczyzna</option>
                            </select>
                            <div class="invalid-feedback">
                                Valid last name is required.
                            </div>
                        </div>
                        <div class="col-3">
                            <label for="wiek" class="form-label">Wiek</label>
                            <input type="text" class="form-control" id="wiek" name="wiek" placeholder="" value="" required>
                            <div class="invalid-feedback">
                                Valid last name is required.
                            </div>
                        </div>
                        <div class="col-3">
                            <label for="aktualna_waga" class="form-label">Aktualna waga</label>
                            <input type="text" class="form-control" id="aktualna_waga" name="aktualna_waga" placeholder="" value="" required>
                            <div class="invalid-feedback">
                                Valid last name is required.
                            </div>
                        </div>
                            <div class="col-3">
                                <label for="waga_docelowa" class="form-label">Waga docelowa</label>
                                <input type="text" class="form-control" id="waga_docelowa" name="waga_docelowa" placeholder="" value="" required>
                                <div class="invalid-feedback">
                                    Valid last name is required.
                                </div>
                        </div>
                        <div class="col-3">
                            <label for="wzrost" class="form-label">Wzrost</label>
                            <input type="text" class="form-control" id="wzrost" name="wzrost" placeholder="" value="" required>
                            <div class="invalid-feedback">
                                Valid last name is required.
                            </div>
                        </div>
                    </div>
                    <br>
                    <hr>
                    <div class="col-12">
                            <h4 class="mb-3 text-center">Pytania kontrolne</h4>
                    </div>
                    <hr>
                        <div class="col-sm-6">
                            <label class="fw-bold mt-2 mb-1" for="aktywnosc_fizyczna">Aktywność fizyczna w pracy</label><br>
                            <select name="aktywnosc_fizyczna" id="aktywnosc_fizyczna">
                                <option value="0">bardzo lekka, np. siedzę przed komputerem większą część dnia lub jestem kierowcą</option>
                                <option value="1">lekka, np. lekka praca przemysłowa, sprzedaż lub praca biurowa obejmująca lekkie czynności </option>
                                <option value="2">umiarkowana, np. sprzątanie, praca w kuchni lub dostarczanie poczty pieszo lub rowerem</option>
                                <option value="3">ciężka, np. ciężka praca przemysłowa, prace budowlane lub rolnictwo. </option>
                            </select>
                        </div>
                        <div class="col-sm-6">
                            <label class="fw-bold mt-2 mb-1" for="aktywnosc_fizyczna2">Aktywność fizyczna w wolnym czasie</label><br>
                            <select name="aktywnosc_fizyczna2" id="aktywnosc_fizyczna2">
                                <option value="0">bardzo lekka, np. nie jestem aktywny fizycznie w wolnym czasie</option>
                                <option value="1">lekka, np. w przybliżeniu raz w tygodniu: spaceruję, rekreacyjnie jeżdżę na rowerze, pracuję w ogródku </option>
                                <option value="2">umiarkowana, np. regularnie ćwiczę przynajmniej raz w tygodniu: spaceruję, jeżdżę na rowerze, pracuję w ogródku lub idę do pracy przynajmniej 10–30 min codziennie</option>
                                <option value="3">duża, np. regularnie ćwiczę więcej niż raz w tygodniu: intensywne spacery lub intensywna jazda na rowerze lub uprawianie sportu </option>
                                <option value="4">intensywna, np. ciężka aktywność fizyczna kilka razy w tygodniu </option>
                            </select>
                        </div>
                        <div class="col-sm-12">
                            <label class="fw-bold mt-2 mb-1" for="wybor">Jaki wynik chcesz uzyskać?</label><br>
                            <select name="wybor" id="wybor">
                                <option value="0">Schudnąć</option>
                                <option value="1">Przytyć </option>
                                <option value="2"> Utrzymać wage </option>
                            </select>
                            <div class="invalid-feedback">
                                Valid last name is required.
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <label class="fw-bold mt-2 mb-1" for="liczba_posilki">Ile posiłków chcesz jeść dziennie?</label><br>
                            <select name="liczba_posilki" id="liczba_posilki">
                                <option value="3">Trzy</option>
                                <option value="4">Cztery </option>
                                <option value="5"> Pięć</option>
                            </select>
                            <div class="invalid-feedback">
                                Valid last name is required.
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <label class="fw-bold mt-2 mb-1" for="czas_posilki">Ile czasu możesz poświęcić na przygotowanie posiłków?</label><br>
                            <select name="czas_posilki" id="czas_posilki">
                                <option value="0">Mniej niż 30min</option>
                                <option value="1">Powyżej 30min </option>
                                <option value="2">Powyżej godziny</option>
                            </select>
                            <div class="invalid-feedback">
                                Valid last name is required.
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <label class="fw-bold mt-2 mb-1" for="preferencje">Czy masz jakieś preferencje?</label><br>
                            <select name="preferencje" id="preferencje">
                                <option value="0">Brak</option>
                                <option value="1">Nie toleruje laktozy</option>
                                <option value="2">Nie tolereuje glutenu</option>
                                <option value="3">Jestem wegeterianinem</option>
                                <option value="4">Jestem weganinem</option>
                            </select>
                            <div class="invalid-feedback">
                                Valid last name is required.
                            </div>
                        </div>
                    <hr class="my-4">
                    <button class="w-100 btn btn-primary btn-lg" type="submit">Sprawdź diete dla siebie</button>
                </form>
            </div>
            </div>
            </div>
    </main>
</div>
</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>
