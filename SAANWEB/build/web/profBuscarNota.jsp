<%-- 
    Document   : profBuscarNota
    Created on : 27/03/2019, 01:44:36 AM
    Author     : pipel
--%>

<%@ include file="headerProf.jsp" %>

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
                        <h6 class="m-0 font-weight-bold text-primary">${mensaje.get("notprof")}</h6>
                    </div>
                    <!-- Card Body -->
                    <div style="font-size: 100%" class="card-body">
                        <c:if test="${not empty Not}">
                            <h5>${mensaje.get("idprof")}</h5>
                            ${Not.getId()}
                            <br/><br/>
                            <h5>${mensaje.get("valprof")}</h5>
                            ${Not.getValor()}
                            <br/><br/>
                            <h5>${mensaje.get("porcenprof")}</h5>
                            ${Not.getPorcentaje()}
                            <br/><br/>                                                        
                            <form method="GET" action="./modnota">                                
                                <input id="id" name="id" type="hidden" value="${Not.getId()}">
                                <input id="grupo" name="grupo" type="hidden" value="${Not.getMatricula().getGrupo().getNumero()}">
                                <input id="materia" name="materia" type="hidden" value="${Not.getMatricula().getGrupo().getMateria().getId()}">
                                <input id="estudiante" name="estudiante" type="hidden" value="${Not.getMatricula().getEstudiante().getIdentificacion()}">
                                <button type="submit" class="btn btn-primary">${mensaje.get("modprof")}</button>
                            </form>
                            <br/>
                            <form method="POST" action="./buscarnota" onsubmit="notify()">
                                <input id="id" name="id" type="hidden" value="${Not.getId()}">
                                <input id="materia" name="materia" type="hidden" value="${Not.getMatricula().getGrupo().getMateria().getId()}">
                                <input id="grupo" name="grupo" type="hidden" value="${Not.getMatricula().getGrupo().getNumero()}">
                                <input id="estudiante" name="estudiante" type="hidden" value="${Not.getMatricula().getEstudiante().getIdentificacion()}">
                                <button type="submit" class="btn btn-primary">${mensaje.get("delprof")}</button>
                            </form>  
                        </c:if>
                        <c:if test="${empty Not}">
                            ${mensaje.get("notfound")}    
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
                        <form method="GET" action="./buscarnota">
                            <div class="form-group">
                                <label for="id">${mensaje.get("iddprof")}</label>
                                <input type="text" class="form-control" id="id" name="id" placeholder="${mensaje.get("plidprof")}" required>
                            </div>
                            <div class="form-group">
                                <label for="materia">${mensaje.get("idmatprof")}</label>
                                <input type="text" class="form-control" id="materia" name="materia" placeholder="${mensaje.get("plidmatprof")}" required>
                            </div>
                            <div class="form-group">
                                <label for="grupo">${mensaje.get("idgrupprof")}</label>
                                <input type="text" class="form-control" id="grupo" name="grupo" placeholder="${mensaje.get("plhidgrup")}" required>
                            </div>
                            <div class="form-group">
                                <label for="estudiante">${mensaje.get("idestuprof")}</label>
                                <input type="text" class="form-control" id="estudiante" name="estudiante" placeholder="${mensaje.get("plhidestuprof")}" required>
                            </div>
                            <button type="submit" class="btn btn-primary">${mensaje.get("busrpro")}</button>
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