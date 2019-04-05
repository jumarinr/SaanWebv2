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
                        <h6 class="m-0 font-weight-bold text-primary">${mensaje.get("Admins")}</h6>
                    </div>
                    <!-- Card Body -->
                    <c:if test="${not empty administradores}">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                                   <th scope="col">${mensaje.get("nombre")}</th>
                                                   <th scope="col">${mensaje.get("ideti")}</th>
                                                   <th scope="col">${mensaje.get("correo")}</th>
                                            <th scope="col">${mensaje.get("contras")}</th>
                                               </tr>
                                    </thead>
                                    <tbody>
                                           <c:forEach items="${administradores}" var="adm">
                                                   <tr>
                                                           <td>${adm.getNombre()}</td>
                                                           <td>${adm.getIdentificacion()}</td>
                                                           <td>${adm.getCorreo()}</td>
                                                <td>${adm.getClave()}</td>
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
                        <c:if test="${not empty usu}">
                            <form method="POST" action="./administrador_modificarAdministrador">
                                <div class="form-group">
                                    <label for="ide">${mensaje.get("ideti")}</label>
                                    <input value="${usu.getIdentificacion()}" type="number" class="form-control" id="identificacion" name="identificacion" placeholder="${mensaje.get("ingreName")}" required>
                                </div>
                                <div class="form-group">
                                    <label for="nom">${mensaje.get("nombre")}</label>
                                    <input value="${usu.getNombre()}" type="text" class="form-control" id="nombre" name="nombre" placeholder="${mensaje.get("ingrete")}" required>
                                </div>
                                <div class="form-group">
                                    <label for="cor">${mensaje.get("correo")}</label>
                                    <input value="${usu.getCorreo()}" type="email" class="form-control" id="correo" name="correo" aria-describedby="emailHelp" placeholder="${mensaje.get("placeholderCorreo")}" required>
                                </div>
                                <div class="form-group">
                                    <label for="con">${mensaje.get("contras")}</label>
                                    <input value="${usu.getClave()}" type="password" class="form-control" id="clave" name="clave" placeholder="${mensaje.get("placeholderContra")}">
                                </div>
                                <input id="doc" name="doc" type="hidden" value="${usu.getIdentificacion()}">
                                <input id="cor" name="cor" type="hidden" value="${usu.getCorreo()}">
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

