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
                        <h6 class="m-0 font-weight-bold text-primary">Edición</h6>

                    </div>
                    <!-- Card Body -->
                    <div class="card-body">
                        <c:if test="${not empty mat}">
                            <form method="POST" action="./administrador_modificarMateria">
                                <div class="form-group">
                                    <label for="ide">Id</label>
                                    <input value="${mat.getId()}" type="number" class="form-control" id="id" name="id" placeholder="Ingrese el id" required>
                                </div>
                                <div class="form-group">
                                    <label for="nom">Nombre</label>
                                    <input value="${mat.getNombre()}" type="text" class="form-control" id="nombre" name="nombre" placeholder="Ingrese el nombre" required>
                                </div>
                                <div class="form-group">
                                    <label for="cre">Creditos</label>
                                    <input value="${mat.getCreditos()}" type="number" class="form-control" id="creditos" name="creditos" placeholder="Ingrese la cantidad de creditos" required>
                                </div>
                                <input id="ida" name="ida" type="hidden" value="${mat.getId()}">
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

