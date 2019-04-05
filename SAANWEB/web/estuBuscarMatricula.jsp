<%@ include file="headerEstu.jsp" %>

<!-- Main Content -->
<div id="content" style="font-size: auto;">

    <!-- Begin Page Content -->
    <div class="container-fluid">


        <!-- Content Row -->
        <div class="row">

            <!-- Area Chart -->
            <div class="col-xl-8 col-lg-7">
                <div class="card shadow mb-4">
                    <!-- Card Header - Dropdown -->
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h6 class="m-0 font-weight-bold text-primary">${mensaje.get("matr")}</h6>
                    </div>
                    <!-- Card Body -->
                    <div style="font-size: 100%" class="card-body">
                        <c:if test="${not empty Matr}">
                            <h5>${mensaje.get("notF")}:</h5>
                            ${Matr.getNotaFinal()}
                            <br/><br/>
                            <h5>${mensaje.get("sem")}:</h5>
                            ${Matr.getSemestre()}
                            <br/><br/>
                            <h5>${mensaje.get("gru")}:</h5>
                            ${Matr.getGrupo().getNumero()}
                            <br/><br/>
                            <h5>${mensaje.get("Not")}s</h5>
                            <c:if test="${not empty Matr.getNotas()}">
                                    <table class="table" style="margin-top: -10px;width: 100%;">
                                        <thead>
                                            <tr>
                                                    <th scope="col">${mensaje.get("por")}</th>
                                                    <th scope="col">${mensaje.get("Id")}</th>
                                                    <th scope="col">${mensaje.get("val")}</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${Matr.getNotas()}" var="Not">
                                                   <tr>
                                                           <td>${Not.getPorcentaje()}</td>
                                                           <td> ${Not.getId()}</td>
                                                           <td>${Not.getValor()}</a></td>
                                                       </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                            </c:if>
                            <c:if test="${empty Matr.getNotas()}">
                                Ninguna
                            </c:if>
                            <br/><br/>
                            <form method="GET" action="./estuModificarMatricula">
                                <input id="doc" name="doc" type="hidden" value="${Matr.getEstudiante().getIdentificacion()}">
                                <input id="mat" name="mat" type="hidden" value="${Matr.getGrupo().getMateria().getId()}">
                                <button type="submit" class="btn btn-primary">${mensaje.get("modr")}</button>
                            </form>
                            <br/>
                            <form method="POST" action="./estuBuscarMatricula">
                                <input id="doc" name="doc" type="hidden" value="${Matr.getEstudiante().getIdentificacion()}">
                                <input id="idM" name="idM" type="hidden" value="${Matr.getGrupo().getMateria().getId()}">
                                <button type="submit" class="btn btn-primary">${mensaje.get("elir")}</button>
                            </form>  
                        </c:if>        
                         <c:if test="${empty Matr}">
                            No encontrado    
                        </c:if>
                    </div>
                </div>
            </div>
            
            <div class="col-xl-4 col-lg-5">
                <div class="card shadow mb-4">
                    <!-- Card Header - Dropdown -->
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h6 class="m-0 font-weight-bold text-primary">${mensaje.get("bus")}</h6>

                    </div>
                    <!-- Card Body -->
                    <div class="card-body">
                        <c:if test="${not empty usua}">
                            <form method="GET" action="./estuBuscarMatricula">
                                <div class="form-group">
                                    <label for="ide">${mensaje.get("Doc")}</label>
                                    <h6>${usua.getIdentificacion()}</h6>
                                </div>
                                <div class="form-group">
                                    <label for="ide">${mensaje.get("idmat")}</label>
                                    <input type="text" class="form-control" id="idM" name="idM" placeholder="${mensaje.get("inmat")}" required>
                                </div>
                                <input id="doc" name="doc" type="hidden" value="${usua.getIdentificacion()}">
                                <button type="submit" class="btn btn-primary">${mensaje.get("bus")}</button>
                            </form>   
                        </c:if>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<!-- Footer -->
<%@ include file="footer.jsp" %>

