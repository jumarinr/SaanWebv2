<%-- 
    Document   : mejoresGrupos
    Created on : 27/03/2019, 12:38:07 AM
    Author     : juann
--%>
    <%@ include file="header2.jsp" %>
    <body id="page-top">
        
        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                  <a class="sidebar-brand d-flex align-items-center justify-content-center" href="./inicio">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <i class="fas fa-laugh-wink"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3"> ${mensaje.get("SAAN")} <sup> ${mensaje.get("SAAN")}</sup></div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">


                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Heading -->
                <div class="sidebar-heading">
                    ${mensaje.get("menu")}
                </div>

                <!-- Mejores grupos -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="./inicio">
                        <img class="img-profile rounded-circle" src="https://cdn1.iconfinder.com/data/icons/unigrid-bluetone-human-vol-1/60/011_007_collective_group_masses_people_company-128.png">
                        <span style="font-size: 70%;">${mensaje.get("megru")}</span>
                    </a>
                </li>
                <!-- Personas que van perdiendo -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="./estudiantesPerdiendo">
                        <img class="img-profile rounded-circle" src="https://cdn4.iconfinder.com/data/icons/jetflat-2-gestures/60/007_002_no_dislike_disagree_vote_thumbs-down_thumbs_left-128.png">
                        <span style="font-size: 70%;">${mensaje.get("estper")}</span>
                    </a>
                </li>
                <!--Generar datos ficticios-->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="./datosFicticios">
                        <img class="img-profile rounded-circle" src="https://cdn2.iconfinder.com/data/icons/ui-data-storage-sever/64/data-storage-add-256.png">
                        <span style="font-size: 70%;"> ${mensaje.get("generar")}</span>
                    </a>
                </li>
                <!--Volver al menu de usuario-->
                <c:if test="${not empty usua}">
                <li class="nav-item">
                    <a class="nav-link collapsed" href="./adminMenu">
                        <img class="img-profile rounded-circle" src="https://cdn3.iconfinder.com/data/icons/flat-pro-user-management-set-4/32/user-menu-256.png">
                        <span style="font-size: 70%;">Menu de usuario</span>
                    </a>
                </li>
                </c:if>
            </ul>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <%@ include file="header.jsp" %>


      <!-- Main Content -->
      <div id="content" style="font-size: auto;">

        
          <!--<img style="width: 100%; height: 200%" src="https://codigoespagueti.com/wp-content/uploads/2015/05/Gmail-GIF.gif">--!>


          <!-- Begin Page Content -->
          <c:if test="${not empty grupos}">
                 <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">Mejores grupos</h6>
            </div>
            
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    
                  <thead>
                    <tr>
                      <th> ${mensaje.get("Materia")}</th>
                      <th> ${mensaje.get("Numero")}</th>
                      <th> ${mensaje.get("Docente")}</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                        <c:forEach items="${grupos}" var="grp">
                            <td>${grp.getMateria().getNombre()}</td>
                            <td>${grp.getNumero()}</td>
                            <td>${grp.getProfesor().getNombre()}</td>
                        </c:forEach>
                    </tr>

                  </tbody>
                </table>
              </div>
            </div>
          </div>
            </c:if>
          <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <%@ include file="footer.jsp" %>
      




