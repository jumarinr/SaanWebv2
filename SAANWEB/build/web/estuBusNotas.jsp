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
                        <h6 class="m-0 font-weight-bold text-primary">${mensaje.get("Not")}</h6>
                    </div>
                    <!-- Card Body -->
                    <div style="font-size: 100%" class="card-body">
                        <c:if test="${not empty Not}">
                            <h5>${mensaje.get("Id")}:</h5>
                            ${Not.getId()}
                            <br/><br/>
                            <h5>${mensaje.get("por")}:</h5>
                            ${Not.getPorcentaje()}
                            <br/><br/>
                            <h5>${mensaje.get("val")}:</h5>
                            ${Not.getValor()}
                            <br/><br/>
                            <h5>${mensaje.get("mat")}:</h5>
                            ${Not.getMatricula().getGrupo().getMateria().getNombre()}
                            <br/><br/>
                            <h5>${mensaje.get("gru")}:</h5>
                           ${Not.getMatricula().getGrupo().getNumero()}
                            <br/><br/>
                        </c:if>
                         <c:if test="${empty Not}">
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
                        <c:if test="${not empty usua}">
                            <form method="GET" action="./estuBuscarNotas">
                                <div class="form-group">
                                    <label for="ide">${mensaje.get("Doc")}</label>
                                    <h6>${usua.getIdentificacion()}</h6>
                                </div>
                                <div class="form-group">
                                    <label for="ide">${mensaje.get("idmat")}</label>
                                    <input type="text" class="form-control" id="idM" name="idM" placeholder="${mensaje.get("inmat")}" required>
                                </div>
                                <div class="form-group">
                                    <label for="ide">${mensaje.get("numgru")}</label>
                                    <input type="text" class="form-control" id="idG" name="idG" placeholder="${mensaje.get("ingru")}" required>
                                </div>
                                <div class="form-group">
                                    <label for="ide">${mensaje.get("idnot")}</label>
                                    <input type="text" class="form-control" id="id" name="id" placeholder="${mensaje.get("innot")}" required>
                                </div>
                                <input id="doc" name="doc" type="hidden" value="${usua.getIdentificacion()}">
                                <button type="submit" class="btn btn-primary">${mensaje.get("bus")}</button>
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