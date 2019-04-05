<%-- 
    Document   : profCambiarNombre
    Created on : 27/03/2019, 02:05:19 AM
    Author     : pipel
--%>

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
                        <h6 class="m-0 font-weight-bold text-primary">${mensaje.get("est")}</h6>
                    </div>
                                        
                </div>
            </div>

            <!-- Pie Chart -->
            <div class="col-xl-4 col-lg-5">
                <div class="card shadow mb-4">
                    <!-- Card Header - Dropdown -->
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h6 class="m-0 font-weight-bold text-primary">${mensaje.get("ed")}</h6>

                    </div>
                    <!-- Card Body -->
                    <div class="card-body">
                        <c:if test="${not empty usua}">
                            <form method="POST" action="./estuCambiarNombre" onsubmit="notify()">
                            <div class="form-group">
                                <label for="name">${mensaje.get("Nom")}</label>
                                <input value="${usua.getNombre()}" type="text" class="form-control" id="name" name="name" placeholder="${mensaje.get("nunom")}" required>
                            </div>                            
                            <button type="submit" class="btn btn-primary">${mensaje.get("modr")}</button>
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