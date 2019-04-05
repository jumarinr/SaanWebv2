<%-- 
    Document   : profMejoresNotas
    Created on : 27/03/2019, 01:49:32 AM
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
                        <h6 class="m-0 font-weight-bold text-primary">Notas</h6>
                    </div>
                    <!-- Card Body -->
                    <c:if test="${not empty Nots}">
                        <div class="card-body">    
                            <table class="table" style="margin-top: -10px;width: auto;">
                                <thead>
                                    <tr>
                                               <th scope="col">${mensaje.get("idprof")}</th>
                                               <th scope="col">${mensaje.get("porcenprof")}</th>
                                               <th scope="col">${mensaje.get("valprof")}</th>                                        
                                           </tr>
                                </thead>
                                <tbody>
                                       <c:forEach items="${Nots}" var="Nota">
                                               <tr>
                                                       <td><a href="./buscarnota?id=${Nota.getId()}&materia=${Nota.getMatricula().getGrupo().getMateria().getId()}&grupo=${Nota.getMatricula().getGrupo().getNumero()}&estudiante=${Nota.getMatricula().getEstudiante().getIdentificacion()}">${Nota.getId()}</a></td>
                                                       <td>${Nota.getPorcentaje()}</td>
                                                       <td>${Nota.getValor()}</td>                                                                                               
                                        </tr>
                                           </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                    </c:if>
                    <c:if test="${empty Nots}">
                        <p style="padding: 5% 5%">${mensaje.get("notnotprof")}</p>
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
                        <c:if test="${not empty usua}">
                        <form method="GET" action="./mejoresnotas">
                            <div class="form-group">
                                <label for="grupo">${mensaje.get("idgrupprof")}</label>
                                <input type="text" class="form-control" id="grupo" name="grupo" aria-describedby="emailHelp" placeholder="${mensaje.get("plhidgrup")}" required>
                            </div>
                            <div class="form-group">
                                <label for="materia">${mensaje.get("idmatprof")}</label>
                                <input type="text" class="form-control" id="materia" name="materia" placeholder="${mensaje.get("plidmatprof")}">
                            </div>                            
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