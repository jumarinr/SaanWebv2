<%-- 
    Document   : profRegNota
    Created on : 27/03/2019, 12:39:27 AM
    Author     : pipel
--%>

<%@ include file="headerProf.jsp" %>

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
                        <h6 class="m-0 font-weight-bold text-primary">Nota</h6>
                    </div>
                    <!-- Card Body -->
                    <c:if test="${not empty estudiantes}">
                        <div class="card-body">    
                            <table class="table" style="margin-top: -10px;width: auto;">
                                <thead>
                                    <tr>
                                               <th scope="col">Id</th>
                                               <th scope="col">Valor</th>
                                               <th scope="col">Porcentaje</th>
                                        <th scope="col">Créditos</th>
                                           </tr>
                                </thead>
                                <tbody>
                                       <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
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
                        <form method="POST" action="./regnota">
                            <div class="form-group">
                                <label for="id">Id Nota</label>
                                <input type="text" class="form-control" id="id" name="id" placeholder="Ingrese el id de la nota" required>
                            </div>
                            <div class="form-group">
                                <label for="valor">Valor</label>
                                <input type="text" class="form-control" id="valor" name="valor" placeholder="Ingrese el valor de la nota" required>
                            </div>
                            <div class="form-group">
                                <label for="porcentaje">Porcentaje</label>
                                <input type="text" class="form-control" id="porcentaje" name="porcentaje" placeholder="Ingrese el porcentaje de la nota" required>
                            </div>
                            <div class="form-group">
                                <label for="idmatricula">Id Matrícula</label>
                                <input type="text" class="form-control" id="idmatricula" name="idmatricula" placeholder="Ingrese el id de la matrícula">
                            </div>
                            <div class="form-group">
                                <label for="idestudiante">Id Estudiante</label>
                                <input type="text" class="form-control" id="idestudiante" name="idestudiante" placeholder="Ingrese el id del estudiante">
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

