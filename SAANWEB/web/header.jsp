<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="utf-8">
        <title>Welcome to MyPage</title>
        <link rel="stylesheet" type="text/css" href="css/style.css" />
    </head>
    <div id="content-wrapper" class="d-flex flex-column">
        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

            <!-- Sidebar Toggle (Topbar) -->
            <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                <i class="fa fa-bars"></i>
            </button>

            <!-- AVISO SAAN -->


            <div class="input-group-append" style="margin-top: 1%;">
                <h4 style="font-size: 90%;">${mensaje.get("saAn")}</h4>
            </div>



            <!-- Topbar Navbar -->
            <ul class="navbar-nav ml-auto">

                <div class="topbar-divider d-none d-sm-block"></div>
                <!-- Nav Item - User Information -->
                <c:if test="${empty usua}">
                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="./login" id="userDropdown" role="button" aria-haspopup="true" aria-expanded="false">
                            <span class="mr-2 d-none d-lg-inline text-gray-600 small">${mensaje.get("inisec")}</span>
                            <img class="img-profile rounded-circle" src="https://cdn1.iconfinder.com/data/icons/unigrid-bluetone-symbols-arrows-vol-3/60/024_106_enter_input_login_door_sign-128.png">
                        </a>
                    </li>
                </c:if>
                <c:if test="${not empty usua}">
                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="./logout" id="userDropdown" role="button"  aria-haspopup="true" aria-expanded="false">
                            <span class="mr-2 d-none d-lg-inline text-gray-600 small">Cerrar sesion</span>
                            <img class="img-profile rounded-circle" src="https://cdn0.iconfinder.com/data/icons/basic-element-blue-filled/614/786_-_Logout-256.png">
                        </a>
                    </li>
                </c:if>
            </ul>

        </nav>
        <!-- End of Topbar -->
