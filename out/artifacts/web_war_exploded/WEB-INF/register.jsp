<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html xmlns:layout="http://www.w3.org/1999/xhtml" xmlns:th="http://www.w3.org/1999/xhtml">
<head>
    <title>Gestion des utilisateurs | Nouvel utilisateur</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

</head>
<body>
<main>
    <div class="container mt-5">
        <form action="/app/" method="post">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="inputLogin">Login</label>
                        <input type="text" class="form-control" id="inputLogin" name="login">
                        <small id="loginHelp" class="form-text text-muted">Veuillez saisir un login</small>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="InputPassword">Mot de passe</label>
                        <input type="password" class="form-control" id="InputPassword" name="password">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="inputPrenom">Prenom</label>
                        <input type="text" class="form-control" id="inputPrenom" name="prenom">
                        <small id="prenomHelp" class="form-text text-muted">Veuillez saisir un prenom</small>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="InputNom">Nom</label>
                        <input type="text" class="form-control" id="InputNom" name="nom">
                    </div>
                </div>
            </div>
            <button type="submit" class="btn btn-primary">Creer</button>
        </form>
    </div>
</main>
</body>