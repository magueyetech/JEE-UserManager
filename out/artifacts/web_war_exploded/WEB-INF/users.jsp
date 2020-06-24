<html>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>

<%@ include file="head.html" %>
<body>
<%@ include file="nav.html" %>
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
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${requestScope.users}" var="user" xmlns:c="http://java.sun.com/jsp/jstl/core">
                        <tr>
                            <td>${user.id}</td>
                            <td>${user.login}</td>
                            <td>${user.prenom}</td>
                            <td>${user.nom}</td>
                            <td class="text-right">
                                <a href="/users?action=edit&id=${user.id}" class="btn btn-sm btn-info">Editer</a>
                                <a href="/users/?action=delete&id=${user.id}"
                                   class="btn btn-sm btn-danger">Supprimer</a>
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