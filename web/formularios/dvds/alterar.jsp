<%-- 
    Document   : alterar Dvd
    Created on : 16 de set. de 2023, 16:47:03
    Author     : lama
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Dvd</title>
    </head>
    <body>
        <h1>Alterar Dvd</h1>

        <form method="post" action="${cp}/processaDvd">

            <input name="acao" type="hidden" value="alterar"/>
            <input name="id" type="hidden" value="${requestScope.dvd.id}"/>

            <table>
                <tr>
                    <td>Titulo:</td>
                    <td>
                        <input name="titulo"
                               type="text"
                               size="20"
                               maxlength="45"
                               required
                               value="${requestScope.dvd.titulo}"/>
                    </td>
                </tr>
                <tr>
                    <td>Ano de Lançamento:</td>
                    <td>
                        <input name="anoLancamento"
                               type="text"
                               size="20"
                               maxlength="45"
                               required 
                               value="${requestScope.dvd.anoLancamento}"/>
                    </td>
                </tr>
                <tr>
                    <td>Ator Principal:</td>
                    <td>
                        <jsp:useBean id="servicos"
                                     scope="page"
                                     class="locacaodvds.servicos.AtorServices"/>
                        <select name="atorPrincipal" id="atorPrincipal"  required >
                            <c:forEach items="${servicos.todos}" var="ator">
                                <c:choose>
                                    <c:when test="${requestScope.dvd.atorPrincipal.id eq ator.id}">
                                        <option value="${ator.id}" selected>
                                            ${ator.nome}
                                        </option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${ator.id}">
                                            ${ator.nome}
                                        </option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Ator Coadjuvante:</td>
                    <td>
                        <jsp:useBean id="servicos2"
                                     scope="page"
                                     class="locacaodvds.servicos.AtorServices"/>
                        <select id="atorCoadjuvante" name="atorCoadjuvante" required>
                            <c:forEach items="${servicos2.todos}" var="ator">
                                <c:choose>
                                    <c:when test="${requestScope.dvd.atorCoadjuvante.id eq ator.id}">
                                        <option value="${ator.id}" selected>
                                            ${ator.nome}
                                        </option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${ator.id}">
                                            ${ator.nome}
                                        </option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Data de Lancamento:</td>
                    <td>
                        <input name="dataLancamento"
                               type="date"
                               size="20"
                               maxlength="45"
                               required 
                               value="${requestScope.dvd.dataLancamento}" />
                    </td>
                </tr>
                <tr>
                    <td>Duração em Minutos:</td>
                    <td>
                        <input name="duracaoMinutos"
                               type="text"
                               size="20"
                               maxlength="45"
                               required
                               value="${requestScope.dvd.duracaoMinutos}"/>
                    </td>
                </tr>
                <tr>
                    <td>Classificação Etária:</td>
                    <td>
                        <jsp:useBean id="servicos3"
                                     scope="page"
                                     class="locacaodvds.servicos.ClassificacaoEtariaService"/>
                        <select id="classificacaoEtaria" name="classificacaoEtaria" required>
                            <c:forEach items="${servicos3.todos}" var="classificacaoEtaria">
                                <c:choose>
                                    <c:when test="${requestScope.dvd.classificacaoEtaria.id eq classificacaoEtaria.id}">
                                        <option value="${classificacaoEtaria.id}" selected>
                                            ${classificacaoEtaria.descricao}
                                        </option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${classificacaoEtaria.id}">
                                            ${classificacaoEtaria.descricao}
                                        </option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Gênero do Filme:</td>
                    <td>
                        <jsp:useBean id="servicos4"
                                     scope="page"
                                     class="locacaodvds.servicos.GeneroServices"/>
                        <select id="genero" name="genero" required>
                            <c:forEach items="${servicos4.todos}" var="genero">
                                <c:choose>
                                    <c:when test="${requestScope.dvd.genero.id eq genero.id}">
                                        <option value="${genero.id}" selected>
                                            ${genero.descricao}
                                        </option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${genero.id}">
                                            ${genero.descricao}
                                        </option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="${cp}/formularios/dvds/listagem.jsp">
                            Voltar
                        </a>
                    </td>
                    <td>
                        <input type="submit" value="Salvar"/>
                    </td>
                </tr>
            </table>

        </form>
    </body>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</html>
