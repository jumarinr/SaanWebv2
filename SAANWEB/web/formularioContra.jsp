<%-- 
    Document   : formularioContra
    Created on : 26/03/2019, 11:27:22 PM
    Author     : juann
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>${mensaje.get("olvido")}</title>

        <!-- Custom fonts for this template-->
        <link href="dashboard/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="dashboard/css/sb-admin-2.min.css" rel="stylesheet">

    </head>

    <body class="bg-gradient-primary">

        <div class="container">

            <!-- Outer Row -->
            <div class="row justify-content-center">

                <div class="col-xl-10 col-lg-12 col-md-9">

                    <div class="card o-hidden border-0 shadow-lg my-5">
                        <div class="card-body p-0">
                            <!-- Nested Row within Card Body -->
                            <div class="row">
                                <div style="width: auto; margin-left: 5%; margin-top: 5%">
                                    <img src="https://i.pinimg.com/originals/f8/0a/78/f80a78a4dc129a91f1eed44691c3870a.gif">
                                </div>
                                <div class="col-lg-6">
                                    <div class="p-5">
                                        <div class="text-center">
                                            <h1 class="h4 text-gray-900 mb-2">${mensaje.get("olvido2")}</h1>
                                            <p class="mb-4">${mensaje.get("dataRec")}</p>
                                        </div>
                                        <c:if test="${not empty codigo}">
                                            <form action="./formularioContra" method="POST"  class="user">
                                                <div class="form-group">
                                                    <input type="text" class="form-control form-control-user"name="codigoO" id="codigoO" aria-describedby="emailHelp" placeholder="${mensaje.get("codigoO")}">
                                                </div>
                                                <div class="form-group">
                                                    <input type="password" class="form-control form-control-user"name="Pass" id="Pass" aria-describedby="emailHelp" placeholder="${mensaje.get("contreaNew")}">
                                                </div>
                                                <div class="form-group">
                                                    <input type="password" class="form-control form-control-user"name="confirmPas" id="confirmPas" aria-describedby="emailHelp" placeholder="${mensaje.get("contraConfirm")}">
                                                </div>
                                                <input type="submit"  value="${mensaje.get("generarCodigo")}" class="btn btn-primary btn-user btn-block"/>
                                            </form>
                                        </c:if>
                                        <c:if test="${not empty error}">
                                            <p>${error}</p>
                                        </c:if>
                                        <hr>
                                        <div class="text-center">
                                            <a class="small" href="./login">${mensaje.get("yaCuenta")}</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                <%@ include file="footer.jsp" %>