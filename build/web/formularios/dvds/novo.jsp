<%-- 
    Document   : novo
    Created on : 16 de set. de 2023, 16:46:27
    Author     : lama
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Novo Dvd</title>
    </head>
    <body>
        <h1>Novo Dvd</h1>

        <form method="post" action="${cp}/processaDvd">

            <input name="acao" type="hidden" value="inserir"/>

            <table>
                <tr>
                    <td>Titulo:</td>
                    <td>
                        <input name="titulo"
                               type="text"
                               size="20"
                               maxlength="45"
                               required />
                    </td>
                </tr>
                <tr>
                    <td>Ano de Lançamento:</td>
                    <td>
                        <input name="anoLancamento"
                               type="text"
                               size="20"
                               maxlength="45"
                               required />
                    </td>
                </tr>
                <tr>
                    <td>Ator Principal:</td>
                    <td>
                        <jsp:useBean id="servicos"
                                     scope="page"
                                     class="locacaodvds.servicos.AtorServices"/>
                        <select name="atorPrincipal" id="atorPrincipal" required >
                            <c:forEach items="${servicos.todos}" var="ap">
                                <option value="${ap.id}">
                                    ${ap.nome}
                                </option>
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
                            <c:forEach items="${servicos2.todos}" var="ac">
                                <option value="${ac.id}">
                                    ${ac.nome}
                                </option>
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
                               required/>
                    </td>
                </tr>
                <tr>
                    <td>Duração em Minutos:</td>
                    <td>
                        <input name="duracaoMinutos"
                               type="text"
                               size="20"
                               maxlength="45"
                               required/>
                    </td>
                </tr>
                <tr>
                    <td>Classificação Etária:</td>
                    <td>
                        <jsp:useBean id="servicos3"
                                     scope="page"
                                     class="locacaodvds.servicos.ClassificacaoEtariaService"/>
                        <select id="classificacaoEtaria" name="classificacaoEtaria" required>
                            <c:forEach items="${servicos3.todos}" var="ce">
                                <option value="${ce.id}">
                                    ${ce.descricao}
                                </option>
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
                            <c:forEach items="${servicos4.todos}" var="g">
                                <option value="${g.id}">
                                    ${g.descricao}
                                </option>
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
