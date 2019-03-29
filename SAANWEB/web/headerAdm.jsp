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

            <li class="nav-item">
                <a class="nav-link collapsed" href="./menuAdministrador">
                        <img class="img-profile rounded-circle" src="https://cdn3.iconfinder.com/data/icons/basicolor-essentials/24/001_home-256.png">
                    <span style="font-size: 90%;">Inicio</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
                    <img class="img-profile rounded-circle" src="https://cdn3.iconfinder.com/data/icons/education-flat-5/614/245_-_Reading-256.png">
                    <span style="font-size: 90%;">Estudiante</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Opciones</h6>
                        <a class="collapse-item" href=
                           "./administrador_registrarEstudiante">Registrar</a>
                        <a class="collapse-item" href="./administrador_buscarEstudiante">Consultar</a>
                    </div>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages2" aria-expanded="true" aria-controls="collapsePages">
                    <img class="img-profile rounded-circle" src="https://cdn3.iconfinder.com/data/icons/education-ultimate-set/512/lecture-256.png">
                    <span style="font-size: 90%;">Profesor</span>
                </a>
                <div id="collapsePages2" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Opciones</h6>
                        <a class="collapse-item" href="./administrador_registrarProfesor">Registrar</a>
                        <a class="collapse-item" href="./administrador_buscarProfesor">Consultar</a>
                    </div>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages3" aria-expanded="true" aria-controls="collapsePages">
                    <img class="img-profile rounded-circle" src="https://cdn3.iconfinder.com/data/icons/marketing-management-7/64/operations-management-administration-employee-256.png">
                    <span style="font-size: 90%;">Administrador</span>
                </a>
                <div id="collapsePages3" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Opciones</h6>
                        <a class="collapse-item" href="./administrador_registrarAdministrador">Registrar</a>
                        <a class="collapse-item" href="./administrador_buscarAdministrador">Consultar</a>
                    </div>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages4" aria-expanded="true" aria-controls="collapsePages">
                    <img class="img-profile rounded-circle" src="https://cdn2.iconfinder.com/data/icons/flat-school/256/school_book_noterbook-256.png">
                    <span style="font-size: 90%;">Materia</span>
                </a>
                <div id="collapsePages4" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Opciones</h6>
                        <a class="collapse-item" href="./administrador_registrarMateria">Registrar</a>
                        <a class="collapse-item" href="./administrador_buscarMateria">Consultar</a>
                    </div>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages5" aria-expanded="true" aria-controls="collapsePages">
                    <img class="img-profile rounded-circle" src="https://cdn3.iconfinder.com/data/icons/unigrid-phantom-human-vol-1/60/011_007_collective_group_masses_people_company-256.png">
                    <span style="font-size: 90%;">Grupo</span>
                </a>
                <div id="collapsePages5" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Opciones</h6>
                        <a class="collapse-item" href="./administrador_registrarGrupo">Registrar</a>
                        <a class="collapse-item" href="./administrador_buscarGrupo">Consultar</a>
                        <a class="collapse-item" href="#">Comsultar por materia</a>
                    </div>
                </div>
            </li>
        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <%@ include file="header.jsp" %>

