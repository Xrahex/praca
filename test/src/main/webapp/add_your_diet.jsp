<%--
  Created by IntelliJ IDEA.
  User: Xrahex
  Date: 05.08.2023
  Time: 20:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <title>Dodaj własną diete</title>
</head>
<body>
<div class="row g-5">
    <div class="col-md-7 col-lg-8">
        <h4 class="mb-3">Dodaj własne produkty</h4>
        <form class="needs-validation" novalidate action="adddiet" method="post">
            <div class="col-12">
                <label>
                </label>
            </div>
            <div class="row g-3">
                <div class="col-sm-6">
                    <label for="productname" class="form-label">Nazwa produktu</label>
                    <input type="text" class="form-control" id="productname" name="productname" placeholder="" value="" required>
                    <div class="invalid-feedback">
                        Valid first name is required.
                    </div>
                </div>

                <div class="col-sm-6">
                    <label for="calorie" class="form-label">Wartość energetyczna</label>
                    <input type="number" class="form-control" id="calorie" name="calorie" placeholder="" value="" required>
                    <div class="invalid-feedback">
                        Valid last name is required.
                    </div>
                </div>
                <hr class="my-4">

                <button class="w-100 btn btn-primary btn-lg" type="submit">Continue to checkout</button>
            </div>
        </form>
    </div>
</body>
</html>
