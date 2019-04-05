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
                        <h6 class="m-0 font-weight-bold text-primary">${mensaje.get("Estudiante")}</h6>
                    </div>
                    <!-- Card Body -->
                    <div style="font-size: 100%" class="card-body">
                        <c:if test="${not empty usu}">
                            <h5>${mensaje.get("nom:")}</h5>
                            ${usu.getNombre()}
                            <br/><br/>
                            <h5>${mensaje.get("doc:")}</h5>
                            ${usu.getIdentificacion()}
                            <br/><br/>
                            <h5>${mensaje.get("cor:")}</h5>
                            ${usu.getCorreo()}
                            <br/><br/>
                            <h5>${mensaje.get("con:")}</h5>
                            ${usu.getClave()}
                            <br/><br/>
                            <h5>${mensaje.get("matTri")}</h5>
                            <c:if test="${not empty usu.getMatriculas()}">
                                <table class="table" style="margin-top: -10px;width: auto;">
                                    <thead>
                                        <tr>
                                                   <th scope="col">${mensaje.get("Codigo")}</th>
                                                   <th scope="col">${mensaje.get("Nombre")}</th>
                                                   <th scope="col">${mensaje.get("Grupo")}</th>
                                               </tr>
                                    </thead>
                                    <tbody>
                                           <c:forEach items="${usu.getMatriculas()}" var="mat">
                                                   <tr>
                                                           <td><a href="./administrador_buscarMateria?id=${mat.getGrupo().getMateria().getId()}">${mat.getGrupo().getMateria().getId()}</a></td>
                                                           <td> ${mat.getGrupo().getMateria().getNombre()}</td>
                                                           <td><a href="./administrador_buscarGrupo?id=${mat.getGrupo().getMateria().getId()}&num=${mat.getGrupo().getNumero()}">${mat.getGrupo().getNumero()}</a></td>
                                                       </tr>
                                               </c:forEach>
                                        </tbody>
                                    </table>
                            </c:if>
                            <c:if test="${empty usu.getMatriculas()}">
                                ${mensaje.get("Ninguna")}
                            </c:if>
                            <br/><br/>
                            <form method="GET" action="./administrador_modificarEstudiante">
                                <input id="doc" name="doc" type="hidden" value="${usu.getIdentificacion()}">
                                <button type="submit" class="btn btn-primary">${mensaje.get("modi")}</button>
                            </form>
                            <br/>
                            <form method="POST" action="./administrador_buscarEstudiante">
                                <input id="doc" name="doc" type="hidden" value="${usu.getIdentificacion()}">
                                <button type="submit" class="btn btn-primary">${mensaje.get("elim")}</button>
                            </form>  
                        </c:if>
                        <c:if test="${empty usu}">
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
                        <form method="GET" action="./administrador_buscarEstudiante">
                            <div class="form-group">
                                <label for="ide">${mensaje.get("ideOCor")}</label>
                                <input type="text" class="form-control" id="id" name="id" placeholder="${mensaje.get("placeholderCorreo")}" required>
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

