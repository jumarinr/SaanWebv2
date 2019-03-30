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
                        <h6 class="m-0 font-weight-bold text-primary">Materia</h6>
                    </div>
                    <!-- Card Body -->
                    <div style="font-size: 100%" class="card-body">
                        <c:if test="${not empty Mat}">   
                            <h5>Id: </h5>
                            ${Mat.getId()}
                            <h5>Nombre: </h5>
                            ${Mat.getNombre()}
                            <br/><br/>
                            <h5>Creditos: </h5>
                            ${Mat.getCreditos()}                            
                        </c:if>
                        <c:if test="${empty Mat}">
                            No encontrado    
                        </c:if>
                    </div>
                </div>
            </div>

            <!-- Pie Chart -->
            <div class="col-xl-4 col-lg-5">
                <div class="card shadow mb-4">
                    <!-- Card Header - Dropdown -->
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h6 class="m-0 font-weight-bold text-primary">Busqueda</h6>

                    </div>
                    <!-- Card Body -->
                    <div class="card-body">
                        <form method="GET" action="./buscarmateria">
                            <div class="form-group">
                                <label for="id">Id</label>
                                <input type="text" class="form-control" id="id" name="id" placeholder="Ingrese el id" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Buscar</button>
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