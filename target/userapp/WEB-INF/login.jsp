<%--<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@page session="false" %>--%>
<html>
<head>
    <title>Gestion des utilisateurs | Login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

</head>
<body>
<main>
    <h2 class="text-center p-1 mt-4">Connexion</h2>
    <div class="mt-5 container col-5">
        <form action="/userapp" method="post">
            <div class="form-group">
                <label for="inputLogin">Login</label>
                <input type="text" class="form-control" id="inputLogin" name="login">
                <small id="loginHelp" class="form-text text-muted">Veuillez saisir un login</small>
            </div>
            <div class="form-group">
                <label for="InputPassword">Mot de passe</label>
                <input type="password" class="form-control" id="InputPassword" name="password">
            </div>
            <button type="submit" class="btn btn-primary">Se connecter</button>
            <div class="text-right mt-2">
                <a href="/userapp/?auth=addUser">Creer un compte</a>
            </div>
        </form>
    </div>
</main>
</body>