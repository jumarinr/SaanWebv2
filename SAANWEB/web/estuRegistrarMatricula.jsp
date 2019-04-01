<%-- 
    Document   : adminRegEstudiante
    Created on : 24/03/2019, 04:49:15 PM
    Author     : Juan Pablo
--%>

<%@ include file="headerEstu.jsp" %>

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
                        <h6 class="m-0 font-weight-bold text-primary">Estudiantes</h6>
                    </div>
                    <!-- Card Body -->
                    <c:if test="${not empty matriculas}">
                        <div class="card-body">    
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                                   <th scope="col">Nota final</th>
                                                   <th scope="col">Semestre</th>
                                                   <th scope="col">Grupo</th>
                                               </tr>
                                    </thead>
                                    <tbody>
                                           <c:forEach items="${matriculas}" var="matr">
                                                   <tr>
                                                           <td>${matr.getNotaFinal()}</td>
                                                           <td><a href="./estuBuscarMatricula?doc=${matr.getEstudiante().getIdentificacion()}&idM=${matr.getGrupo().getMateria().getId()}">${matr.getSemestre()}</a></td>
                                                           <td><a href="./estuBuscarGrupo?num=${matr.getGrupo().getNumero()}&idM=${matr.getGrupo().getMateria().getId()}">${matr.getGrupo().getNumero()}</a></td>
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
                        <h6 class="m-0 font-weight-bold text-primary">Registro</h6>

                    </div>
                    <!-- Card Body -->
                    <div class="card-body">
                        <form method="POST" action="./estuRegistrarMatricula">
                            <div class="form-group">
                                <label for="ide">Semestre</label>
                                <input type="number" class="form-control" id="Semestre" name="Semestre" placeholder="Ingrese el semestre" required>
                            </div>
                            <div class="form-group">
                                <label for="ide">Documento</label>
                                <input type="number" class="form-control" id="doc" name="doc" placeholder="Ingrese su documento" required>
                            </div>
                            <div class="form-group">
                                <label for="ide">Id materia</label>
                                <input type="number" class="form-control" id="idM" name="idM" placeholder="Ingrese el id de la materia" required>
                            </div>
                            <div class="form-group">
                                <label for="ide">Numero del Grupo</label>
                                <input type="number" class="form-control" id="num" name="num" placeholder="Ingrese el numero del grupo " required>
                            </div>
                            <button type="submit" class="btn btn-primary">Registrar</button>
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

