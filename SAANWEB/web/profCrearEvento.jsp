<%-- 
    Document   : profCrearEvento
    Created on : 27/03/2019, 02:00:46 AM
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
                        <h6 class="m-0 font-weight-bold text-primary">Eventos</h6>
                    </div>
                    <!-- Card Body -->
                    <c:if test="${not empty Events}">
                        <div class="card-body">    
                            <table class="table" style="margin-top: -10px;width: auto;">
                                <thead>
                                    <tr>
                                               <th scope="col">Nombre</th>
                                               <th scope="col">Fecha</th>
                                               <th scope="col">Detalles</th>
                                               <th scope="col">ID materia</th>
                                               <th scope="col">Num grupo</th>
                                           </tr>
                                </thead>
                                <tbody>
                                       <c:forEach items="${Events}" var="event">
                                               <tr>
                                                       <td></td>
                                                       <td></td>
                                                       <td></td>
                                            <td></td>
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
                        <h6 class="m-0 font-weight-bold text-primary">Creación Evento</h6>

                    </div>
                    <!-- Card Body -->
                    <div class="card-body">
                        <c:if test="${not empty usua}">
                        <form method="POST" action="./crearevento">
                            <div class="form-group">
                                <label for="name">Nombre</label>
                                <input type="text" class="form-control" id="name" name="name" placeholder="Ingrese el nombre del evento" required>
                            </div>
                            <div class="form-group">
                                <label for="fecha">Fecha</label>
                                <input type="date" class="form-control" id="fecha" name="fecha" placeholder="Ingrese la fecha de un evento" required>
                            </div>
                            <div class="form-group">
                                <label for="detalles">Detalles</label>
                                <input type="text" class="form-control" id="detalles" name="detalles" aria-describedby="emailHelp" placeholder="Describa los detalles del evento" required>
                            </div>
                            <div class="form-group">
                                <label for="materia">ID materia</label>
                                <input type="text" class="form-control" id="materia" name="materia" placeholder="Ingrese el id de la materia">
                            </div>                            
                            <div class="form-group">
                                <label for="grupo">Num grupo</label>
                                <input type="text" class="form-control" id="grupo" name="grupo" placeholder="Ingrese el número de grupo">
                            </div>
                            <button type="submit" class="btn btn-primary">Registrar evento</button>
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