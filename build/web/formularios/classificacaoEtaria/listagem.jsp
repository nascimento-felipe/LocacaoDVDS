<%-- 
    Document   : listagem de classificacao
    Created on : 16 de set. de 2023, 16:46:16
    Author     : lama
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<c:set var="prefixo" value="processaClassificacaoEtaria?acao=preparar"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de classificações</title>
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
        
        <div class="bg-image d-flex flex-column justify-content-center" style="background-image: url('../../pics/claquete.jpg'); height: 100vh; background-size: cover;">
            <div class="container-sm d-flex flex-column justify-content-center w-50">
                <h1 class="text-center text-light fw-bolder">Listagem de Classificações<br/><br/><br/></h1>
            
                <table class="table table-dark table-striped-columns bdr">
                    <thead>
                        <tr class="table-light">
                            <th>Id</th>
                            <th>Descrição</th>
                            <th>Alterar</th>
                            <th>Excluir</th>
                        </tr>
                    </thead>
                    <tbody>
                        <jsp:useBean
                            id="servicos"
                            scope="page"
                            class="locacaodvds.servicos.ClassificacaoEtariaService"
                            >

                            <c:forEach items="${servicos.todos}" var="ce">
                                <tr>
                                    <td>${ce.id}</td>
                                    <td>${ce.descricao}</td>
                                    <td>
                                        <a href="${cp}/${prefixo}Alteracao&id=${ce.id}">
                                            Alterar
                                        </a>
                                    </td>
                                    <td>
                                        <a href="${cp}/${prefixo}Exclusao&id=${ce.id}">
                                            Excluir
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </jsp:useBean>
                    </tbody>
                </table>
            </div>
                
            <div class="container-sm w-50">
                <br/>
                <a class="btn btn-light btn fw-bolder" href="${cp}/formularios/classificacaoEtaria/novo.jsp">Nova Classificação Etária</a>
                <br/><br/>
                <a class="btn btn-light btn fw-bolder" href="${cp}/index.jsp">Tela Principal</a>
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
