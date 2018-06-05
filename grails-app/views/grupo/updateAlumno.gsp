<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="admin">
    <title>Actualizar alumno</title>
  </head>
  <body>
    <div class="container my-5">
      <div class="row">
        <div class="col">
          <div class="display-4 mb-5">
            Actualizar alumno
          </div>
        </div>
      </div>
      <g:form name="name" action="updateAlumno">
      <input type="hidden" name="id" value="${persona.id}">
        <div class="row">
          <div class="col-md-12">
            <div class="form-group">
              <label for="">Alumno</label>
              <input type="text" name="" value="${persona?.persona.nombre}" class="form-control" disabled>
            </div>
            <div class="form-group">
              <label for="numeroLista">Número lista</label>
              <input id="pass" type="number" name="numeroLista" value="${persona?.numeroLista}" class="form-control">
            </div>
            <div class="form-group">
              <input type="submit" name="" value="Actualizar" class="btn btn-outline-dark">
            </div>
          </div>
        </div>
      </g:form>
    </div>

    <g:if test="${this.persona}">
      <div class="box box-danger">
        <g:eachError bean="${this.persona}" var="error">
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

    <script type="text/javascript">

      function generarpass() {
          var inputPass = document.getElementById('pass')
          var randomstring = Math.random().toString(36).slice(-8);
          inputPass.value = randomstring
      }

      function mostrarpass() {
          var inputPass = document.getElementById('pass')
          if(inputPass.type == "password") {
              inputPass.type = "text"
          } else {
              inputPass.type = "password"
          }
      }

    </script>
  </body>
</html>
