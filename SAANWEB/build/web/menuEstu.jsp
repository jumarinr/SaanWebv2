<%@ include file="header2.jsp" %>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/SAAN">
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

            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages2" aria-expanded="true" aria-controls="collapsePages2">
                    <img class="img-profile rounded-circle" src="https://www.flaticon.es/premium-icon/icons/svg/1604/1604471.svg">
                    <span style="font-size: 90%;">Nota</span>
                </a>
                <div id="collapsePages2" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Opciones</h6>
                        <a class="collapse-item" href="#">Buscar</a>
                    </div>
                </div>
            </li>
             <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
                    <img class="img-profile rounded-circle" src="https://cdn0.iconfinder.com/data/icons/education-flat-7/128/09_Examination-512.png">
                    <span style="font-size: 90%;">Matricula</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Opciones</h6>
                        <a class="collapse-item" href="#">Registrar</a>
                        <a class="collapse-item" href="#">Modificar</a>
                        <a class="collapse-item" href="#">Borrar</a>
                        <a class="collapse-item" href="#">Buscar</a>
                        <a class="collapse-item" href="#">Listar</a>
                    </div>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages4" aria-expanded="true" aria-controls="collapsePages4">
                    <img class="img-profile rounded-circle" src="https://cdn3.iconfinder.com/data/icons/unigrid-phantom-human-vol-1/60/011_007_collective_group_masses_people_company-256.png">
                    <span style="font-size: 90%;">Grupo</span>
                </a>
                <div id="collapsePages4" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Opciones</h6>
                        <a class="collapse-item" href="#">Buscar</a>                        
                    </div>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages3" aria-expanded="true" aria-controls="collapsePages">
                    <img class="img-profile rounded-circle" src="https://cdn2.iconfinder.com/data/icons/flat-school/256/school_book_noterbook-256.png">
                    <span style="font-size: 90%;">Materia</span>
                </a>
                <div id="collapsePages3" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Opciones</h6>
                        <a class="collapse-item" href="#">Buscar</a>
                    </div>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages5" aria-expanded="true" aria-controls="collapsePages">
                    <img class="img-profile rounded-circle" src="https://image.flaticon.com/icons/svg/149/149071.svg">
                    <span style="font-size: 90%;">Perfil</span>
                </a>
                <div id="collapsePages5" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Opciones</h6>
                        <a class="collapse-item" href="#">Cambiar contraseña</a>
                        <a class="collapse-item" href="#">Cambiar nombre</a>
                    </div>
                </div>
            </li>
        </ul>
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
                                <h6 class="m-0 font-weight-bold text-primary">Información usuario</h6>
                            </div>
                            <!-- Card Body -->

                            <c:if test="${empty usu}">
                                <div style="font-size: 100%" class="card-body">
                                    <h5>Nombre:</h5>
                                    ${usua.getNombre()}
                                    <br/><br/>
                                    <h5>Documento:</h5>
                                    ${usua.getIdentificacion()}
                                    <br/><br/>
                                    <h5>Correo:</h5>
                                    ${usua.getCorreo()}
                                    <br/><br/>
                                    <h5>Rol:</h5>
                                    Estudiante
                                </div>
                            </c:if>
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
