<%-- 
    Document   : adminRegEstudiante
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
                        <h6 class="m-0 font-weight-bold text-primary">Estudiantes</h6>
                    </div>
                    <!-- Card Body -->
                    <c:if test="${not empty estudiantes}">
                        <div class="card-body">    
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                                   <th scope="col">Nombre</th>
                                                   <th scope="col">Identificación</th>
                                                   <th scope="col">Correo</th>
                                            <th scope="col">Contraseña</th>
                                               </tr>
                                    </thead>
                                    <tbody>
                                           <c:forEach items="${estudiantes}" var="est">
                                                   <tr>
                                                           <td>${est.getNombre()}</td>
                                                           <td>${est.getIdentificacion()}</td>
                                                           <td>${est.getCorreo()}</td>
                                                <td>${est.getClave()}</td>
                                                       </tr>
                                               </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                    </c:if>
                </div>
            </div>

            <!-- Pie Chart -->
            <div class="col-xl-4 col-lg-5">
                <div class="card shadow mb-4">
                    <!-- Card Header - Dropdown -->
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h6 class="m-0 font-weight-bold text-primary">Edición</h6>

                    </div>
                    <!-- Card Body -->
                    <div class="card-body">
                        <c:if test="${not empty usu}">
                            <form method="POST" action="./administrador_modificarEstudiante">
                                <div class="form-group">
                                    <label for="ide">Identificación</label>
                                    <input value="${usu.getIdentificacion()}" type="number" class="form-control" id="identificacion" name="identificacion" placeholder="Ingrese el documento de identidad" required>
                                </div>
                                <div class="form-group">
                                    <label for="nom">Nombre</label>
                                    <input value="${usu.getNombre()}" type="text" class="form-control" id="nombre" name="nombre" placeholder="Ingrese el nombre" required>
                                </div>
                                <div class="form-group">
                                    <label for="cor">Correo</label>
                                    <input value="${usu.getCorreo()}" type="email" class="form-control" id="correo" name="correo" aria-describedby="emailHelp" placeholder="Ingrese el correo electronico" required>
                                </div>
                                <div class="form-group">
                                    <label for="con">Contraseña</label>
                                    <input value="${usu.getClave()}" type="password" class="form-control" id="clave" name="clave" placeholder="Ingrese la contraseña">
                                </div>
                                <input id="doc" name="doc" type="hidden" value="${usu.getIdentificacion()}">
                                <input id="cor" name="cor" type="hidden" value="${usu.getCorreo()}">
                                <button type="submit" class="btn btn-primary">Modificar</button>
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

