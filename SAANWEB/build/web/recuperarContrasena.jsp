<%-- 
    Document   : recuperarContrasena
    Created on : 26/03/2019, 11:27:22 PM
    Author     : juann
--%>

       <%@ include file="header2.jsp" %>

<body class="bg-gradient-primary">

  <div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

      <div class="col-xl-10 col-lg-12 col-md-9">

        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
                <div style="width: auto; margin-left: 5%; margin-top: 5%">
                    <img src="https://i.pinimg.com/originals/f8/0a/78/f80a78a4dc129a91f1eed44691c3870a.gif">
                </div>
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-2">${mensaje.get("olvido2")}</h1>
                    <p class="mb-4">${mensaje.get("olvidoCuerpo")}</p>
                  </div>
                  <form action="./recuperarContrasena" method="POST"  class="user">
                    <div class="form-group">
                      <input type="string" class="form-control form-control-user"name="inputEmail" id="inputEmail" aria-describedby="emailHelp" placeholder="${mensaje.get("placeholderCorreo")}">
                    </div>
                    <input type="submit"  value="${mensaje.get("generarCodigo")}" class="btn btn-primary btn-user btn-block"/>
                  </form>
                  <hr>
                  <div class="text-center">
                    <a class="small" href="./login">${mensaje.get("yaCuenta")}</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>

       <%@ include file="footer.jsp" %>