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
                        <h6 class="m-0 font-weight-bold text-primary">Nota</h6>
                    </div>
                    <!-- Card Body -->
                    <div style="font-size: 100%" class="card-body">
                        <c:if test="${not empty Not}">
                            <h5>Id:</h5>
                            ${Not.getId()}
                            <br/><br/>
                            <h5>Valor:</h5>
                            ${Not.getValor()}
                            <br/><br/>
                            <h5>Porcentaje</h5>
                            ${Not.getPorcentaje()}
                            <br/><br/>                                                        
                            <form method="GET" action="./modnota">                                
                                <input id="id" name="id" type="hidden" value="${Not.getId()}">
                                <input id="grupo" name="grupo" type="hidden" value="${Not.getMatricula().getGrupo().getNumero()}">
                                <input id="materia" name="materia" type="hidden" value="${Not.getMatricula().getGrupo().getMateria().getId()}">
                                <input id="estudiante" name="estudiante" type="hidden" value="${Not.getMatricula().getEstudiante().getIdentificacion()}">
                                <button type="submit" class="btn btn-primary">Modificar</button>
                            </form>
                            <br/>
                            <form method="POST" action="./buscarnota" onsubmit="notify()">
                                <input id="id" name="id" type="hidden" value="${Not.getId()}">
                                <input id="materia" name="materia" type="hidden" value="${Not.getMatricula().getGrupo().getMateria().getId()}">
                                <input id="grupo" name="grupo" type="hidden" value="${Not.getMatricula().getGrupo().getNumero()}">
                                <input id="estudiante" name="estudiante" type="hidden" value="${Not.getMatricula().getEstudiante().getIdentificacion()}">
                                <button type="submit" class="btn btn-primary">Eliminar</button>
                            </form>  
                        </c:if>
                        <c:if test="${empty Not}">
                            No encontrado    
                        </c:if>
                    </div>
                </div>
            </div>

            <!-- Pie Chart -->
            <div class="col-xl-4 col-lg-5">
                <div class="card shadow mb-4">
                    <!-- Card Header - Dropdown -->
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h6 class="m-0 font-weight-bold text-primary">Busqueda</h6>

                    </div>
                    <!-- Card Body -->
                    <div class="card-body">
                        <form method="GET" action="./buscarnota">
                            <div class="form-group">
                                <label for="id">Id</label>
                                <input type="text" class="form-control" id="id" name="id" placeholder="Ingrese el id" required>
                            </div>
                            <div class="form-group">
                                <label for="materia">Id Materia</label>
                                <input type="text" class="form-control" id="materia" name="materia" placeholder="Ingrese el id de la materia" required>
                            </div>
                            <div class="form-group">
                                <label for="grupo">Id Grupo</label>
                                <input type="text" class="form-control" id="grupo" name="grupo" placeholder="Ingrese el id del grupo" required>
                            </div>
                            <div class="form-group">
                                <label for="estudiante">Id Estudiante</label>
                                <input type="text" class="form-control" id="estudiante" name="estudiante" placeholder="Ingrese el id del estudiante" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Buscar</button>
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