<%--
  Created by IntelliJ IDEA.
  User: Xrahex
  Date: 05.07.2023
  Time: 14:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <title>Title</title>
</head>
<body>
<section class="vh-100 gradient-custom">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                <div class="card bg-dark text-white" style="border-radius: 1rem;">
                    <div class="card-body p-5 text-center">

                        <form class="mx-1 mx-md-4" action="signIn" method="post">
                        <div class="mb-md-5 mt-md-4 pb-5">

                            <h2 class="fw-bold mb-2 text-uppercase">Logowanie</h2>
                            <p class="text-white-50 mb-5">Wpisz swoje hasło i login!</p>

                            <div class="form-outline form-white mb-4">
                                <input type="email" id="email" name="email" class="form-control form-control-lg" />
                                <label class="form-label" for="email">Email</label>
                            </div>

                            <div class="form-outline form-white mb-4">
                                <input type="password" id="password" name="password" class="form-control form-control-lg" />
                                <label class="form-label" for="password">Password</label>
                            </div>

                            <p class="small mb-5 pb-lg-2"><a class="text-white-50" href="#">Nie pamiętasz hasła?</a></p>

                            <button class="btn btn-outline-light btn-lg px-5" type="submit">Zaloguj</button>
                        </div>

                        <div>
                            <p class="mb-0">Nie masz konta? <a href="signup.jsp" class="text-white-50 fw-bold">Zarejestruj</a>
                            </p>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>
