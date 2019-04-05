<%-- 
    Document   : menuProf
    Created on : 24/03/2019, 08:10:21 PM
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
                                <h6 class="m-0 font-weight-bold text-primary">Información usuario</h6>
                            </div>
                            <!-- Card Body -->

                            <c:if test="${empty usu}">
                                <div style="font-size: 100%" class="card-body">
                                    <h5>${mensaje.get("nomprof")}</h5>
                                    ${usua.getNombre()}
                                    <br/><br/>
                                    <h5>${mensaje.get("docprof")}</h5>
                                    ${usua.getIdentificacion()}
                                    <br/><br/>
                                    <h5>${mensaje.get("corrprof")}</h5>
                                    ${usua.getCorreo()}
                                    <br/><br/>
                                    <h5>${mensaje.get("Rol:")}</h5>
                                    ${mensaje.get("prof")}
                                </div>
                            </c:if>
                        </div>
                    </div>

                    <!-- Pie Chart -->
                    <div class="col-xl-4 col-lg-5">
                        <div class="card shadow mb-4">
                            <!-- Card Header - Dropdown -->
                            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">${mensaje.get("saan")}</h6>

                            </div>
                            <!-- Card Body -->
                            <br/><br/>
                            <div class="card-body">
                                <img style="width: 100%; height: 100%" src="https://codigoespagueti.com/wp-content/uploads/2015/05/Gmail-GIF.gif">
                            </div>
                            <br/><br/><br/>
                        </div>
                    </div>
                </div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <%@ include file="footer.jsp" %>
