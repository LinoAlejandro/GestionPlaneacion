package com.planeacion
import grails.plugin.springsecurity.annotation.Secured
import grails.converters.*

class GrupoController {

    @Secured('ROLE_ADMIN')
    def index() {
        if(!params.max) {
            params.mas = 10
        }
        [grupos:Grupo.list(params), gruposCount:Grupo.count()]
    }

    @Secured('ROLE_ADMIN')
    def create(Grupo grupo) {
        if(request.method == "POST") {
            if(grupo.save()) {
                redirect action:'index'
            }
        }
        [grupo:grupo]
    }

    @Secured('ROLE_ADMIN')
    def update(Grupo grupo) {
        params.offset = params.offset
        if(request.method == "POST") {
            grupo.properties = params
            if(grupo.save()) {
                redirect action:'index', params:[offset:params.offset]
            }
        }
        [grupo:grupo]
    }

    @Secured('ROLE_ADMIN')
    def delete(Grupo grupo) {
        params.offset = params.offset
        grupo.delete(flush:true)
        redirect action:'index', params:[offset:params.offset]
    }

    @Secured('ROLE_ADMIN')
    def addAlumnos() {
        def inicio = Integer.parseInt(params.matriculaInicio)
        def ultimo = Integer.parseInt(params.matriculaFinal)
        def grupo = Grupo.get(params.id)
        def c = Persona.createCriteria()
        def results = c.list {
            eq("isAlumno", true)
            and {
                between("matricula", inicio, ultimo)
            }
            order('apPaterno','asc')
        }
        def cont = 1
        def generalMap = []
        results.each {
            def grupoHasPersona = new GrupoHasPersona(numeroLista:cont, persona:it.id, grupo:grupo)
            grupoHasPersona.save(flush:true)
            def mapa = [nombre:it.nombre, apPaterno:it.apPaterno, apMaterno:it.apMaterno,
              matricula:it.matricula, numeroLista:grupoHasPersona.numeroLista, idNumero:grupoHasPersona.id]
            generalMap.add(mapa)
            cont++
        }
        render generalMap as JSON
    }

    @Secured('ROLE_ADMIN')
    def updateAlumno(GrupoHasPersona persona) {
        params.offset = params.offset
        params.grupo = persona.grupo
        persona.properties = params
        if(request.method == "POST") {
            if(persona.save(flush:true)) {
                redirect action:'update',  params:[id:persona.grupo.id]
            }
        }
        [persona:persona]
    }

    @Secured('ROLE_ADMIN')
    def deleteAlumno(GrupoHasPersona persona) {
        def grupo = persona.grupo.id
        persona.delete(flush:true)
        redirect action:'update',  params:[id:grupo]
    }
}
