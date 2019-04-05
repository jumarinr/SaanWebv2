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
                <div class="sidebar-brand-text mx-3">${mensaje.get("SAAN")}<sup>${mensaje.get("Web")}</sup></div>
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
                        <a class="collapse-item" href="./estuBuscarNotas">Buscar</a>
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
                        <a class="collapse-item" href="./estuRegistrarMatricula">Registrar</a>
                        <a class="collapse-item" href="./estuBuscarMatricula">Buscar</a>
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
                        <a class="collapse-item" href="./estuBuscarGrupo">Buscar</a>                        
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
                        <a class="collapse-item" href="./estuBuscarMateria">Buscar</a>
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
                        <a class="collapse-item" href="./estuCambiarContrasena">Cambiar contraseña</a>
                        <a class="collapse-item" href="./estuCambiarNombre">Cambiar nombre</a>
                    </div>
                </div>
            </li>
        </ul>
        <%@ include file="header.jsp" %>
