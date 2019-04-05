    <%@ include file="header2.jsp" %>
    

<body class="bg-gradient-primary">

  <div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

      <div class="col-xl-10 col-lg-12 col-md-9">

        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
   
            <div class="row" style="align-items: center;">
                <div style="width: auto; margin-left: 5%; margin-top: 5%">
                    <img src="https://media.giphy.com/media/aOften89vRbG/giphy.gif"/>
                </div>
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">${mensaje.get("iniciar")}</h1>
                  </div>
                    <form action="./login" method="POST" class="user">
                    <div class="form-group">
                        <input type="text"  required class="form-control form-control-user" id="id" name="id" aria-describedby="emailHelp" placeholder="${mensaje.get("placeholderCorreo")}" autofocus>
                    </div>
                    <div class="form-group">
                        <input type="password" required class="form-control form-control-user" id="clave" name="clave" placeholder="${mensaje.get("placeholderContra")}">
                    </div>
                    
                      <input type="submit"  value="${mensaje.get("init")}" class="btn btn-primary btn-user btn-block"/>
                    
                  </form>
                  <hr>
                  <div class="text-center">
                    <a class="small" href="./recuperarContrasena">${mensaje.get("recup")}</a>
                  </div>
                  <div class="text-center">
                    <a class="small" href="./inicio">${mensaje.get("volver")}</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>




    <%@ include file="footer.jsp" %>