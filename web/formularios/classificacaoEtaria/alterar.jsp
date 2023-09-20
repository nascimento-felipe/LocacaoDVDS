<%-- 
    Document   : alterar classificacao etaria
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
        <title>Alterar Classificação Etária</title>
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

                <h1 class="text-center text-light fw-bolder">Alterar Classificação Etária</h1>

                <form method="post" action="${cp}/processaClassificacaoEtaria">
                    <div class="container-fluid w-50 pt-5">
                        <div class="mb-3">
                            <div class="d-flex justify-content-center">
                                <input name="acao" type="hidden" value="alterar"/>
                                <input name="id" type="hidden" value="${requestScope.classificacaoEtaria.id}"/>

                                <table>
                                    <tr>
                                        <td class="text-light fw-bolder">Descrição:</td>
                                        <td>
                                            <input name="descricao"
                                                   type="text"
                                                   size="20"
                                                   maxlength="45"
                                                   value="${requestScope.classificacaoEtaria.descricao}"/>
                                        </td>
                                    </tr>
                                </table><br/>
                            </div>
                                        
                            <div class="text-center">
                                <br/>
                                <input class="btn btn-light" type="submit" value="Alterar"/>
                                <a class="btn btn-light" href="${cp}/formularios/classificacaoEtaria/listagem.jsp">Voltar</a>
                            </div>
                        </div>
                    </div>
                </form>
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
