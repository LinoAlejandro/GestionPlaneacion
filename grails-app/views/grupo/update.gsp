<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="admin">
    <title>Actualice un grupo</title>
  </head>
  <body>
    <div class="container mt-5">
      <div class="row">
        <div class="col">
          <div class="display-4 mb-4">
            Actualice un grupo
          </div>
        </div>
      </div>
      <g:form name="name" action="update">
      <input type="hidden" name="id" value="${grupo.id}">
        <div class="row">
          <div class="col">
            <div class="form-group">
              <label for="clave">Clave</label>
              <input type="text" name="clave" value="${grupo?.clave}" class="form-control">
            </div>
            <div class="form-group">
              <label for="carrera">Carrera</label>
              <input type="text" name="carrera" value="${grupo?.carrera}" class="form-control">
            </div>
            <div class="form-group">
              <label for="semestre">Semestre</label>
              <select name="semestre" class="form-control">
                <option value="Primero">Primero</option>
                <option value="Segundo">Segundo</option>
                <option value="Tercero">Tercero</option>
                <option value="Cuarto">Cuarto</option>
                <option value="Quinto">Quinto</option>
                <option value="Sexto">Sexto</option>
                <option value="Séptimo">Séptimo</option>
                <option value="Octavo">Octavo</option>
              </select>
            </div>
            <div class="form-group pt-3">
              <input type="submit" name="" value="Actualizar"  class="btn btn-md btn-outline-dark">
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col">
            <hr class="bg-dark">
            <div class="h3 my-3">
              Lista de alumnos inscritos en el grupo
            </div>
            <table class="table">
              <thead>
                <tr>
                  <td>Nº Lista</td>
                  <td>Nombre</td>
                  <td>Matricula</td>
                  <td></td>
                  <td></td>
                </tr>
              </thead>
              <tbody id="tableAlumnos">
                <g:each in="${grupo.alumnos}">
                  <tr>
                    <td>${it.numeroLista}</td>
                    <td>${it.persona.apPaterno} ${it.persona.apMaterno} ${it.persona.nombre}</td>
                    <td>${it.persona.matricula}</td>
                    <td>
                      <g:link action="deleteAlumno" params="[id:it.id]">Eliminar</g:link>
                    </td>
                    <td>
                      <g:link action="updateAlumno" params="[id:it.id]">Actualizar</g:link>
                    </td>
                  </tr>
                </g:each>
              </tbody>
            </table>
          </div>
        </div>
      </g:form>
    </div>
    <div class="container mt-2">
      <div class="row">
        <div class="col">
          <hr class="bg-dark">
          <div class="h3">
            Agregar alumnos
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col">
          <div class="form-group">
            <label for="matricula">Matricula de inicio</label>
            <input id="matriculaInicio" type="text" name="matriculaInicio" value="" class="form-control">
            <label for="matricula">Matricula final</label>
            <input id="matriculaFinal" type="text" name="matriculaFinal" value="" class="form-control">
          </div>
          <div class="form-group">
            <button id="agregar" type="" name="button" class="btn btn-outline-dark" onclick="addAlumnos()">Agregar</button>
          </div>
        </div>
      </div>
    </div>
    <script>
        function addAlumnos() {
            var valueMatriculaInicio = document.getElementById('matriculaInicio').value
            var valueMatriculaFinal = document.getElementById('matriculaFinal').value
            $.post("${createLink(controller:'grupo', action: 'addAlumnos')}",
            {matriculaInicio:valueMatriculaInicio,
            matriculaFinal:valueMatriculaFinal,
            id:"${grupo.id}"},
            function(data, status){
                var tbody = document.getElementById('tableAlumnos')
                console.log(data)
                jQuery.each(data, function() {
                    console.log(this)
                    console.log(this.id)

                    var tr = document.createElement('tr');
                    var td = document.createElement('td');
                    var td1 = document.createElement('td');
                    var td2 = document.createElement('td');
                    var td3 = document.createElement('td');
                    var td4 = document.createElement('td');
                    var linkEliminar = document.createElement('a')
                    var linkModificar = document.createElement('a')

                    linkEliminar.href = '${request.contextPath}/grupo/deleteAlumno/' + this.idNumero
                    linkModificar.href = '${request.contextPath}/grupo/updateAlumno/' + this.idNumero
                    linkEliminar.innerHTML = 'Eliminar'
                    linkModificar.innerHTML = 'Actualizar'

                    td.innerHTML = this.numeroLista
                    td1.innerHTML = this.apPaterno + " " + this.apMaterno + " " + this.nombre
                    td2.innerHTML = this.matricula
                    td3.appendChild(linkEliminar)
                    td4.appendChild(linkModificar)

                    tr.appendChild(td);
                    tr.appendChild(td1);
                    tr.appendChild(td2);
                    tr.appendChild(td3);
                    tr.appendChild(td4);

                    tbody.appendChild(tr);
                });
            });
        };
    </script>

    <g:if test="${this.grupo}">
      <div class="box box-danger">
        <g:eachError bean="${this.grupo}" var="error">
          <li class="d-block mx-auto text-center">
            <g:if test="${error in org.springframework.validation.FieldError}">
              "${error.field}"
            </g:if><g:message error="${error}"/>
          </li>
          <script type="text/javascript">
  		      var field = document.getElementById('${error.getField()}')
  		      field.classList.add('border-danger')
		      </script>
        </g:eachError>
      </div>
    </g:if>
  </body>
</html>
