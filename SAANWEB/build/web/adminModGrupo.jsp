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
                        <h6 class="m-0 font-weight-bold text-primary">${mensaje.get("Grupos")}</h6>
                    </div>
                    <!-- Card Body -->
                    <c:if test="${not empty grupos}">
                        <div class="card-body">    
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                                   <th scope="col">${mensaje.get("Numero")}</th>
                                                   <th scope="col">${mensaje.get("Idmat")}</th>
                                                   <th scope="col">${mensaje.get("docProf")}</th>
                                               </tr>
                                    </thead>
                                    <tbody>
                                           <c:forEach items="${grupos}" var="grup">
                                                   <tr>
                                                <td>${grup.getNumero()}</td>
                                                           <td>${grup.getMateria().getId()}</td>
                                                           <td>${grup.getProfesor().getIdentificacion()}</td>
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
                        <h6 class="m-0 font-weight-bold text-primary">${mensaje.get("edic")}</h6>

                    </div>
                    <!-- Card Body -->
                    <div class="card-body">
                        <c:if test="${not empty gru}">
                            <form method="POST" action="./administrador_modificarGrupo">
                                <div class="form-group">
                                    <label for="num">${mensaje.get("Numero")}</label>
                                    <input value="${gru.getNumero()}" type="number" class="form-control" id="numero" name="numero" placeholder="${mensaje.get("ingreNum")}" required>
                                </div>
                                <div class="form-group">
                                    <label for="pro">${mensaje.get("Idmat")}</label><br/>
                                    <h6>${gru.getMateria().getId()}</h6>
                                </div>
                                <div class="form-group">
                                    <label for="pro">${mensaje.get("docProf")}</label>
                                    <input value="${gru.getProfesor().getIdentificacion()}" type="number" class="form-control" id="doc" name="doc" placeholder="${mensaje.get("ingreDoc")}" required>
                                </div>
                                <input id="numa" name="numa" type="hidden" value="${gru.getNumero()}">
                                <input id="mat" name="mat" type="hidden" value="${gru.getMateria().getId()}">
                                <button type="submit" class="btn btn-primary">${mensaje.get("modi")}</button>
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

