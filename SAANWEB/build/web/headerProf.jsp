<%-- 
    Document   : headerProf
    Created on : 27/03/2019, 01:06:17 AM
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

            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
                    <img class="img-profile rounded-circle" src="https://www.flaticon.es/premium-icon/icons/svg/1604/1604471.svg">
                    <span style="font-size: 90%;">Nota</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Opciones</h6>
                        <a class="collapse-item" href="./regnota">Registrar</a>                       
                        <a class="collapse-item" href="./buscarnota">Buscar</a>
                        <a class="collapse-item" href="./mejoresnotas">Ver mejores notas</a>
                    </div>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages2" aria-expanded="true" aria-controls="collapsePages">
                    <img class="img-profile rounded-circle" src="https://cdn3.iconfinder.com/data/icons/unigrid-phantom-human-vol-1/60/011_007_collective_group_masses_people_company-256.png">
                    <span style="font-size: 90%;">Grupo</span>
                </a>
                <div id="collapsePages2" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Opciones</h6>
                        <a class="collapse-item" href="./buscargrupo">Buscar</a>                        
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
                        <a class="collapse-item" href="./buscarmateria">Buscar</a>
                        <a class="collapse-item" href="./generarreporte">Generar reporte</a>                        
                    </div>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages4" aria-expanded="true" aria-controls="collapsePages">
                    <img class="img-profile rounded-circle" src="https://image.flaticon.com/icons/svg/1646/1646651.svg">
                    <span style="font-size: 90%;">Evento</span>
                </a>
                <div id="collapsePages4" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Opciones</h6>
                       <a class="collapse-item" href="./crearevento">Crear nuevo evento</a>
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
                        <a class="collapse-item" href="./cambiarcontrasena">Cambiar contraseña</a>
                        <a class="collapse-item" href="./cambiarnombre">Cambiar nombre</a>
                        <a class="collapse-item" href="./menuprof">Ver perfil</a>
                    </div>
                </div>
            </li>
        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <%@ include file="header.jsp" %>