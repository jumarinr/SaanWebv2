<%-- 
    Document   : profBuscarMateria
    Created on : 27/03/2019, 01:54:34 AM
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
                        <h6 class="m-0 font-weight-bold text-primary">${mensaje.get("mattprof")}</h6>
                    </div>
                    <!-- Card Body -->
                    <div style="font-size: 100%" class="card-body">
                        <c:if test="${not empty Mat}">   
                            <h5>${mensaje.get("idprof")}</h5>
                            ${Mat.getId()}
                            <h5>${mensaje.get("nomprof")}</h5>
                            ${Mat.getNombre()}
                            <br/><br/>
                            <h5>${mensaje.get("creprof")}</h5>
                            ${Mat.getCreditos()}                            
                        </c:if>
                        <c:if test="${empty Mat}">
                            ${mensaje.get("notfound")}  
                        </c:if>
                    </div>
                </div>
            </div>

            <!-- Pie Chart -->
            <div class="col-xl-4 col-lg-5">
                <div class="card shadow mb-4">
                    <!-- Card Header - Dropdown -->
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h6 class="m-0 font-weight-bold text-primary">${mensaje.get("busprof")}</h6>

                    </div>
                    <!-- Card Body -->
                    <div class="card-body">
                        <form method="GET" action="./buscarmateria">
                            <div class="form-group">
                                <label for="id">${mensaje.get("iddprof")}</label>
                                <input type="text" class="form-control" id="id" name="id" placeholder="${mensaje.get("plidprof")}" required>
                            </div>
                            <button type="submit" class="btn btn-primary">${mensaje.get("busrpro")}</button>
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
© 2019 GitHub, Inc.