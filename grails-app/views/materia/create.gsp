<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="admin">
    <title>Crear materia</title>
  </head>
  <body>
    <div class="container py-4">
      <div class="row">
        <div class="col h3">
          Cree una nueva materia
        </div>
      </div>
      <div class="row">
          <div class="col-md-12">
            <g:form name="name" action="create">
            <div class="form-group">
              <label for="clave">Clave</label>
              <input type="text" name="clave" class="form-control" value="${materia?.clave}">
            </div>
            <div class="form-group">
              <label for="nombre">Nombre</label>
              <input type="text" name="nombre" value="${materia?.nombre}" class="form-control">
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
            <div class="form-group">
              <label for="carrera">Carrera</label>
              <input type="text" name="carrera" value="${materia?.carrera}" class="form-control">
            </div>
            <div class="form-group">
              <input type="submit" name="" value="Crear" class="btn btn-outline-dark">
            </div>
          </g:form>
        </div>
      </div>
    </div>
    <g:if test="${this.materia}">
      <div class="box box-danger">
        <g:eachError bean="${this.materia}" var="error">
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
