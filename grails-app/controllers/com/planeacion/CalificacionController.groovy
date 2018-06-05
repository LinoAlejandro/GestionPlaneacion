package com.planeacion
import grails.plugin.springsecurity.annotation.Secured
import grails.converters.*

@Secured('ROLE_PROFESOR')
class CalificacionController {

    def springSecurityService

    def index() { }

    def calificar(Catedra catedra) {
        def parcial = Parcial.findByCatedraAndDescripcion(catedra, params.parcial)
        def puntajes = parcial.puntajes
        def grupos = catedra.grupos
        def grupoAlumnosArray = []
        grupos.each {
            def alumnos = it.alumnos
            def alumnoPersonaCalificacion = []
            alumnos.each {
                def alumnoPersona = it.persona
                def calificaciones = []
                puntajes.each {
                    def calificacion = Calificacion.findByPuntajeAndAlumno(it, alumnoPersona)
                    calificaciones.add([calificacion:calificacion, puntaje:it])
                }
                def alumnoCalificacion = [alumno:alumnoPersona, calificacionesPuntajes:calificaciones]
                alumnoPersonaCalificacion.add(alumnoCalificacion)
            }
            def mapGrupoAlumnos = [grupo:it, alumnos:alumnoPersonaCalificacion]
            grupoAlumnosArray.add(mapGrupoAlumnos)
        }
        grupoAlumnosArray.each {
            println '\t' + it.grupo
            it.alumnos.each {
                println '\t\t' + it.alumno
                println '\t\t' + it.alumno.nombre
                it.calificacionesPuntajes.each {
                    println '\t\t\t' + it.calificacion
                    println '\t\t\t' + it.puntaje
                }
            }
        }

        [puntajes:puntajes, grupoAlumnosArray:grupoAlumnosArray, catedra:catedra]
    }

    def indexCatedras() {
        def profesor = Persona.findByUser(springSecurityService.currentUser)
        if(!params.max) {
            params.max = 10
        }
        def catedras = Catedra.where {
            profesor.id == profesor.id
        }.list(params)
        [catedras:catedras,catedrasCount:catedras.size()]
    }

    def calificarAlumnos() {
        def catedra = Catedra.get(params.idCatedra)
        def puntajes = Puntaje.findAllByParcial(Parcial.findByCatedraAndDescripcion(catedra, params.semestre))
        def personas = []

        catedra.grupos.each {
            def personasGrupo = []
            it.alumnos.each {
                def alumno = it.persona
                def alumnoCalificaciones = []
                puntajes.each {
                    def calificacion = Calificacion.findByAlumnoAndPuntaje(alumno, it)
                    println calificacion
                    alumnoCalificaciones.add(calificacion)
                }
                def mapAlumnoData = [alumno:alumno, puntajes:alumnoCalificaciones]
                personasGrupo.add(mapAlumnoData)
            }
            personas.add(personasGrupo)
        }
        [personas:personas]
    }

    def asignarCalificacion() {
        for (def i = 0; i < params.jsonLength.toInteger(); i++) {
            def cadena = i.toString() + "[]"
            def calificacion = params[cadena]
            def calificacionObject = Calificacion.get(calificacion[0])
            if(calificacion[1]) {
                println calificacionObject.calificacion
                calificacionObject.calificacion = calificacion[1]
                println calificacion[1]
                println calificacionObject.calificacion
            }
            calificacionObject.save(flush:true)
            println calificacionObject
        }
        def map = []
        render map as JSON
    }
}
