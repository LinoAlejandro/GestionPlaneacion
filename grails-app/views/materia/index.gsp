<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="admin">
    <title>Lista de materias</title>
  </head>
  <body>
    <div class="container py-4">
      <div class="row">
        <div class="col h3">
          Lista de materias
        </div>
      </div>
      <div class="row">
        <div class="col">
          <table class="table">
            <thead>
              <tr>
                <td>Clave</td>
                <td>Nombre</td>
                <td>Semestre</td>
                <td></td>
                <td></td>
              </tr>
            </thead>
            <tbody>
              <g:each in="${materias}">
                <tr>
                  <td>${it.clave}</td>
                  <td>${it.nombre}</td>
                  <td>${it.semestre}</td>
                  <td>
                    <g:link action="delete" params="[id:it.id]">Eliminar</g:link>
                  </td>
                  <td>
                    <g:link action="update" params="[id:it.id]">Modificar</g:link>
                  </td>
                </tr>
              </g:each>
            </tbody>
          </table>
        </div>
      </div>
      <div class="row">
        <div class="col">
          <g:link action="create" class="btn btn-outline-dark">Crear nueva materia</g:link>
        </div>
      </div>
    </div>
    <style media="screen">
      .paginate a {
        color: black;
        padding-left: 5px;
        padding-right: 5px;
      }
    </style>
    <div class="container">
      <div class="row justify-content-center">
        <div class="col text-center paginate">
          <g:paginate next="Forward" prev="Back"
                    maxsteps="10" controller="materia"
                    action="index" total="${materiasCount}" class="mx-auto"/>
        </div>
      </div>
    </div>
  </body>
</html>
