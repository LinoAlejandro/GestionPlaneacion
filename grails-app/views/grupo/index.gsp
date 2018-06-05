<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="admin">
    <title>Index Grupo</title>
  </head>
  <body>
    <div class="container mt-3">
      <div class="row">
        <div class="col">
          <div class="display-4">
            Lista de grupos
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col">
          <table class="table">
            <thead>
              <tr>
                <td>Clave</td>
                <td>Carrera</td>
                <td></td>
                <td></td>
              </tr>
            </thead>
            <tbody>
              <g:each in="${grupos}">
              <tr>
                <td>${it.clave}</td>
                <td>${it.carrera}</td>
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
      <g:link action="create" class="btn btn-outline-dark">Crear nuevo grupo</g:link>
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
                    maxsteps="10" controller="grupo"
                    action="index" total="${gruposCount}" class="mx-auto"/>
        </div>
      </div>
    </div>
  </body>
</html>
