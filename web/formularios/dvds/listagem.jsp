<%-- 
    Document   : listagem de dvds
    Created on : 16 de set. de 2023, 16:46:16
    Author     : lama
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<c:set var="prefixo" value="processaDvd?acao=preparar"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de Dvds</title>
    </head>
    <body>
        <h1>Listagem de Dvds</h1>

        <p>
            <a href="${cp}/formularios/dvds/novo.jsp">
                Novo Dvd
            </a>
        </p>

        <table border="1">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Titulo</th>
                    <th>Ano de Lançamento</th>
                    <th>Ator Principal</th>
                    <th>Ator Coadjuvante</th>
                    <th>Data de Lançamento</th>
                    <th>Duração em minutos</th>
                    <th>Classificação Etária</th>
                    <th>Gênero do Filme</th>
                    <th>Alterar</th>
                    <th>Excluir</th>
                </tr>
            </thead>
            <tbody>
                <jsp:useBean
                    id="servicos"
                    scope="page"
                    class="locacaodvds.servicos.DvdServices"
                    >

                    <c:forEach items="${servicos.todos}" var="dvd">
                        <tr>
                            <td>${dvd.id}</td>
                            <td>${dvd.titulo}</td>
                            <td>${dvd.anoLancamento}</td>
                            <td>${dvd.atorPrincipal.nome}</td>
                            <td>${dvd.atorCoadjuvante.nome}</td>
                            <td>${dvd.dataLancamento}</td>
                            <td>${dvd.duracaoMinutos}</td>
                            <td>${dvd.classificacaoEtaria.descricao}</td>
                            <td>${dvd.genero.descricao}</td>
                            <td>
                                <a href="${cp}/${prefixo}Alteracao&id=${dvd.id}">
                                    Alterar
                                </a>
                            </td>
                            <td>
                                <a href="${cp}/${prefixo}Exclusao&id=${dvd.id}">
                                    Excluir
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </jsp:useBean>
            </tbody>
        </table>

        <p>
            <a href="${cp}/formularios/dvds/novo.jsp">
                Novo Dvd
            </a>
        </p>

        <p>
            <a href="${cp}/index.jsp">
                Tela Principal
            </a>
        </p>
    </body>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

</html>
