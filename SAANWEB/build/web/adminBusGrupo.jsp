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
                            <h5>Numero:</h5>
                            ${gru.getNumero()}
                            <br/><br/>
                            <h5>Id materia:</h5>
                            ${gru.getMateria().getId()}
                            <br/><br/>
                            <h5>Nombre materia:</h5>
                            ${gru.getMateria().getNombre()}
                            <br/><br/>
                            <h5>Identificación Profesor:</h5>
                            ${gru.getProfesor().getIdentificacion()}
                            <br/><br/>
                            <h5>Nombre profesor:</h5>
                            ${gru.getProfesor().getNombre()}
                            <br/><br/>
                            <h5>Estudiantes:</h5>
                            <c:if test="${not empty gru.getMatriculas()}">
                                <table class="table" style="margin-top: -10px;width: auto;">
                                    <thead>
                                        <tr>
                                                   <th scope="col">Identificación</th>
                                                   <th scope="col">Nombre</th>
                                            <th scope="col">Nota Final</th>
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
                            <br/><br/>
                            <form method="GET" action="./administrador_modificarGrupo">
                                <input id="id" name="id" type="hidden" value="${gru.getMateria().getId()}">
                                <input id="num" name="num" type="hidden" value="${gru.getNumero()}">
                                <button type="submit" class="btn btn-primary">Modificar</button>
                            </form>
                            <br/>
                            <form method="POST" action="./administrador_buscarGrupo">
                                <input id="id" name="id" type="hidden" value="${gru.getMateria().getId()}">
                                <input id="num" name="num" type="hidden" value="${gru.getNumero()}">
                                <button type="submit" class="btn btn-primary">Eliminar</button>
                            </form>  
                        </c:if>
                        <c:if test="${empty gru}">
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
                        <form method="GET" action="./administrador_buscarGrupo">
                            <div class="form-group">
                                <div class="form-group">
                                    <label for="ide">Id materia</label>
                                    <input type="number" class="form-control" id="id" name="id" placeholder="Ingrese el id de la materia" required>
                                </div>
                                <div class="form-group">
                                    <label for="ide">Numero grupo</label>
                                    <input type="number" class="form-control" id="num" name="num" placeholder="Ingrese el numero del grupo" required>
                                </div>
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

