<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="profesor">
    <title>Calificar</title>
  </head>
  <body>
    <div class="container my-4">
      <div class="row">
        <div class="col display-4 mb-5">
          Añada una calificación
        </div>
      </div>
    </div>
    <div class="container">
      <div class="row">
        <div class="col">
          <g:each in="${personas}">
            <g:each in="${it}">
              ${it.alumno.nombre}
              <g:each in="${it.puntajes}">
              </g:each>
            </g:each>
          </g:each>
        </div>
      </div>
    </div>
  </body>
</html>
