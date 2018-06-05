<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="admin">
    <title>Actualizar Administrador</title>
  </head>
  <body>
    <div class="container py-4">
      <div class="row">
        <div class="col h3">
          Actualice el administrador
        </div>
      </div>
      <div class="row">
          <div class="col-md-12">
            <g:form name="name" action="update">
            <input type="hidden" name="id" value="${user.id}">
            <div class="form-group">
              <label for="username">Username</label>
              <input type="text" name="username" class="form-control" value="${user?.username}">
            </div>
            <div class="form-group">
              <label for="password">Password</label>
              <input type="password" name="password" value="" class="form-control">
            </div>
            <div class="form-group">
              <input type="submit" name="" value="Actualizar" class="btn btn-outline-dark">
            </div>
          </g:form>
        </div>
      </div>
    </div>
    <g:if test="${this.user}">
      <div class="box box-danger">
        <g:eachError bean="${this.user}" var="error">
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
