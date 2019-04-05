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
                        <h6 class="m-0 font-weight-bold text-primary">${mensaje.get("matr")}</h6>
                    </div>
                    <!-- Card Body -->
                    <c:if test="${not empty matriculas}">
                        <div class="card-body">    
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                                   <th scope="col">${mensaje.get("notF")}</th>
                                                   <th scope="col">${mensaje.get("sem")}</th>
                                                   <th scope="col">${mensaje.get("gru")}</th>
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
                        <h6 class="m-0 font-weight-bold text-primary">${mensaje.get("regi")}</h6>

                    </div>
                    <!-- Card Body -->
                    <div class="card-body">
                        <form method="POST" action="./estuRegistrarMatricula">
                            <div class="form-group">
                                <label for="ide">${mensaje.get("sem")}</label>
                                <input type="number" class="form-control" id="Semestre" name="Semestre" placeholder="${mensaje.get("insem")}" required>
                            </div>
                            <div class="form-group">
                                <label for="ide">${mensaje.get("Doc")}</label>
                                <input type="number" class="form-control" id="doc" name="doc" placeholder="${mensaje.get("indoc")}" required>
                            </div>
                            <div class="form-group">
                                <label for="ide">${mensaje.get("idmat")}</label>
                                <input type="number" class="form-control" id="idM" name="idM" placeholder="${mensaje.get("inmat")}" required>
                            </div>
                            <div class="form-group">
                                <label for="ide">${mensaje.get("num")}</label>
                                <input type="number" class="form-control" id="num" name="num" placeholder="${mensaje.get("ingru")}" required>
                            </div>
                            <button type="submit" class="btn btn-primary">${mensaje.get("regir")}</button>
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

