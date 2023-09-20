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
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Simple line icons-->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.5.5/css/simple-line-icons.min.css" rel="stylesheet" />
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css" />
        
    </head>
    <body>
        
        <div class="bg-image d-flex justify-content-center" style="background-image: url('pics/claquete.jpg'); height: 100vh; background-size: cover;">
        
            <div class="container-sm d-flex flex-column justify-content-center w-50">
                <h1 class="text-center text-light fw-bolder">Sistema para Cadastro de Dvds<br/><br/><br/></h1>
                <a class="btn btn-light btn-lg fw-bolder" href="${cp}/formularios/generos/listagem.jsp" role="button">Gênero</a><br/>
                <a class="btn btn-light btn-lg fw-bolder" href="${cp}/formularios/classificacaoEtaria/listagem.jsp" role="button">Classificação Etária</a><br/>
                <a class="btn btn-light btn-lg fw-bolder" href="${cp}/formularios/atores/listagem.jsp" role="button">Ator</a><br/>
                <a class="btn btn-light btn-lg fw-bolder" href="${cp}/formularios/dvds/listagem.jsp" role="button">DVD</a>
            </div>
            
        </div>
        
            
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>

        <!-- Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

    </body>
</html>
