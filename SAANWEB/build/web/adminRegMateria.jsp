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
                        <h6 class="m-0 font-weight-bold text-primary">Materias</h6>
                    </div>
                    <!-- Card Body -->
                    <c:if test="${not empty materias}">
                        <div class="card-body">    
                            <table class="table" style="margin-top: -10px;width: 100%;">
                                <thead>
                                    <tr>
                                               <th scope="col">Id</th>
                                               <th scope="col">Nombre</th>
                                               <th scope="col">Creditos</th>
                                           </tr>
                                </thead>
                                <tbody>
                                       <c:forEach items="${materias}" var="mat">
                                               <tr>
                                                       <td><a href="./administrador_buscarMateria?id=${mat.getId()}">${mat.getId()}</a></td>
                                                       <td>${mat.getNombre()}</td>
                                            <td>${mat.getCreditos()}</td>
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
                        <form method="POST" action="./administrador_registrarMateria">
                            <div class="form-group">
                                <label for="ide">Id</label>
                                <input type="number" class="form-control" id="id" name="id" placeholder="Ingrese el id" required>
                            </div>
                            <div class="form-group">
                                <label for="nom">Nombre</label>
                                <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Ingrese el nombre" required>
                            </div>
                            <div class="form-group">
                                <label for="cre">Creditos</label>
                                <input type="number" class="form-control" id="creditos" name="creditos" placeholder="Ingrese la cantidad de creditos" required>
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

