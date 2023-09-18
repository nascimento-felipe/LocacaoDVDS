<%-- 
    Document   : index
    Created on : 16 de set. de 2023, 17:19:44
    Author     : lama
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistema para Cadastro de Dvds</title>
    </head>
    <body>
        <h1>Sistema para Cadastro de Dvds</h1>
        
        <p>
            <a href="${cp}/formularios/generos/listagem.jsp">Gênero</a>
        </p>
        <p>
            <a href="${cp}/formularios/classificacaoEtaria/listagem.jsp">Classificação Etária</a>
        </p>
        <p>
            <a href="${cp}/formularios/atores/listagem.jsp">Ator</a>
        </p>
        <p>
            <a href="${cp}/formularios/dvds/listagem.jsp">Dvd</a>
        </p>
    </body>
</html>
