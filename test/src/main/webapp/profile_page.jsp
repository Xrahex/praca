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


    <style>
        .container {
            position: center;
        }
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }

        .b-example-divider {
            width: 100%;
            height: 3rem;
            background-color: rgba(0, 0, 0, .1);
            border: solid rgba(0, 0, 0, .15);
            border-width: 1px 0;
            box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
        }

        .b-example-vr {
            flex-shrink: 0;
            width: 1.5rem;
            height: 100vh;
        }

        .bi {
            vertical-align: -.125em;
            fill: currentColor;
        }

        .nav-scroller {
            position: relative;
            z-index: 2;
            height: 2.75rem;
            overflow-y: hidden;
        }

        .nav-scroller .nav {
            display: flex;
            flex-wrap: nowrap;
            padding-bottom: 1rem;
            margin-top: -1px;
            overflow-x: auto;
            text-align: center;
            white-space: nowrap;
            -webkit-overflow-scrolling: touch;
        }
    </style>


    <!-- Custom styles for this template -->
    <link href="checkout.css" rel="stylesheet">
</head>
<body class="bg-body-tertiary">
<div class="container">
    <main>
        <div class="py-5 text-center">
            <h2>Na początku uzupełnij swoje dane!</h2>
            <p class="lead"></p>
        </div>
        <div class="row g-5">
            <div class="col-md-7 col-lg-8">
                <h4 class="mb-3">Dane adresowe</h4>
                <form class="needs-validation" novalidate action="changepersonals" method="post">
                    <div class="row g-3">
                        <div class="col-sm-6">
                            <label for="firstName" class="form-label">Imie</label>
                            <input type="text" class="form-control" id="firstName" name="firstName" placeholder="" value="" required>
                            <div class="invalid-feedback">
                                Valid first name is required.
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <label for="lastName" class="form-label">Nazwisko</label>
                            <input type="text" class="form-control" id="lastName" name="lastName" placeholder="" value="" required>
                            <div class="invalid-feedback">
                                Valid last name is required.
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <label class="fw-bold mt-2 mb-1" for="plec">Płeć</label><br>
                            <select name="plec" id="plec">
                                <option value="kobieta">Kobieta</option>
                                <option value="mezczyzna">Mężczyzna</option>
                            </select>
                            <div class="invalid-feedback">
                                Valid last name is required.
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <label for="aktualna_waga" class="form-label">Aktualna waga</label>
                            <input type="text" class="form-control" id="aktualna_waga" name="aktualna_waga" placeholder="" value="" required>
                            <div class="invalid-feedback">
                                Valid last name is required.
                            </div>
                        </div>
                            <div class="col-sm-6">
                                <label for="waga_docelowa" class="form-label">Waga docelowa</label>
                                <input type="text" class="form-control" id="waga_docelowa" name="waga_docelowa" placeholder="" value="" required>
                                <div class="invalid-feedback">
                                    Valid last name is required.
                                </div>
                        </div>
                        <div class="col-sm-6">
                            <label for="wzrost" class="form-label">Wzrost</label>
                            <input type="text" class="form-control" id="wzrost" name="wzrost" placeholder="" value="" required>
                            <div class="invalid-feedback">
                                Valid last name is required.
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <label for="wiek" class="form-label">Wiek</label>
                            <input type="text" class="form-control" id="wiek" name="wiek" placeholder="" value="" required>
                            <div class="invalid-feedback">
                                Valid last name is required.
                            </div>
                        </div>
                        <div>

                        </div>
                        <div class="col-sm-6">
                            <label class="fw-bold mt-2 mb-1" for="aktywnosc_fizyczna">Aktywność fizyczna w pracy</label><br>
                            <select name="aktywnosc_fizyczna" id="aktywnosc_fizyczna">
                                <option value="0">bardzo lekka, np. siedzę przed komputerem większą część dnia lub jestem kierowcą</option>
                                <option value="1">lekka, np. lekka praca przemysłowa, sprzedaż lub praca biurowa obejmująca lekkie czynności </option>
                                <option value="2">umiarkowana, np. sprzątanie, praca w kuchni lub dostarczanie poczty pieszo lub rowerem</option>
                                <option value="3">ciężka, np. ciężka praca przemysłowa, prace budowlane lub rolnictwo. </option>
                            </select>
                        </div>
                        <div>

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
                        <div>
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
                    </div>
                </form>
            </div>
        </div>
    </main>

    <footer class="my-5 pt-5 text-body-secondary text-center text-small">
    </footer>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<script src="checkout.js"></script></body>
</html>
