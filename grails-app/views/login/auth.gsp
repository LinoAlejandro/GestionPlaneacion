<html><head>
	<meta name="layout" content="default">
	<title>Login</title>
  <asset:stylesheet  src="custom/login/auth.css" rel="stylesheet" media="screen" />
</head>
<body>
  <div class="container mt-5 pt-5">
    <div class="row justify-content-center">
      <div class="col-xl-4 col-lg-6 col-md-6 col-sm-8 justify-content-center rounded pt-5 login-box">
        <div class="display-4 text-center mt-2 text-light">
          Iniciar sesión
        </div>
        <div class="mx-auto px-2 py-5">
					<g:form name="name" controller="login" action="authenticate">
            <div class="input-group mb-3">
              <div class="input-group-prepend">
                <span class="input-group-text text-light px-3" id="basic-addon1" style="background-color: #282828; border: solid 1px #282828;">
                  <i class="fas fa-user"></i>
                </span>
              </div>
              <input type="text" class="form-control" name="username" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
            </div>
            <div class="input-group mb-3">
              <div class="input-group-prepend">
                <span class="input-group-text text-light px-3" id="basic-addon1" style="background-color: #282828; border: solid 1px #282828;">
                  <i class="fas fa-lock"></i>
                </span>
              </div>
              <input type="password" class="form-control" name="password" placeholder="Password" aria-label="Username" aria-describedby="basic-addon1">
            </div>
            <hr class="bg-light">
            <div class="">
              <input type="submit" class="btn btn-block text-light btn-md mb-3" value="Login" style="background-color:#282828"/>
            </div>
            <div class="">
              <a class="d-block btn text-light btn-md" style="background-color: #;">Crear cuenta<a/>
            </div>
      		</g:form>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
