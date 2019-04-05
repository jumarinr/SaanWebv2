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
                        <h6 class="m-0 font-weight-bold text-primary">${mensaje.get("notsprof")}</h6>
                    </div>
                    <!-- Card Body -->
                    <c:if test="${not empty notas}">
                        <div class="card-body">    
                            <table class="table" style="margin-top: -10px;width: 100%;">
                                <thead>
                                    <tr>
                                               <th scope="col">${mensaje.get("iddprof")}</th>
                                               <th scope="col">${mensaje.get("vallprof")}</th>
                                               <th scope="col">${mensaje.get("porcenprof")}</th>
                                           </tr>
                                </thead>
                                <tbody>
                                       <c:forEach items="${notas}" var="Not">
                                               <tr>
                                                       <td><a href="./buscarnota?id=${Not.getId()}&materia=${Not.getMatricula().getGrupo().getMateria().getId()}&grupo=${Not.getMatricula().getGrupo().getNumero()}&estudiante=${Not.getMatricula().getEstudiante().getIdentificacion()}">${Not.getId()}</a></td>
                                                       <td>${Not.getValor()}</td>
                                            <td>${Not.getPorcentaje()}</td>
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
                        <h6 class="m-0 font-weight-bold text-primary">${mensaje.get("regprof")}</h6>

                    </div>
                    <!-- Card Body -->
                    <div class="card-body">
                        <form method="POST" action="./regnota">
                            <div class="form-group">
                                <label for="ide">Id</label>
                                <input type="number" class="form-control" id="id" name="id" placeholder="${mensaje.get("plidprof")}" required>
                            </div>
                            <div class="form-group">
                                <label for="nom">${mensaje.get("vallprof")}</label>
                                <input type="text" class="form-control" id="valor" name="valor" placeholder="${mensaje.get("plhvalprof")}" required>
                            </div>
                            <div class="form-group">
                                <label for="cre">${mensaje.get("porcenprof")}</label>
                                <input type="number" class="form-control" id="porcentaje" name="porcentaje" placeholder="${mensaje.get("plhporprof")}" required>
                            </div>
                            <div class="form-group">
                                <label for="idestudiante">${mensaje.get("idestuprof")}</label>
                                <input type="number" class="form-control" id="idestudiante" name="idestudiante" placeholder="${mensaje.get("plhidestuprof")}" required>
                            </div>                            
                            <div class="form-group">
                                <label for="idmateria">${mensaje.get("idmatprof")}</label>
                                <input type="number" class="form-control" id="idmateria" name="idmateria" placeholder="${mensaje.get("plidmatprof")}" required>
                            </div>
                            <button type="submit" class="btn btn-primary">${mensaje.get("plidmatprof")}</button>
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