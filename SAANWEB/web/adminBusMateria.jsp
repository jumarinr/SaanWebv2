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
                        <h6 class="m-0 font-weight-bold text-primary">Materia</h6>
                    </div>
                    <!-- Card Body -->
                    <div style="font-size: 100%" class="card-body">
                        <c:if test="${not empty mat}">
                            <h5>Id:</h5>
                            ${mat.getId()}
                            <br/><br/>
                            <h5>Nombre:</h5>
                            ${mat.getNombre()}
                            <br/><br/>
                            <h5>Creditos:</h5>
                            ${mat.getCreditos()}
                            <br/><br/>
                            <h5>Grupos</h5>
                            <c:if test="${not empty mat.getGrupos()}">
                                <table class="table" style="margin-top: -10px;width: auto;">
                                    <thead>
                                        <tr>
                                                   <th scope="col">Numero</th>
                                                   <th scope="col">Documento profesor</th>
                                            <th scope="col">Nombre Profesor</th>
                                                   <th scope="col">Cantidad estudiantes</th>
                                               </tr>
                                    </thead>
                                    <tbody>
                                           <c:forEach items="${mat.getGrupos()}" var="gru">
                                                   <tr>
                                                           <td><a href="./administrador_buscarGrupo?num=${gru.getNumero()}&id=${mat.getId()}">${gru.getNumero()}</a></td>
                                                <td><a href="./administrador_buscarProfesor?id=${gru.getProfesor().getIdentificacion()}">${gru.getProfesor().getIdentificacion()}</a></td>
                                                <td>${gru.getProfesor().getNombre()}</td>
                                                <td>${gru.getMatriculas().size()}</td>
                                                       </tr>
                                               </c:forEach>
                                        </tbody>
                                    </table>
                            </c:if>
                            <c:if test="${empty mat.getGrupos()}">
                                Ninguno
                            </c:if>
                            <br/><br/>
                            <form method="GET" action="./administrador_modificarMateria">
                                <input id="id" name="id" type="hidden" value="${mat.getId()}">
                                <button type="submit" class="btn btn-primary">Modificar</button>
                            </form>
                            <br/>
                            <form method="POST" action="./administrador_buscarMateria">
                                <input id="id" name="id" type="hidden" value="${mat.getId()}">
                                <button type="submit" class="btn btn-primary">Eliminar</button>
                            </form>  
                        </c:if>
                        <c:if test="${empty mat}">
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
                        <form method="GET" action="./administrador_buscarMateria">
                            <div class="form-group">
                                <label for="ide">Id</label>
                                <input type="number" class="form-control" id="id" name="id" placeholder="Ingrese el id" required>
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

