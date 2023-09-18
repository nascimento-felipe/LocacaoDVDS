<%-- 
    Document   : novo ator
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
        <title>Novo Ator</title>
    </head>
    <body>
        <h1>Novo Ator</h1>

        <form method="post" action="${cp}/processaAtor">
            <input name="acao" type="hidden" value="inserir"/>

            <table>
                <tr>
                    <td>Nome:</td>
                    <td>
                        <input name="nome"
                               type="text"
                               size="20"
                               maxlength="45"
                               required/>
                    </td>
                </tr>
                <tr>
                    <td>Sobrenome:</td>
                    <td>
                        <input name="sobrenome"
                               type="text"
                               size="20"
                               maxlength="45"
                               required/>
                    </td>
                </tr>
                <tr>
                    <td>Data de Estreia:</td>
                    <td>
                        <input name="dataEstreia"
                               type="date"
                               size="20"
                               maxlength="45"
                               required/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="${cp}/formularios/atores/listagem.jsp">
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
