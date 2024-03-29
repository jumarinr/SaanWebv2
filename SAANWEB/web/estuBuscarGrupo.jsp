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
                        <h6 class="m-0 font-weight-bold text-primary">${mensaje.get("gru")}</h6>
                    </div>
                    <!-- Card Body -->
                    <div style="font-size: 100%" class="card-body">
                        <c:if test="${not empty Gru}">
                            <h5>${mensaje.get("num")}:</h5>
                            ${Gru.getNumero()}
                            <br/><br/>
                            <h5>${mensaje.get("mat")}:</h5>
                            ${Gru.getMateria().getNombre()}
                            <br/><br/>
                            <h5>${mensaje.get("prof")}:</h5>
                            ${Gru.getProfesor().getNombre()}
                            <br/><br/>
                        </c:if>
                         <c:if test="${empty Gru}">
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
                        <form method="GET" action="./estuBuscarGrupo">
                            <div class="form-group">
                                <label for="ide">${mensaje.get("num")}</label>
                                <input type="text" class="form-control" id="num" name="num" placeholder="${mensaje.get("ingru")}" required>
                            </div>
                            <div class="form-group">
                                <label for="ide">${mensaje.get("idmat")}</label>
                                <input type="text" class="form-control" id="idM" name="idM" placeholder="${mensaje.get("inmat")}" required>
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


