<!doctype html>
<html>
<head>
  <sec:ifAnyGranted roles="ROLE_ADMIN">
    <meta name="layout" content="admin"/>
  </sec:ifAnyGranted>
  <sec:ifAnyGranted roles="ROLE_PROFESOR">
    <meta name="layout" content="profesor"/>
  </sec:ifAnyGranted>
  <title>Planeaciones</title>
</head>
<body>
  <sec:ifAnyGranted roles="ROLE_ADMIN">
    <div class="container-fluid py-5 text-light" style="border-bottom: 1px solid black; background-color: #323232;">
      <div class="row">
        <div class="col">
          <div class="display-4 p-2">
            Bienvenido administrador
          </div>
          <hr class="bg-light" />
          <div class="lead p-2">
            Plataforma de gestión de Planeaciones
          </div>
        </div>
      </div>
    </div>
    <div class="container mt-5">
      <div class="row justify-content-center align-items-center">
        <div class="col">
          <p class="h3 text-center">A su disposición se encuentran las siguientes funcionalidades</p>
        </div>
      </div>
      <div class="row">
        <div class="col">
          <hr style="background-color: #323232;">
        </div>
      </div>
      <div class="row">
        <div class="col">
          <ul class="ul">
            <li>Creación, actualización y eliminación de profesores</li>
            <li>Creación, actualización y eliminación de alumnos</li>
            <li>Creación, actualización y eliminación de materias</li>
            <li>Creación, actualización y eliminación de grupos</li>
            <li>Creación, actualización y eliminación de administradores</li>
          </ul>
        </div>
      </div>
    </div>
  </sec:ifAnyGranted>

  <sec:ifAnyGranted roles="ROLE_PROFESOR">
    <div class="container-fluid py-5 text-light" style="border-bottom: 1px solid black; background-color: #323232;">
      <div class="row">
        <div class="col">
          <div class="display-4 p-2">
            Bienvenido <sec:loggedInUserInfo field='username'/>
          </div>
          <hr class="bg-light">
          <div class="lead p-2">
            Plataforma de gestión de Planeaciones
          </div>
        </div>
      </div>
    </div>
    <div class="container mt-5">
      <div class="row justify-content-center align-items-center">
        <div class="col">
          <p class="h3 text-center">A su disposición se encuentran las siguientes funcionalidades</p>
        </div>
      </div>
      <div class="row">
        <div class="col">
          <hr style="background-color: #323232;">
        </div>
      </div>
      <div class="row">
        <div class="col">
          <ul class="ul">
            <li>Creación, actualización y eliminación de catedras</li>
            <li>Creación, actualización y eliminación de planeaciones magisteriales</li>
            <li>Creación, actualización y eliminación de calificaciones</li>
            <li>Gestión de alumnos irregulares</li>
            <li>Gestión de mensajes de los alumnos</li>
          </ul>
        </div>
      </div>
    </div>
  </sec:ifAnyGranted>

</body>
</html>
