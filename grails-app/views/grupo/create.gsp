<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="admin">
    <title>Creación de grupos</title>
  </head>
  <body>
    <div class="container my-5">
      <div class="row">
        <div class="col">
          <div class="display-4 mb-5">
            Cree un nuevo grupo
          </div>
        </div>
      </div>
      <g:form name="name" action="create">
        <div class="row">
          <div class="col-md-10">
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
              <input type="submit" name="" value="Crear"  class="btn btn-md btn-outline-dark">
            </div>
          </div>
        </div>
      </g:form>
    </div>
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
