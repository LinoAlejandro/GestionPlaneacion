<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="profesor">
    <title>Crear nueva catedra</title>
  </head>
  <body>
    <div class="container my-4">
      <div class="row">
        <div class="col display-4 mb-5">
          Cree una nueva catedra
        </div>
      </div>
      <g:form name="name" action="create" method="POST">
        <div class="row">
          <div class="col">
            <div class="form-group">
              <label for="identificador">Nombre de la catedra</label>
              <input type="text" name="identificador" value="${catedra?.identificador}" class="form-control">
            </div>
            <div class="form-group">
              <label for="materia">Clave de la materia</label>
              <select name="clave" id="selectClaveMateria" class="form-control">

              </select>
            </div>
            <div class="form-group">
              <label for="materia">Carrera</label>
              <select name="carrera" id="selectCarrera" class="form-control">
                <g:each in="${materias}">
                  <option value="${it}">
                      ${it}
                  </option>
                </g:each>
              </select>
            </div>
            <div class="form-group">
              <label for="materia">Semestre</label>
              <select name="semestre" id="selectSemestre" class="form-control">
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
            <div class="form-group">
              <input type="submit" name="" value="Crear" class="btn btn-outline-dark">
            </div>
          </div>
        </div>
      </g:form>
    </div>
    <script type="text/javascript">
        var selectCarrera = document.getElementById('selectCarrera')
        var selectSemestre = document.getElementById('selectSemestre')
        var selectClaveMateria = document.getElementById('selectClaveMateria')

        function getClaves() {
            $.post('${createLink(action:"returnClavesMateria", controller:"catedra")}',
            {semestre:selectSemestre.value,
            carrera:selectCarrera.value},
            function(data, status) {
                selectClaveMateria.innerHTML = ''
                for (info in data) {
                    var option = document.createElement('option')
                    option.innerHTML = data[info].clave + " - " +  data[info].nombre
                    option.value = data[info].clave
                    selectClaveMateria.appendChild(option)
                }
            })
        }

        selectCarrera.addEventListener('click', getClaves)
        selectSemestre.addEventListener('click', getClaves)
        $(document).ready(getClaves)
    </script>
    <g:if test="${this.catedra}">
      <div class="box box-danger">
        <g:eachError bean="${this.catedra}" var="error">
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
