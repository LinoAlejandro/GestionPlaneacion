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
          Lista de administradores
        </div>
      </div>
      <div class="row">
        <div class="col">
          <table class="table">
            <thead>
              <tr>
                <td>Username</td>
                <td></td>
                <td></td>
              </tr>
            </thead>
            <tbody>
              <g:each in="${administradores}">
                <tr>
                  <td>${it.username}</td>
                  <td>
                    <g:link action="delete" params="[id:it.id, offset:params.offset]">Eliminar</g:link>
                  </td>
                  <td>
                    <g:link action="update" params="[id:it.id, offset:params.offset]">Modificar</g:link>
                  </td>
                </tr>
              </g:each>
            </tbody>
          </table>
        </div>
      </div>
      <div class="row">
        <div class="col">
          <g:link action="create" class="btn btn-outline-dark">Crear nuevo administrador</g:link>
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
                    maxsteps="10" controller="administrador"
                    action="index" total="${administradoresCount}" class="mx-auto"/>
        </div>
      </div>
    </div>
  </body>
</html>
