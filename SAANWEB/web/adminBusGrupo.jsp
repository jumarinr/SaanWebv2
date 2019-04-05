<%-- 
    Document   : adminBusEstudiante
    Created on : 24/03/2019, 04:49:15 PM
    Author     : Juan Pablo
--%>

<%@ include file="headerAdm.jsp" %>

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
                        <h6 class="m-0 font-weight-bold text-primary">Grupo</h6>
                    </div>
                    <!-- Card Body -->
                    <div style="font-size: 100%" class="card-body">
                        <c:if test="${not empty gru}">
                            <h5>${mensaje.get("Numero")}:</h5>
                            ${gru.getNumero()}
                            <br/><br/>
                            <h5>${mensaje.get("Idmat")}</h5>
                            ${gru.getMateria().getId()}
                            <br/><br/>
                            <h5>${mensaje.get("nomMat")}</h5>
                            ${gru.getMateria().getNombre()}
                            <br/><br/>
                            <h5>${mensaje.get("idProf")}</h5>
                            ${gru.getProfesor().getIdentificacion()}
                            <br/><br/>
                            <h5>${mensaje.get("nomProf")}</h5>
                            ${gru.getProfesor().getNombre()}
                            <br/><br/>
                            <h5>${mensaje.get("Estudiante")}:</h5>
                            <c:if test="${not empty gru.getMatriculas()}">
                                <table class="table" style="margin-top: -10px;width: auto;">
                                    <thead>
                                        <tr>
                                                   <th scope="col">${mensaje.get("ideti")}</th>
                                                   <th scope="col">${mensaje.get("Materia")}</th>
                                            <th scope="col">${mensaje.get("notaFi")}</th>
                                               </tr>
                                    </thead>
                                    <tbody>
                                           <c:forEach items="${gru.getMatriculas()}" var="mat">
                                                   <tr>
                                                           <td><a href="./administrador_buscarEstudiante?id=${mat.getEstudiante().getIdentificacion()}">${mat.getEstudiante().getIdentificacion()}</a></td>
                                                <td>${mat.getEstudiante().getNombre()}</td>
                                                <td>${mat.getNotaFinal()}</td>
                                                       </tr>
                                               </c:forEach>
                                        </tbody>
                                    </table>
                            </c:if>
                            <c:if test="${empty gru.getMatriculas()}">
                                ${mensaje.get("Ninguna")}
                            </c:if>
                            <br/><br/>
                            <form method="GET" action="./administrador_modificarGrupo">
                                <input id="id" name="id" type="hidden" value="${gru.getMateria().getId()}">
                                <input id="num" name="num" type="hidden" value="${gru.getNumero()}">
                                <button type="submit" class="btn btn-primary">${mensaje.get("modi")}</button>
                            </form>
                            <br/>
                            <form method="POST" action="./administrador_buscarGrupo">
                                <input id="id" name="id" type="hidden" value="${gru.getMateria().getId()}">
                                <input id="num" name="num" type="hidden" value="${gru.getNumero()}">
                                <button type="submit" class="btn btn-primary">${mensaje.get("elim")}</button>
                            </form>  
                        </c:if>
                        <c:if test="${empty gru}">
                           ${mensaje.get("noEnc")}   
                        </c:if>
                    </div>
                </div>
            </div>

            <!-- Pie Chart -->
            <div class="col-xl-4 col-lg-5">
                <div class="card shadow mb-4">
                    <!-- Card Header - Dropdown -->
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h6 class="m-0 font-weight-bold text-primary">${mensaje.get("busq")}</h6>

                    </div>
                    <!-- Card Body -->
                    <div class="card-body">
                        <form method="GET" action="./administrador_buscarGrupo">
                            <div class="form-group">
                                <div class="form-group">
                                    <label for="ide">${mensaje.get("Idmat")}</label>
                                    <input type="number" class="form-control" id="id" name="id" placeholder="Ingrese el id de la materia" required>
                                </div>
                                <div class="form-group">
                                    <label for="ide">${mensaje.get("Numero")} ${mensaje.get("Grupo")}:</label>
                                    <input type="number" class="form-control" id="num" name="num" placeholder="Ingrese el numero del grupo" required>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary">${mensaje.get("busc")}</button>
                        </form>                    
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

