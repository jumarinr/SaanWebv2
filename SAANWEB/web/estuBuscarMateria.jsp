<%@ include file="headerEstu.jsp" %>

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
                        <h6 class="m-0 font-weight-bold text-primary">${mensaje.get("mat")}</h6>
                    </div>
                    <!-- Card Body -->
                    <div style="font-size: 100%" class="card-body">
                        <c:if test="${not empty Mat}">
                            <h5>${mensaje.get("Id")}:</h5>
                            ${Mat.getId()}
                            <br/><br/>
                            <h5>${mensaje.get("Nom")}:</h5>
                            ${Mat.getNombre()}
                            <br/><br/>
                            <h5>${mensaje.get("cre")}:</h5>
                            ${Mat.getCreditos()}
                            <br/><br/>
                            <h5>${mensaje.get("gru")}s:</h5>
                            <c:if test="${not empty Mat.getGrupos()}">
                                <table class="table" style="margin-top: -10px;width: auto;">
                                    <thead>
                                        <tr>
                                                   <th scope="col">${mensaje.get("num")}</th>
                                                   <th scope="col">${mensaje.get("prof")}</th>
                                                   <th scope="col">${mensaje.get("cantest")}</th>
                                               </tr>
                                    </thead>
                                    <tbody>
                                           <c:forEach items="${Mat.getGrupos()}" var="Gru">
                                                   <tr>
                                                           <td><a href="./estuBuscarGrupo?num=${Gru.getNumero()}&idM=${Mat.getId()}">${Gru.getNumero()}</a></td>
                                                           <td> ${Gru.getProfesor().getNombre()}</td>
                                                           <td>${Gru.getMatriculas().size()}</a></td>
                                                       </tr>
                                               </c:forEach>
                                        </tbody>
                                    </table>
                            </c:if>
                            <c:if test="${empty Mat.getGrupos()}">
                                ${mensaje.get("nin")}
                            </c:if>
                        </c:if>
                         <c:if test="${empty Mat}">
                            ${mensaje.get("Noenc")}   
                        </c:if>
                    </div>
                </div>
            </div>
            
            <div class="col-xl-4 col-lg-5">
                <div class="card shadow mb-4">
                    <!-- Card Header - Dropdown -->
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h6 class="m-0 font-weight-bold text-primary">${mensaje.get("busq")}</h6>

                    </div>
                    <!-- Card Body -->
                    <div class="card-body">
                        <form method="GET" action="./estuBuscarMateria">
                            <div class="form-group">
                                <label for="ide">${mensaje.get("Id")}</label>
                                <input type="text" class="form-control" id="id" name="id" placeholder="${mensaje.get("inmat")}" required>
                            </div>
                            <button type="submit" class="btn btn-primary">${mensaje.get("bus")}</button>
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


