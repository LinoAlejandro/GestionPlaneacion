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
      <g:form name="name" action="update">
      <input type="hidden" name="id" value="${persona.id}">
        <div class="row">
          <div class="col-md-6">
            <div class="form-group">
              <label for="username">Username</label>
              <input type="text" name="username" class="form-control" value="${persona?.username}">
            </div>
            <div class="form-group">
              <label for="password">Password</label>
              <input type="password" name="password" value="" class="form-control">
            </div>
            <div class="form-group">
              <label for="email">Email</label>
              <input type="email" name="email" value="${persona?.email}" class="form-control">
            </div>
            <div class="form-group">
              <label for="nombre">Nombre</label>
              <input type="text" name="nombre" value="${persona?.nombre}" class="form-control">
            </div>
          </div>
          <div class="col-md-6">
            <div class="form-group">
              <label for="apPaterno">Apellido Paterno</label>
              <input type="text" name="apPaterno" value="${persona?.apPaterno}" class="form-control">
            </div>
            <div class="form-group">
              <label for="apMaterno">Apellido Materno</label>
              <input type="text" name="apMaterno" value="${persona?.apMaterno}" class="form-control">
            </div>
            <div class="form-group">
              <label for="matricula">Matrícula</label>
              <input type="number" name="matricula" value="${persona?.matricula}" class="form-control">
            </div>
            <div class="form-group pt-3">
              <input type="submit" name="" value="Actualizar"  class="btn btn-md btn-outline-dark">
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

  </body>
</html>
