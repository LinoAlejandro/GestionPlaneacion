<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="profesor">
    <title>Lista de catedras</title>
  </head>
  <body>
    <div class="container my-4">
      <div class="row">
        <div class="col display-4 mb-5">
          Lista de catedras
        </div>
      </div>
      <div class="row">
        <div class="col">
          <table class="table">
            <thead>
              <tr>
                <td>Clave</td>
                <td>Grupo(s)</td>
                <td></td>
              </tr>
            </thead>
            <tbody>
              <g:each in="${catedras}">
                <tr>
                  <td>${it.identificador}</td>
                  <td>
                    <ul>
                      <g:each in="${it.grupos}">
                        <li>${it.clave}</li>
                      </g:each>
                    </ul>
                  </td>
                  <td>
                    <g:link action="calificar" class="btn btn-sm btn-outline-dark" params="[id:it.id, parcial:'Primero']">
                      Calificar primer parcial
                    </g:link>
                  </td>
                  <td>
                    <g:link action="calificar" class="btn btn-sm btn-outline-dark" params="[id:it.id, parcial:'Segundo']">
                      Calificar segundo parcial
                    </g:link>
                  </td>
                  <td>
                    <g:link action="calificar" class="btn btn-sm btn-outline-dark" params="[id:it.id, parcial:'Tercero']">
                      Calificar tercer parcial
                    </g:link>
                  </td>
                  <td>
                    <g:link action="calificar" class="btn btn-sm btn-outline-dark" params="[id:it.id, parcial:'Ordinario']">
                      Calificar ordinario
                    </g:link>
                  </td>
                </tr>
              </g:each>
            </tbody>
          </table>
        </div>
      </div>
      <div class="row">
        <div class="">
          <g:link action="create" controller="catedra" class="btn btn-outline-dark">Crear nueva catedra</g:link>
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
                    maxsteps="10" controller="calificacion"
                    action="indexCatedras" total="${catedrasCount}" class="mx-auto"/>
        </div>
      </div>
    </div>
  </body>
</html>
