<%-- 
    Document   : modnotaProf
    Created on : 27/03/2019, 01:28:27 AM
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
                        <h6 class="m-0 font-weight-bold text-primary">${mensaje.get("notprof")}</h6>
                    </div>
                    <!-- Card Body -->
                    <c:if test="${not empty Not}">
                        <div class="card-body">    
                            <table class="table" style="margin-top: -10px;width: 100%;">
                                <thead>
                                    <tr>
                                               <th scope="col">${mensaje.get("iddprof")}</th>
                                               <th scope="col">${mensaje.get("valprof")}</th>
                                               <th scope="col">${mensaje.get("porcenprof")}</th>
                                           </tr>
                                </thead>
                                <tbody>
                                       <tr>
                                                       <td><a href="./buscarnota?id=${Not.getId()}&materia=${Not.getMatricula().getGrupo().getMateria().getId()}&grupo=${Not.getMatricula().getGrupo().getNumero()}&estudiante=${Not.getMatricula().getEstudiante().getIdentificacion()}">${Not.getId()}</a></td>
                                                       <td>${Not.getValor()}</td>
                                            <td>${Not.getPorcentaje()}</td>
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
                        <h6 class="m-0 font-weight-bold text-primary">${mensaje.get("edprof")}</h6>

                    </div>
                    <!-- Card Body -->
                    <div class="card-body">
                        <c:if test="${not empty Not}">
                            <form method="POST" action="./modnota?id=${Not.getId()}&materia=${Not.getMatricula().getGrupo().getMateria().getId()}&grupo=${Not.getMatricula().getGrupo().getNumero()}&estudiante=${Not.getMatricula().getEstudiante().getIdentificacion()}" onsubmit="notify()">
                                <div class="form-group">
                                    <label for="valor">${mensaje.get("valprof")}</label>
                                    <input value="${Not.getValor()}" type="text" class="form-control" id="valor" name="valor" placeholder="${mensaje.get("plhvalprof")}" required>
                                </div>
                                <div class="form-group">
                                    <label for="porcentaje">${mensaje.get("porcenprof")}</label>
                                    <input value="${Not.getPorcentaje()}" type="text" class="form-control" id="porcentaje" name="porcentaje" placeholder="${mensaje.get("plhporprof")}" required>
                                </div>
                                <input id="estudiante" name="estudiante" type="hidden" value="${Not.getMatricula().getEstudiante().getIdentificacion()}">
                                <input id="materia" name="materia" type="hidden" value="${Not.getMatricula().getGrupo().getMateria().getId()}">
                                <input id="grupo" name="grupo" type="hidden" value="${Not.getMatricula().getGrupo().getNumero()}">
                                <button type="submit" class="btn btn-primary">${mensaje.get("modprof")}</button>  
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