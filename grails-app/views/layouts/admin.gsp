<!doctype html>
<html lang="en" class="no-js">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <title>
      <g:layoutTitle default="Grails"/>
  </title>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>

  <asset:javascript src="bootstrap/jquery-3.3.1.js"/>
  <asset:javascript src="bootstrap/pooper.min.js"/>
  <asset:javascript src="bootstrap/bootstrap.min.js"/>
  <asset:javascript src="fontAwesome/fontawesome-all.js"/>

  <asset:stylesheet  src="bootstrap/bootstrap.css" rel="stylesheet" media="screen" />
  <asset:stylesheet  src="fontAwesome/fa-svg-with-js.css" rel="stylesheet" media="screen" />
  <asset:stylesheet  src="custom/layout/default.css" rel="stylesheet" media="screen" />

  <g:layoutHead />
</head>
<body>
  <nav class="navbar navbar-expand-lg navbar-dark" style="background-color:#323232;">
    <a clasS="navbar-brand" href="/">GDP</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item custom-navbar-item">
          <a class="nav-link" href="/">Inicio</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Profesores
          </a>
          <div class="dropdown-menu border" aria-labelledby="navbarDropdown" style="background-color:#323232;">
            <g:link class="dropdown-item text-white" action="create" controller="profesor" params="">Crear profesor</g:link>
            <g:link class="dropdown-item text-white" action="index" controller="profesor" params="">Lista de profesores</g:link>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Alumnos
          </a>
          <div class="dropdown-menu border" aria-labelledby="navbarDropdown" style="background-color:#323232;">
            <g:link class="dropdown-item text-white" action="create" controller="alumno" params="">Crear alumno</g:link>
            <g:link class="dropdown-item text-white" action="index" controller="alumno" params="">Lista de alumnos</g:link>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Materias
          </a>
          <div class="dropdown-menu border" aria-labelledby="navbarDropdown" style="background-color:#323232;">
            <g:link class="dropdown-item text-white" action="create" controller="materia" params="">Crear materia</g:link>
            <g:link class="dropdown-item text-white" action="index" controller="materia" params="">Lista de materias</g:link>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Grupos
          </a>
          <div class="dropdown-menu border" aria-labelledby="navbarDropdown" style="background-color:#323232;">
            <g:link class="dropdown-item text-white" action="create" controller="grupo" params="">Crear grupo</g:link>
            <g:link class="dropdown-item text-white" action="index" controller="grupo" params="">Lista de grupos</g:link>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Administradores
          </a>
          <div class="dropdown-menu border" aria-labelledby="navbarDropdown" style="background-color:#323232;">
            <g:link class="dropdown-item text-white" action="create" controller="administrador" params="">Crear administrador</g:link>
            <g:link class="dropdown-item text-white" action="index" controller="administrador" params="">Lista de administradores</g:link>
          </div>
        </li>
      </ul>
      <ul class="navbar-nav ml-auto">
        <sec:ifLoggedIn>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <sec:loggedInUserInfo field='username'/>
            </a>
            <div class="dropdown-menu dropdown-menu-right border" aria-labelledby="navbarDropdown" style="background-color:#323232;">
              <a class="dropdown-item text-white" href="/persona/modificar">Mis datos</a>
              <a class="dropdown-item text-white" href="/logoff">Salir</a>
            </div>
          </li>
        </sec:ifLoggedIn>
        <sec:ifNotLoggedIn>
          <li class="nav-item">
            <a class="nav-link" href="/login/auth">Log in</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/persona/crear">Crear cuenta</a>
          </li>
        </sec:ifNotLoggedIn>
      </ul>
    </div>
  </nav>

  <g:layoutBody />

  <footer class="footer mt-5" style="background-color: rgb(50, 50, 50);">
      <div class="container px-3 py-2 text-light">
        Marca registrada <span class="text-muted">TM</span>
      </div>
  </footer>
</body>
</html>
