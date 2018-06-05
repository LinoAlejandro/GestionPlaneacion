<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="profesor">
    <title>Crear nueva catedra</title>
    <asset:stylesheet href="froala/froala_editor.pkgd.min.css" />
    <asset:stylesheet href="froala/froala_style.min.css" />
  </head>
  <body>
    <div class="container my-4">
      <div class="row">
        <div class="col display-4 mb-5">
          Actualice su catedra
        </div>
      </div>
      <div class="row">
        <div class="col">
          <g:form name="name" action="update" method="POST">
            <input type="hidden" name="id" value="${catedra?.id}">
          <div class="form-group">
            <label for="identificador">Identificador</label>
            <input type="text" name="identificador" value="${catedra?.identificador}" class="form-control">
          </div>
          <div class="form-group">
            <label for="folioRegistro">Folio registro</label>
            <input type="text" name="folioRegistro" value="${catedra?.folioRegistro}" class="form-control">
          </div>
          <div class="form-group">
            <label for="materia">Clave de la materia</label>
            <input type="text" name="clave" value="${catedra.materia.clave}" class="form-control">
          </div>
          <div class="form-group">
            <input type="submit" name="" value="Actualizar" class="btn btn-outline-dark">
          </div>
        </g:form>
        </div>
      </div>
      <div class="row mt-1 mb-4">
        <div class="col-md-6">
          <div class="container">
            <div class="row">
              <div class="col h2">
                Políticas
              </div>
            </div>
            <div class="row">
              <div class="col">
                <textarea name="politicas" class="form-control" style="height:400px" id="politica">
                  ${catedra?.politicaNormas?.politica}
                </textarea>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-6">
          <div class="container">
            <div class="row">
              <div class="col h2">
                Normas
              </div>
            </div>
            <div class="row">
              <div class="col">
                <textarea name="politicas" class="form-control" style="height:400px" id="norma">
                  ${catedra?.politicaNormas?.norma}
                </textarea>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-12">
          <button type="button" name="button" onclick="addNormas()" class="btn btn-outline-dark">
            Actualizar Normas y políticas
          </button>
        </div>
      </div>
      <script type="text/javascript">
          var norma = document.getElementById('norma')
          var politica = document.getElementById('politica')
          function addNormas() {
              console.log(norma.value)
              console.log(politica.value)
              $.post('${createLink(action:"addAdicional", controller:"catedra")}',
              {idCatedra:'${catedra.id}',
              norma: norma.value,
              politica: politica.value},
              function(data, status) {
                  console.log(data, status)
              })
          }
      </script>
    </div>

    <div class="container">
      <div class="row">
        <div class="col">
          <div class="h4">
            Grupo
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col">
          <table class="table">
            <thead>
              <tr>
                <td>Clave</td>
                <td></td>
              </tr>
            </thead>
            <tbody id="tableGrupos">
              <g:each in="${catedra.grupos}">
                <tr>
                  <td>${it.clave}</td>
                  <td>
                    <g:link action="removeGrupo" params="[id:it.id, idCatedra:catedra.id]" >Eliminar</g:link>
                  </td>
                </tr>
              </g:each>
            </tbody>
          </table>
        </div>
      </div>
      <div class="row mb-4">
        <div class="col">
          <div class="h4">
            Lista de grupos
          </div>
          <div class="">
            <select id="gruposInput" name="grupos" multiple class="form-control">
              <g:each in="${grupos}">
                <option value="${it.clave}">${it.clave}</option>
              </g:each>
            </select>
          </div>
          <div class="mt-2">
            <button class="btn btn-outline-dark" type="button" name="button" onclick="agregarGrupos()">Agregar grupos</button>
          </div>
        </div>
      </div>
    </div>

    <div class="container mt-2">
      <div class="row">
        <div class="col">
          <hr class="bg-dark">
        </div>
      </div>
      <div class="row">
        <div class="col">
          <div class="h4">
            Secciones
          </div>
        </div>
      </div>
      <div class="row justify-content-center">
        <div class="col text-center">
          <div class="btn-group mx-auto" role="group" aria-label="Basic example">
            <button type="button" name="button" class="btn btn-outline-dark btn-md" onclick="showPrimero()" >Primer Parcial</button>
            <button type="button" name="button" class="btn btn-outline-dark btn-md" onclick="showSegundo()" >Segundo Parcial</button>
            <button type="button" name="button" class="btn btn-outline-dark btn-md" onclick="showTercero()" >Tercer Parcial</button>
            <button type="button" name="button" class="btn btn-outline-dark btn-md" onclick="showOrdinario()">Ordinario</button>
          </div>
        </div>
      </div>
    </div>

    <div class="container" style="">
      <div class="row mb-4" id="primero">
        <div class="col-md-12 h2">
          Parcial Uno
        </div>
        <div class="col-md-12">
            <div class="container-fluid">
              <div class="row">
                <div class="col">
                  <hr>
                </div>
              </div>
              <div class="row">
                <div class="col">
                  <div class="h4">
                    Actividades
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col">
                  <table class="table">
                    <thead>
                      <tr>
                        <td>Tipo</td>
                        <td>Descripción</td>
                        <td>Fecha Limite</td>
                        <td></td>
                      </tr>
                    </thead>
                    <tbody id="tableActividadesPrimero">
                      <g:each in="${parcialUno?.actividad}">
                        <tr>
                          <td>${it.tipo}</td>
                          <td>${it.descripcion}</td>
                          <td>${it.fLimite.format('yyyy-MM-dd')}</td>
                          <td>
                            <g:link action="deleteActividad" params="[id:it.id]">Eliminar</g:link>
                          </td>
                        </tr>
                      </g:each>
                    </tbody>
                  </table>
                </div>
              </div>
              <div class="row">
                <div class="col">
                  <div class="container p-4 border border-dark rounded">
                    <div class="row">
                      <div class="col h4">
                        Crear Actividad
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-4">
                        <div class="mb-2">
                          Tipo
                        </div>
                        <div class="mb-2">
                          Descripción
                        </div>
                        <div class="mb-2">
                          Fecha límite de entrega
                        </div>
                      </div>
                      <div class="col-md-6">
                        <input type="text" id="tipoPrimero" name="" value="" class="mb-2 d-block w-100 rounded border border-dark">
                        <input type="text" id="descripcionPrimero" name="" value="" class="mb-2 d-block w-100 rounded border border-dark">
                        <input type="date" id="flimitePrimero" name="" value="" class="mb-2 d-block w-100 rounded border border-dark">
                      </div>
                      <div class="col-md-2">
                      </div>
                    </div>
                    <div class="row">
                      <div class="col">
                        <button type="button" name="button" onclick="crearActividad('Primero')" class="btn btn-outline-dark">Crear</button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
        </div>
        <div class="col-md-12">
          <div class="container-fluid">
            <div class="row">
              <div class="col">
                <hr>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <div class="h4">
                  Temas
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <table class="table">
                  <thead>
                    <tr>
                      <td>fecha</td>
                      <td>Descripción</td>
                      <td></td>
                    </tr>
                  </thead>
                  <tbody id="tableTemasPrimero">
                    <g:each in="${parcialUno?.temas}">
                      <tr>
                        <td>${it.fecha.format('yyyy-MM-dd')}</td>
                        <td>${it.descripcion}</td>
                        <td>
                          <g:link action="deleteTemas" params="[id:it.id]">Eliminar</g:link>
                        </td>
                      </tr>
                    </g:each>
                  </tbody>
                </table>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <div class="container p-4 border border-dark rounded">
                  <div class="row">
                    <div class="col h4">
                      Crear Tema
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-4">
                      <div class="mb-2">
                        Fecha
                      </div>
                      <div class="mb-2">
                        Descripción
                      </div>
                    </div>
                    <div class="col-md-6">
                      <input type="date" id="fechaTemaPrimero" name="" value="" class="mb-2 d-block w-100 rounded border border-dark">
                      <input type="text" id="descripcionTemaPrimero" name="" value="" class="mb-2 d-block w-100 rounded border border-dark">
                    </div>
                    <div class="col-md-2">
                    </div>
                  </div>
                  <div class="row">
                    <div class="col">
                      <button type="button" name="button" onclick="crearTema('Primero')" class="btn btn-outline-dark">Crear</button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-12">
          <div class="container-fluid">
            <div class="row">
              <div class="col">
                <hr>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <div class="h4">
                  Puntajes
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <table class="table">
                  <thead>
                    <tr>
                      <td>valor</td>
                      <td>Descripción</td>
                      <td></td>
                    </tr>
                  </thead>
                  <tbody id="tablePuntajesPrimero">
                    <g:each in="${parcialUno?.puntajes}">
                      <tr>
                        <td>${it.valor}%</td>
                        <td>${it.descripcion}</td>
                        <td>
                          <g:link action="deletePuntajes" params="[id:it.id]">Eliminar</g:link>
                        </td>
                      </tr>
                    </g:each>
                  </tbody>
                </table>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <div class="container p-4 border border-dark rounded">
                  <div class="row">
                    <div class="col h4">
                      Crear Puntaje
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-4">
                      <div class="mb-2">
                        Valor
                      </div>
                      <div class="mb-2">
                        Descripción
                      </div>
                    </div>
                    <div class="col-md-6">
                      <input type="number" id="valorPuntajePrimero" name="" value="" class="mb-2 d-block w-100 rounded border border-dark">
                      <input type="text" id="descripcionPuntajePrimero" name="" value="" class="mb-2 d-block w-100 rounded border border-dark">
                    </div>
                    <div class="col-md-2">
                    </div>
                  </div>
                  <div class="row">
                    <div class="col">
                      <button type="button" name="button" onclick="crearPuntaje('Primero')" class="btn btn-outline-dark">Crear</button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="row my-4" id="segundo">
        <div class="col-md-12 h2">
          Parcial Dos
        </div>
        <div class="col-md-12">
            <div class="container-fluid">
              <div class="row">
                <div class="col">
                  <hr>
                </div>
              </div>
              <div class="row">
                <div class="col">
                  <div class="h4">
                    Actividades
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col">
                  <table class="table">
                    <thead>
                      <tr>
                        <td>Tipo</td>
                        <td>Descripción</td>
                        <td>Fecha Limite</td>
                        <td></td>
                      </tr>
                    </thead>
                    <tbody id="tableActividadesSegundo">
                      <g:each in="${parcialDos?.actividad}">
                        <tr>
                          <td>${it.tipo}</td>
                          <td>${it.descripcion}</td>
                          <td>${it.fLimite.format('yyyy-MM-dd')}</td>
                          <td>
                            <g:link action="deleteActividad" params="[id:it.id]">Eliminar</g:link>
                          </td>
                        </tr>
                      </g:each>
                    </tbody>
                  </table>
                </div>
              </div>
              <div class="row">
                <div class="col">
                  <div class="container p-4 border border-dark rounded">
                    <div class="row">
                      <div class="col h4">
                        Crear Actividad
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-4">
                        <div class="mb-2">
                          Tipo
                        </div>
                        <div class="mb-2">
                          Descripción
                        </div>
                        <div class="mb-2">
                          Fecha límite de entrega
                        </div>
                      </div>
                      <div class="col-md-6">
                        <input type="text" id="tipoSegundo" name="" value="" class="mb-2 d-block w-100 rounded border border-dark">
                        <input type="text" id="descripcionSegundo" name="" value="" class="mb-2 d-block w-100 rounded border border-dark">
                        <input type="date" id="flimiteSegundo" name="" value="" class="mb-2 d-block w-100 rounded border border-dark">
                      </div>
                      <div class="col-md-2">
                      </div>
                    </div>
                    <div class="row">
                      <div class="col">
                        <button type="button" name="button" onclick="crearActividad('Segundo')" class="btn btn-outline-dark">Crear</button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
        </div>
        <div class="col-md-12">
          <div class="container-fluid">
            <div class="row">
              <div class="col">
                <hr>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <div class="h4">
                  Temas
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <table class="table">
                  <thead>
                    <tr>
                      <td>fecha</td>
                      <td>Descripción</td>
                      <td></td>
                    </tr>
                  </thead>
                  <tbody id="tableTemasSegundo">
                    <g:each in="${parcialDos?.temas}">
                      <tr>
                        <td>${it.fecha.format('yyyy-MM-dd')}</td>
                        <td>${it.descripcion}</td>
                        <td>
                          <g:link action="deleteTemas" params="[id:it.id]">Eliminar</g:link>
                        </td>
                      </tr>
                    </g:each>
                  </tbody>
                </table>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <div class="container p-4 border border-dark rounded">
                  <div class="row">
                    <div class="col h4">
                      Crear Tema
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-4">
                      <div class="mb-2">
                        Fecha
                      </div>
                      <div class="mb-2">
                        Descripción
                      </div>
                    </div>
                    <div class="col-md-6">
                      <input type="date" id="fechaTemaSegundo" name="" value="" class="mb-2 d-block w-100 rounded border border-dark">
                      <input type="text" id="descripcionTemaSegundo" name="" value="" class="mb-2 d-block w-100 rounded border border-dark">
                    </div>
                    <div class="col-md-2">
                    </div>
                  </div>
                  <div class="row">
                    <div class="col">
                      <button type="button" name="button" onclick="crearTema('Segundo')" class="btn btn-outline-dark">Crear</button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-12">
          <div class="container-fluid">
            <div class="row">
              <div class="col">
                <hr>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <div class="h4">
                  Puntajes
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <table class="table">
                  <thead>
                    <tr>
                      <td>valor</td>
                      <td>Descripción</td>
                      <td></td>
                    </tr>
                  </thead>
                  <tbody id="tablePuntajesSegundo">
                    <g:each in="${parcialDos?.puntajes}">
                      <tr>
                        <td>${it.valor}%</td>
                        <td>${it.descripcion}</td>
                        <td>
                          <g:link action="deletePuntajes" params="[id:it.id]">Eliminar</g:link>
                        </td>
                      </tr>
                    </g:each>
                  </tbody>
                </table>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <div class="container p-4 border border-dark rounded">
                  <div class="row">
                    <div class="col h4">
                      Crear Puntaje
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-4">
                      <div class="mb-2">
                        Valor
                      </div>
                      <div class="mb-2">
                        Descripción
                      </div>
                    </div>
                    <div class="col-md-6">
                      <input type="number" id="valorPuntajeSegundo" name="" value="" class="mb-2 d-block w-100 rounded border border-dark">
                      <input type="text" id="descripcionPuntajeSegundo" name="" value="" class="mb-2 d-block w-100 rounded border border-dark">
                    </div>
                    <div class="col-md-2">
                    </div>
                  </div>
                  <div class="row">
                    <div class="col">
                      <button type="button" name="button" onclick="crearPuntaje('Segundo')" class="btn btn-outline-dark">Crear</button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="row my-4" id="tercero">
        <div class="col-md-12 h2">
          Parcial Tres
        </div>
        <div class="col-md-12">
            <div class="container-fluid">
              <div class="row">
                <div class="col">
                  <hr>
                </div>
              </div>
              <div class="row">
                <div class="col">
                  <div class="h4">
                    Actividades
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col">
                  <table class="table">
                    <thead>
                      <tr>
                        <td>Tipo</td>
                        <td>Descripción</td>
                        <td>Fecha Limite</td>
                        <td></td>
                      </tr>
                    </thead>
                    <tbody id="tableActividadesTercero">
                      <g:each in="${parcialTres?.actividad}">
                        <tr>
                          <td>${it.tipo}</td>
                          <td>${it.descripcion}</td>
                          <td>${it.fLimite.format('yyyy-MM-dd')}</td>
                          <td>
                            <g:link action="deleteActividad" params="[id:it.id]">Eliminar</g:link>
                          </td>
                        </tr>
                      </g:each>
                    </tbody>
                  </table>
                </div>
              </div>
              <div class="row">
                <div class="col">
                  <div class="container p-4 border border-dark rounded">
                    <div class="row">
                      <div class="col h4">
                        Crear Actividad
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-4">
                        <div class="mb-2">
                          Tipo
                        </div>
                        <div class="mb-2">
                          Descripción
                        </div>
                        <div class="mb-2">
                          Fecha límite de entrega
                        </div>
                      </div>
                      <div class="col-md-6">
                        <input type="text" id="tipoTercero" name="" value="" class="mb-2 d-block w-100 rounded border border-dark">
                        <input type="text" id="descripcionTercero" name="" value="" class="mb-2 d-block w-100 rounded border border-dark">
                        <input type="date" id="flimiteTercero" name="" value="" class="mb-2 d-block w-100 rounded border border-dark">
                      </div>
                      <div class="col-md-2">
                      </div>
                    </div>
                    <div class="row">
                      <div class="col">
                        <button type="button" name="button" onclick="crearActividad('Tercero')" class="btn btn-outline-dark">Crear</button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
        </div>
        <div class="col-md-12">
          <div class="container-fluid">
            <div class="row">
              <div class="col">
                <hr>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <div class="h4">
                  Temas
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <table class="table">
                  <thead>
                    <tr>
                      <td>fecha</td>
                      <td>Descripción</td>
                      <td></td>
                    </tr>
                  </thead>
                  <tbody id="tableTemasTercero">
                    <g:each in="${parcialTres?.temas}">
                      <tr>
                        <td>${it.fecha.format('yyyy-MM-dd')}</td>
                        <td>${it.descripcion}</td>
                        <td>
                          <g:link action="deleteTemas" params="[id:it.id]">Eliminar</g:link>
                        </td>
                      </tr>
                    </g:each>
                  </tbody>
                </table>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <div class="container p-4 border border-dark rounded">
                  <div class="row">
                    <div class="col h4">
                      Crear Tema
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-4">
                      <div class="mb-2">
                        Fecha
                      </div>
                      <div class="mb-2">
                        Descripción
                      </div>
                    </div>
                    <div class="col-md-6">
                      <input type="date" id="fechaTemaTercero" name="" value="" class="mb-2 d-block w-100 rounded border border-dark">
                      <input type="text" id="descripcionTemaTercero" name="" value="" class="mb-2 d-block w-100 rounded border border-dark">
                    </div>
                    <div class="col-md-2">
                    </div>
                  </div>
                  <div class="row">
                    <div class="col">
                      <button type="button" name="button" onclick="crearTema('Tercero')" class="btn btn-outline-dark">Crear</button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-12">
          <div class="container-fluid">
            <div class="row">
              <div class="col">
                <hr>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <div class="h4">
                  Puntajes
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <table class="table">
                  <thead>
                    <tr>
                      <td>valor</td>
                      <td>Descripción</td>
                      <td></td>
                    </tr>
                  </thead>
                  <tbody id="tablePuntajesTercero">
                    <g:each in="${parcialTres?.puntajes}">
                      <tr>
                        <td>${it.valor}%</td>
                        <td>${it.descripcion}</td>
                        <td>
                          <g:link action="deletePuntajes" params="[id:it.id]">Eliminar</g:link>
                        </td>
                      </tr>
                    </g:each>
                  </tbody>
                </table>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <div class="container p-4 border border-dark rounded">
                  <div class="row">
                    <div class="col h4">
                      Crear Puntaje
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-4">
                      <div class="mb-2">
                        Valor
                      </div>
                      <div class="mb-2">
                        Descripción
                      </div>
                    </div>
                    <div class="col-md-6">
                      <input type="number" id="valorPuntajeTercero" name="" value="" class="mb-2 d-block w-100 rounded border border-dark">
                      <input type="text" id="descripcionPuntajeTercero" name="" value="" class="mb-2 d-block w-100 rounded border border-dark">
                    </div>
                    <div class="col-md-2">
                    </div>
                  </div>
                  <div class="row">
                    <div class="col">
                      <button type="button" name="button" onclick="crearPuntaje('Tercero')" class="btn btn-outline-dark">Crear</button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="row my-4" id="ordinario">
        <div class="col-md-12 h2">
          Ordinario
        </div>
        <div class="col-md-12">
            <div class="container-fluid">
              <div class="row">
                <div class="col">
                  <hr>
                </div>
              </div>
              <div class="row">
                <div class="col">
                  <div class="h4">
                    Actividades
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col">
                  <table class="table">
                    <thead>
                      <tr>
                        <td>Tipo</td>
                        <td>Descripción</td>
                        <td>Fecha Limite</td>
                        <td></td>
                      </tr>
                    </thead>
                    <tbody id="tableActividadesOrdinario">
                      <g:each in="${ordinario?.actividad}">
                        <tr>
                          <td>${it.tipo}</td>
                          <td>${it.descripcion}</td>
                          <td>${it.fLimite.format('yyyy-MM-dd')}</td>
                          <td>
                            <g:link action="deleteActividad" params="[id:it.id]">Eliminar</g:link>
                          </td>
                        </tr>
                      </g:each>
                    </tbody>
                  </table>
                </div>
              </div>
              <div class="row">
                <div class="col">
                  <div class="container p-4 border border-dark rounded">
                    <div class="row">
                      <div class="col h4">
                        Crear Actividad
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-4">
                        <div class="mb-2">
                          Tipo
                        </div>
                        <div class="mb-2">
                          Descripción
                        </div>
                        <div class="mb-2">
                          Fecha límite de entrega
                        </div>
                      </div>
                      <div class="col-md-6">
                        <input type="text" id="tipoOrdinario" name="" value="" class="mb-2 d-block w-100 rounded border border-dark">
                        <input type="text" id="descripcionOrdinario" name="" value="" class="mb-2 d-block w-100 rounded border border-dark">
                        <input type="date" id="flimiteOrdinario" name="" value="" class="mb-2 d-block w-100 rounded border border-dark">
                      </div>
                      <div class="col-md-2">
                      </div>
                    </div>
                    <div class="row">
                      <div class="col">
                        <button type="button" name="button" onclick="crearActividad('Ordinario')" class="btn btn-outline-dark">Crear</button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
        </div>
        <div class="col-md-12">
          <div class="container-fluid">
            <div class="row">
              <div class="col">
                <hr>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <div class="h4">
                  Temas
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <table class="table">
                  <thead>
                    <tr>
                      <td>fecha</td>
                      <td>Descripción</td>
                      <td></td>
                    </tr>
                  </thead>
                  <tbody id="tableTemasOrdinario">
                    <g:each in="${ordinario?.temas}">
                      <tr>
                        <td>${it.fecha.format('yyyy-MM-dd')}</td>
                        <td>${it.descripcion}</td>
                        <td>
                          <g:link action="deleteTemas" params="[id:it.id]">Eliminar</g:link>
                        </td>
                      </tr>
                    </g:each>
                  </tbody>
                </table>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <div class="container p-4 border border-dark rounded">
                  <div class="row">
                    <div class="col h4">
                      Crear Tema
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-4">
                      <div class="mb-2">
                        Fecha
                      </div>
                      <div class="mb-2">
                        Descripción
                      </div>
                    </div>
                    <div class="col-md-6">
                      <input type="date" id="fechaTemaOrdinario" name="" value="" class="mb-2 d-block w-100 rounded border border-dark">
                      <input type="text" id="descripcionTemaOrdinario" name="" value="" class="mb-2 d-block w-100 rounded border border-dark">
                    </div>
                    <div class="col-md-2">
                    </div>
                  </div>
                  <div class="row">
                    <div class="col">
                      <button type="button" name="button" onclick="crearTema('Ordinario')" class="btn btn-outline-dark">Crear</button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-12">
          <div class="container-fluid">
            <div class="row">
              <div class="col">
                <hr>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <div class="h4">
                  Puntajes
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <table class="table">
                  <thead>
                    <tr>
                      <td>valor</td>
                      <td>Descripción</td>
                      <td></td>
                    </tr>
                  </thead>
                  <tbody id="tablePuntajesOrdinario">
                    <g:each in="${ordinario?.puntajes}">
                      <tr>
                        <td>${it.valor}%</td>
                        <td>${it.descripcion}</td>
                        <td>
                          <g:link action="deletePuntajes" params="[id:it.id]">Eliminar</g:link>
                        </td>
                      </tr>
                    </g:each>
                  </tbody>
                </table>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <div class="container p-4 border border-dark rounded">
                  <div class="row">
                    <div class="col h4">
                      Crear Puntaje
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-4">
                      <div class="mb-2">
                        Valor
                      </div>
                      <div class="mb-2">
                        Descripción
                      </div>
                    </div>
                    <div class="col-md-6">
                      <input type="number" id="valorPuntajeOrdinario" name="" value="" class="mb-2 d-block w-100 rounded border border-dark">
                      <input type="text" id="descripcionPuntajeOrdinario" name="" value="" class="mb-2 d-block w-100 rounded border border-dark">
                    </div>
                    <div class="col-md-2">
                    </div>
                  </div>
                  <div class="row">
                    <div class="col">
                      <button type="button" name="button" onclick="crearPuntaje('Ordinario')" class="btn btn-outline-dark">Crear</button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <script type="text/javascript">
        var primero = document.getElementById('primero')
        var segundo = document.getElementById('segundo')
        var tercero = document.getElementById('tercero')
        var ordinario = document.getElementById('ordinario')

        $(document).ready(function() {
            segundo.style.display = 'none'
            tercero.style.display = 'none'
            ordinario.style.display = 'none'
        })

        function showPrimero() {
          $("#primero").show(1000)
          $("#segundo").hide(1000)
          $("#tercero").hide(1000)
          $("#ordinario").hide(1000)
        }

        function showSegundo() {
          $("#primero").hide(1000)
          $("#segundo").show(1000)
          $("#tercero").hide(1000)
          $("#ordinario").hide(1000)
        }

        function showTercero() {
          $("#primero").hide(1000)
          $("#segundo").hide(1000)
          $("#tercero").show(1000)
          $("#ordinario").hide(1000)
        }

        function showOrdinario() {
          $("#primero").hide(1000)
          $("#segundo").hide(1000)
          $("#tercero").hide(1000)
          $("#ordinario").show(1000)
        }
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
    <asset:javascript src="froala/froala_editor.pkgd.min.js" />
    <script type="text/javascript">
        $(function() { $('textarea').froalaEditor() });
    </script>
    <script type="text/javascript">
      function crearActividad(descripcionParcial) {
          var tipo = document.getElementById('tipo' + descripcionParcial)
          var descripcion = document.getElementById('descripcion' + descripcionParcial)
          var flimite = document.getElementById('flimite' + descripcionParcial)
          var flimiteCorrecion = flimite.value + ' 00:00:00.0'
          var tableActividades = document.getElementById('tableActividades' + descripcionParcial)

          $.post("${createLink(controller:'catedra', action:'addActividad')}",
          {tipo:tipo.value,
          descripcion:descripcion.value,
          fLimite:flimiteCorrecion,
          descripcionParcial:descripcionParcial},
          function(data, status){
              console.log(data)
              console.log(status)
              if(status == 'success') {
                  var tr = document.createElement('tr')

                  var td1 = document.createElement('td')
                  var td2 = document.createElement('td')
                  var td3 = document.createElement('td')
                  var td4 = document.createElement('td')
                  var a = document.createElement('a')

                  a.innerHTML = 'Eliminar'
                  a.href = '${createLink(controller:"catedra", action:"deleteActividad")}/' + data.id

                  td1.innerHTML = data.tipo
                  td2.innerHTML = data.descripcion
                  td3.innerHTML = data.fLimite.substring(0,10)
                  td4.appendChild(a)

                  tr.appendChild(td1)
                  tr.appendChild(td2)
                  tr.appendChild(td3)
                  tr.appendChild(td4)
                  tableActividades.appendChild(tr)
              }
          })
      }

      function crearTema(descripcionParcial) {
          var fechaTema = document.getElementById('fechaTema' + descripcionParcial)
          var descripcionTema = document.getElementById('descripcionTema' + descripcionParcial)
          var flimiteCorrecion = fechaTema.value + ' 00:00:00.0'
          var tableTemas = document.getElementById('tableTemas' + descripcionParcial)

          $.post("${createLink(controller:'catedra', action:'addTemas')}",
          {descripcion:descripcionTema.value,
          fecha:flimiteCorrecion,
          descripcionParcial:descripcionParcial},
          function(data, status){
              console.log(data)
              console.log(status)
              if(status == 'success') {
                  var tr = document.createElement('tr')

                  var td1 = document.createElement('td')
                  var td2 = document.createElement('td')
                  var td3 = document.createElement('td')
                  var a = document.createElement('a')

                  a.innerHTML = 'Eliminar'
                  a.href = '${createLink(controller:"catedra", action:"deleteTemas")}/' + data.id

                  td1.innerHTML = data.fecha.substring(0,10)
                  td2.innerHTML = data.descripcion
                  td3.appendChild(a)

                  tr.appendChild(td1)
                  tr.appendChild(td2)
                  tr.appendChild(td3)

                  tableTemas.appendChild(tr)
              }
          })
      }

      function crearPuntaje(descripcionParcial) {
          var valorPuntaje = document.getElementById('valorPuntaje' + descripcionParcial)
          var descripcionPuntaje = document.getElementById('descripcionPuntaje' + descripcionParcial)
          var tablePuntajes = document.getElementById('tablePuntajes' + descripcionParcial)

          $.post("${createLink(controller:'catedra', action:'addPuntajes')}",
          {valor:valorPuntaje.value,
          descripcion:descripcionPuntaje.value,
          descripcionParcial:descripcionParcial,
          idCatedra:${catedra.id}},
          function(data, status) {
            console.log(data)
            console.log(status)
              if(status == 'success') {
                  var tr = document.createElement('tr')

                  var td1 = document.createElement('td')
                  var td2 = document.createElement('td')
                  var td3 = document.createElement('td')
                  var a = document.createElement('a')

                  a.innerHTML = 'Eliminar'
                  a.href = '${createLink(controller:"catedra", action:"deletePuntajes")}/' + data.id

                  td1.innerHTML = data.valor + '%'
                  td2.innerHTML = data.descripcion
                  td3.appendChild(a)

                  tr.appendChild(td1)
                  tr.appendChild(td2)
                  tr.appendChild(td3)

                  tablePuntajes.appendChild(tr)
              }
          })
      }
    </script>
    <script type="text/javascript">
      function agregarGrupos() {
          var claves = $('#gruposInput').val()
          var tableGrupos = document.getElementById('tableGrupos')
          $.post('${createLink(action:"addGrupos", controller:"catedra")}',
          {claves:claves,
          idCatedra:"${catedra.id}"},
          function(data, status) {
              for(info in data) {
                  console.log(data[info])
                  var tr = document.createElement('tr')

                  var td1 = document.createElement('td')
                  var td2 = document.createElement('td')

                  var a = document.createElement('a')

                  a.innerHTML = 'Eliminar'
                  a.href = "${createLink(action:'removeGrupoAgain', controller:'catedra')}" +
                  '?idGrupo=' + data[info].idGrupo + '&idCatedra=${catedra.id}'

                  td1.innerHTML = data[info].clave
                  td2.appendChild(a)

                  tr.appendChild(td1)
                  tr.appendChild(td2)
                  tableGrupos.appendChild(tr)
              }
          })
      }
    </script>
  </body>
</html>
