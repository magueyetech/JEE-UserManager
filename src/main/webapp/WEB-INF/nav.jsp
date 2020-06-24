<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="#">Gestion des utilisateurs</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="/userapp/users">Liste <span class="sr-only">(current)</span></a>
                </li>
                <c:if test="${sessionScope.user.profil == 'ADMIN'}">
                    <li class="nav-item">
                        <a class="nav-link" href="/userapp/?auth=addUser">Nouveau</a>
                    </li>
                </c:if>
            </ul>
        </div>
        <c:if test="${!empty sessionScope.user}">
                <span class="navbar-text">
                        ${sessionScope.user.login} (${sessionScope.user.profil})
                    <a href="/userapp/?page=logout">Déconnexion</a>
                </span>
        </c:if>
    </div>
</nav>