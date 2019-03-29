<%-- 
    Document   : adminRegEstudiante
    Created on : 24/03/2019, 04:49:15 PM
    Author     : Juan Pablo
--%>

<%@ include file="headerAdm.jsp" %>

<!-- Main Content -->
<div id="content" style="font-size: auto;">


    <!--<img style="width: 100%; height: 200%" src="https://codigoespagueti.com/wp-content/uploads/2015/05/Gmail-GIF.gif">--!>


    <!-- Begin Page Content -->
    <div class="container-fluid">


        <!-- Content Row -->


        <div class="row">

            <!-- Area Chart -->
            <div class="col-xl-8 col-lg-7">
                <div class="card shadow mb-4">
                    <!-- Card Header - Dropdown -->
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h6 class="m-0 font-weight-bold text-primary">Profesor</h6>
                    </div>
                    <!-- Card Body -->
                    <c:if test="${not empty profesores}">
                        <div class="card-body">    
                            <table class="table" style="margin-top: -10px;width: auto;">
                                <thead>
                                    <tr>
                                               <th scope="col">Nombre</th>
                                               <th scope="col">Identificación</th>
                                               <th scope="col">Correo</th>
                                        <th scope="col">Contraseña</th>
                                           </tr>
                                </thead>
                                <tbody>
                                       <c:forEach items="${profesores}" var="pro">
                                               <tr>
                                                       <td>${pro.getNombre()}</td>
                                                       <td><a href="./administrador_buscarProfesor?id=${pro.getIdentificacion()}">${pro.getIdentificacion()}</a></td>
                                                       <td>${pro.getCorreo()}</td>
                                            <td>${pro.getClave()}</td>
                                                   </tr>
                                           </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                    </c:if>
                </div>
            </div>

            <!-- Pie Chart -->
            <div class="col-xl-4 col-lg-5">
                <div class="card shadow mb-4">
                    <!-- Card Header - Dropdown -->
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h6 class="m-0 font-weight-bold text-primary">Registro</h6>

                    </div>
                    <!-- Card Body -->
                    <div class="card-body">
                        <form method="POST" action="./administrador_registrarProfesor">
                            <div class="form-group">
                                <label for="ide">Identificación</label>
                                <input type="number" class="form-control" id="identificacion" name="identificacion" placeholder="Ingrese el documento de identidad" required>
                            </div>
                            <div class="form-group">
                                <label for="nom">Nombre</label>
                                <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Ingrese el nombre" required>
                            </div>
                            <div class="form-group">
                                <label for="cor">Correo</label>
                                <input type="email" class="form-control" id="correo" name="correo" aria-describedby="emailHelp" placeholder="Ingrese el correo electronico" required>
                            </div>
                            <div class="form-group">
                                <label for="con">Contraseña</label>
                                <input type="password" class="form-control" id="clave" name="clave" placeholder="Ingrese la contraseña">
                            </div>
                            <button type="submit" class="btn btn-primary">Registrar</button>
                        </form>                    </div>

                </div>
            </div>
        </div>

    </div>
    <!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<!-- Footer -->
<%@ include file="footer.jsp" %>

