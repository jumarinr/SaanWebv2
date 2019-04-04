<%-- 
    Document   : formularioContra
    Created on : 26/03/2019, 11:27:22 PM
    Author     : juann
--%>

       <%@ include file="header2.jsp" %>

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
                                    <img src="https://media1.tenor.com/images/143b3d73aa2befc2e8444ebe008b75d1/tenor.gif?itemid=8498049">
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
                                                <input type="submit"  value="${mensaje.get("infoEnv")}" class="btn btn-primary btn-user btn-block"/>
                                            </form>
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