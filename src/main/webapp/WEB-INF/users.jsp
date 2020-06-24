<html>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="head.html" %>
<body>
<%@ include file="nav.jsp" %>
<main>
    <div class="container-fluid py-3">
        <section class="container">
            <h2>Liste des utilisateurs</h2>
            <div class="table-responsive">
                <table class="table">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Login</th>
                        <th>Prenom</th>
                        <th>Nom</th>
                        <th>Profil</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${requestScope.users}" var="user">
                        <tr>
                            <td>${user.id}</td>
                            <td>${user.login}</td>
                            <td>${user.prenom}</td>
                            <td>${user.nom}</td>
                            <td>${user.profil}</td>
                            <td class="text-right">
                                <c:if test="${sessionScope.user.profil == 'ADMIN'}">
                                    <a href="/userapp/users?page=edit&id=${user.id}"
                                       class="btn btn-sm btn-info">Editer</a>
                                </c:if>
                                <c:if test="${sessionScope.user.profil == 'ADMIN'}">
                                    <a href="/userapp/users?page=delete&id=${user.id}"
                                       class="btn btn-sm btn-danger"
                                       onclick="return confirm('Veuillez confirmer la suppression')">Supprimer</a>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </section>
    </div>
</main>
</body>
<%@ include file="footer.html" %>
</html>