<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="admin">
    <title>Index Alumnos</title>
  </head>
  <body>
    <div class="container mt-3">
      <div class="row">
        <div class="col">
          <div class="display-4">
            Lista de alumnos
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col">
          <table class="table">
            <thead>
              <tr>
                <td>Nombre</td>
                <td>Username</td>
                <td>Matrícula</td>
                <td></td>
                <td></td>
              </tr>
            </thead>
            <tbody>
              <g:each in="${alumnos}">
              <tr>
                <td>${it.nombre}</td>
                <td>${it.username}</td>
                <td>${it.matricula}</td>
                <td>
                  <g:link action="update" params="[id:it.id, offset:params.offset]" url="" absolute="" base="">Modificar</g:link>
                </td>
                <td>
                  <g:link action="delete" params="[id:it.id, offset:params.offset]" url="" absolute="" base="">Eliminar</g:link>
                </td>
              </tr>
              </g:each>
            </tbody>
          </table>
        </div>
      </div>
    </div>
    <div class="container">
      <g:link action="create" class="btn btn-outline-dark">Crear nuevo alumno</g:link>
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
                    maxsteps="10" controller="alumnos"
                    action="index" total="${alumnosCount}" class="mx-auto"/>
        </div>
      </div>
    </div>
  </body>
</html>
