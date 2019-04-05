<%-- 
    Document   : profCrearEvento
    Created on : 27/03/2019, 02:00:46 AM
    Author     : pipel
--%>

<%@ include file="headerProf.jsp" %>

<!-- Main Content -->
<div id="content" style="font-size: auto;">

    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Content Row -->
        <div class="row">

            <!-- Pie Chart -->
            <div class="col-xl-4 col-lg-5">
                <div class="card shadow mb-4">
                    <!-- Card Header - Dropdown -->
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h6 class="m-0 font-weight-bold text-primary">${mensaje.get("creaevnprof")}</h6>

                    </div>
                    <!-- Card Body -->
                    <div class="card-body">
                        <c:if test="${not empty usua}">
                            <form method="POST" action="./crearevento">
                            <div class="form-group">
                                <label for="name">${mensaje.get("nombbprof")}</label>
                                <input type="text" class="form-control" id="name" name="name" placeholder="${mensaje.get("plhnamevtprof")}" required>
                            </div>
                            <div class="form-group">
                                <label for="fecha">${mensaje.get("dateprof")}</label>
                                <input type="date" class="form-control" id="fecha" name="fecha" placeholder="${mensaje.get("pldateprof")}" required>
                            </div>
                            <div class="form-group">
                                <label for="detalles">${mensaje.get("detailprof")}</label>
                                <input type="text" class="form-control" id="detalles" name="detalles" aria-describedby="emailHelp" placeholder="${mensaje.get("plhdetprof")}" required>
                            </div>
                            <div class="form-group">
                                <label for="materia">${mensaje.get("idmatprof")}</label>
                                <input type="text" class="form-control" id="materia" name="materia" placeholder="${mensaje.get("plidmatprof")}">
                            </div>                            
                            <div class="form-group">
                                <label for="grupo">${mensaje.get("idgrupprof")}</label>
                                <input type="text" class="form-control" id="grupo" name="grupo" placeholder="${mensaje.get("plhidgrup")}">
                            </div>
                            <button type="submit" class="btn btn-primary">${mensaje.get("regevnprof")}</button>
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