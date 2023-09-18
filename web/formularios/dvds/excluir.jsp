<%-- 
    Document   : excluir
    Created on : 16 de set. de 2023, 16:46:34
    Author     : lama
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Excluir Dvd</title>
    </head>
    <body>
        <h1>Excluir Dvd</h1>

        <form method="post" action="${cp}/processaDvd">

            <input name="acao" type="hidden" value="excluir"/>
            <input name="id" type="hidden" value="${requestScope.dvd.id}"/>

            <table>
                <tr>
                    <td>Titulo:</td>
                    <td>${requestScope.dvd.titulo}</td>
                </tr>
                <tr>
                    <td>Ano de Lançamento:</td>
                    <td>${requestScope.dvd.anoLancamento}</td>
                </tr>
                <tr>
                    <td>Ator Principal:</td>
                    <td>${requestScope.dvd.atorPrincipal.nome}</td>
                </tr>
                <tr>
                    <td>Ator Coadjuvante:</td>
                    <td>${requestScope.dvd.atorCoadjuvante.nome}</td>
                </tr>
                <tr>
                    <td>Data de Lançamento:</td>
                    <td>${requestScope.dvd.dataLancamento}</td>
                </tr>
                <tr>
                    <td>Duração em minutos:</td>
                    <td>${requestScope.dvd.duracaoMinutos}</td>
                </tr>
                <tr>
                    <td>Classificação Etária:</td>
                    <td>${requestScope.dvd.classificacaoEtaria.descricao}</td>
                </tr>
                <tr>
                    <td>Gênero:</td>
                    <td>${requestScope.dvd.genero.descricao}</td>
                </tr>
                <tr>
                    <td>
                        <a href="${cp}/formularios/dvds/listagem.jsp">
                            Voltar
                        </a>
                    </td>
                    <td>
                        <input type="submit" value="Excluir"/>
                    </td>
                </tr>
            </table>

        </form>
    </body>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</html>
