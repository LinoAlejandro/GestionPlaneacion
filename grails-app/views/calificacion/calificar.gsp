<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="profesor">
    <title>Calificar</title>
  </head>
  <body>
    <div class="container mt-5">
      <div class="h1">
        Lista de alumnos inscritos en la catedra: ${catedra.identificador}
      </div>
    </div>
    <div class="container mt-3">
      <div class="row">
        <g:each var="grupo" in="${grupoAlumnosArray}">
          <div class="col-md-12 mt-3">
            <div class="h3">
              ${grupo.grupo.clave}
            </div>
            <table class="table" id="${grupo.grupo.clave}">
              <thead>
                <tr>
                  <td>Nombre del alumno</td>
                  <g:each var="puntaje" in="${puntajes}">
                    <td>${puntaje.descripcion} - ${puntaje.valor}%</td>
                  </g:each>
                </tr>
              </thead>
              <tbody>
                <g:each var="alumno" in="${grupo.alumnos}">
                  <tr>
                    <td>${alumno.alumno.apPaterno} ${alumno.alumno.apMaterno} ${alumno.alumno.nombre}</td>
                    <g:each var="calificacionPuntaje" in="${alumno.calificacionesPuntajes}">
                      <td>
                        <input type="number" id="${calificacionPuntaje.calificacion.id}" step="any" name="" class="campo" value='${calificacionPuntaje.calificacion.calificacion ?: null}'>
                      </td>
                    </g:each>
                  </tr>
                </g:each>
              </tbody>
            </table>
            <div class="">
              <button type="button" name="button" class="btn btn-outline-dark" onclick="agregarCalificaciones(${grupo.grupo.clave})">Actualizar</button>
            </div>
          </div>
        </g:each>
        <script type="text/javascript">
            function agregarCalificaciones(table) {
                var array = []
                for (var i = 1; i < table.rows.length; i++) {
                    var inputs = table.rows[i].getElementsByClassName('campo')
                    console.log(inputs)
                    console.log(inputs.length)
                    for (var j = 0; j < inputs.length; j++) {
                      var input = inputs[j]
                      var arraycito = [input.id, input.value]
                      array.push(arraycito)
                    }
                }
                var json = {}
                for (var i = 0; i < array.length; i++) {
                  json[i] = array[i]
                }
                json['jsonLength'] = array.length
                console.log(json)
                $.post('${createLink(action:"asignarCalificacion", controller:"calificacion")}',
                  json,
                  function(data, status) {

                  })
            }
        </script>
      </div>
    </div>
  </body>
</html>
