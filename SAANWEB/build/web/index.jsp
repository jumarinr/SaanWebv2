<%--
    Document   : index
    Created on : 17/03/2019, 09:27:33 PM
    Author     : pipel
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
                    <div class="sidebar-brand-text mx-3">SAAN <sup>WEB</sup></div>
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
                    <a class="nav-link collapsed" href="./mejoresGrupos">
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
                        <span style="font-size: 70%;">Generar datos ficticios</span>
                    </a>
                </li>

            </ul>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <%@ include file="header.jsp" %>


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
                              <h6 class="m-0 font-weight-bold text-primary">Integrantes</h6>

                          </div>
                          <!-- Card Body -->

                          <div style="font-size: 100%" class="card-body">
                              <ol>
                                  <li>
                                      Juan Pablo Moya Alarcón
                                  </li>
                                  <li>
                                      Juan Diego Marin Rodriguez
                                  </li>
                                  <li>
                                      Juan Felipe Usuga Villegas
                                  </li>
                                  <li>
                                      Julian Ospina Murgueitio
                                  </li>

                              </ol>
                              <br/><br/>
                          </div>
                      </div>
                  </div>

                  <!-- Pie Chart -->
                  <div class="col-xl-4 col-lg-5">
                      <div class="card shadow mb-4">
                          <!-- Card Header - Dropdown -->
                          <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                              <h6 class="m-0 font-weight-bold text-primary">SAAN</h6>

                          </div>
                          <!-- Card Body -->
                          <div class="card-body">
                              <img style="width: 96.5%; height: 96%" src="https://codigoespagueti.com/wp-content/uploads/2015/05/Gmail-GIF.gif">
                          </div>
                      </div>
                  </div>
              </div>

          </div>
          <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->
      
      <!-- more content -->
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
                              <h6 class="m-0 font-weight-bold text-primary">Funcionalidades especiales</h6>

                          </div>
                          <!-- Card Body -->

                          <div style="font-size: 100%" class="card-body">
                              <ol>
                                  <li>
                                      Enviar correos al actualizar, borrar, modificar y añadir una nota
                                  </li>
                                  <li>
                                      Generar reportes de excel
                                  </li>
                                  <li>
                                      Mostrar los mejores grupos
                                  </li>
                                  <li>
                                      Mostrar los estudiantes que van perdiendo
                                  </li>

                              </ol>
                              <br/><br/>
                          </div>
                      </div>
                  </div>

                  <!-- Pie Chart -->
                  <div class="col-xl-4 col-lg-5">
                      <div class="card shadow mb-4">
                          <!-- Card Header - Dropdown -->
                          <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                              <h6 class="m-0 font-weight-bold text-primary">Recuerden siempre</h6>

                          </div>
                          <!-- Card Body -->
                          <div class="card-body">
                              <p style="font-size: 70%">No robar nunca computadores de los vecinos</p>
                              <img style="width:51%; height: 50.5%" src="https://media.giphy.com/media/wvQIqJyNBOCjK/giphy.gif">
                          </div>
                      </div>
                  </div>
              </div>

          </div>
          <!-- /.container-fluid -->

      </div>
      <!-- end of more content -->

      <!-- Footer -->
      <%@ include file="footer.jsp" %>
      