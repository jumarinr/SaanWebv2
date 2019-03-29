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
                        <h6 class="m-0 font-weight-bold text-primary">Grupos</h6>
                    </div>
                    <!-- Card Body -->
                    <c:if test="${not empty grupos}">
                        <div class="card-body">    
                            <table class="table" style="margin-top: -10px;width: 100%;">
                                <thead>
                                    <tr>
                                               <th scope="col">Numero</th>
                                               <th scope="col">Id materia</th>
                                               <th scope="col">Documento profesor</th>
                                           </tr>
                                </thead>
                                <tbody>
                                       <c:forEach items="${grupos}" var="gru">
                                               <tr>
                                                       <td><a href="./administrador_buscarGrupo?num=${gru.getNumero()}&id=${gru.getMateria().getId()}">${gru.getNumero()}</a></td>
                                                       <td><a href="./administrador_buscarMateria?id=${gru.getMateria().getId()}">${gru.getMateria().getId()}</a></td>
                                                       <td><a href="./administrador_buscarProfesor?id=${gru.getProfesor().getIdentificacion()}">${gru.getProfesor().getIdentificacion()}</a></td>
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
                        <form method="POST" action="./administrador_registrarGrupo">
                            <div class="form-group">
                                <label for="num">Numero</label>
                                <input type="number" class="form-control" id="numero" name="numero" placeholder="Ingrese el numero del grupo" required>
                            </div>
                            <div class="form-group">
                                <label for="ide">Id materia</label>
                                <input type="number" class="form-control" id="id" name="id" placeholder="Ingrese el Id de la materia" required>
                            </div>
                            <div class="form-group">
                                <label for="pro">Documento profesor</label>
                                <input type="number" class="form-control" id="doc" name="doc" placeholder="Ingrese el documento del profesor" required>
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

