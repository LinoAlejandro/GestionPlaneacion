package com.planeacion
import grails.plugin.springsecurity.annotation.Secured
import grails.converters.*

@Secured('ROLE_PROFESOR')
class CatedraController {
    def springSecurityService

    def index() {
        def user = springSecurityService.currentUser
        def personaLoged = Persona.findByUser(user)
        if(!params.max) {
            params.max = 10
        }
        def catedras = Catedra.where {
            profesor.id == personaLoged.id
        }
        [catedras:catedras, catedrasCount:catedras.size()]
    }

    def create(Catedra catedra) {

        if(request.method == "POST") {
            def user = springSecurityService.currentUser
            def persona = Persona.findByUser(user)
            def materia = Materia.findByClave(params.clave)
            catedra.profesor = persona

            if(materia) {
                catedra.materia = materia
            }

            if(params.identificador) {
                def folio = params.identificador.split('\\s+')
                def string = ""
                folio.each {
                    string = string + it.substring(0,1)
                }
                catedra.folioRegistro = string
            }

            if(catedra.validate() && catedra.save(flush:true)) {
                def parcialUno = new Parcial(descripcion:'Primero', catedra:catedra).save(flush:true)
                def parcialDos = new Parcial(descripcion:'Segundo', catedra:catedra).save(flush:true)
                def parcialTres = new Parcial(descripcion:'Tercero', catedra:catedra).save(flush:true)
                def ordinario = new Parcial(descripcion:'Ordinario', catedra:catedra).save(flush:true)
                catedra.folioRegistro = catedra.folioRegistro + catedra.id

                catedra.save(flush:true)
                redirect action:'index'
            }
        }

        def lista = Materia.createCriteria()
        def materias = lista.list {
            projections {
                groupProperty('carrera')
            }
        }

        [catedra:catedra, clave:params.clave, materias:materias]
    }

    def update(Catedra catedra) {
        params.offset = params.offset
        def user = springSecurityService.currentUser
        def persona = Persona.findByUser(user)
        if(catedra.profesor.id != persona.id) {
            redirect action:'index'
            return
        }
        if(request.method == 'POST') {
            catedra.properties = params
            if(catedra.save(flush:true)) {
                redirect action:'index', params:[offset:params.offset]
            }
        }
        [catedra:catedra, parcialUno:Parcial.findByCatedraAndDescripcion(catedra,'Primero'),
        parcialDos:Parcial.findByCatedraAndDescripcion(catedra,'Segundo'),
        parcialTres:Parcial.findByCatedraAndDescripcion(catedra, 'Tercero'),
        ordinario:Parcial.findByCatedraAndDescripcion(catedra, 'Ordinario'),
        grupos:Grupo.findAllBySemestreAndCarrera(catedra.materia.semestre, catedra.materia.carrera)]
    }

    def delete(Catedra catedra) {
        catedra.delete(flush:true)
        redirect action:'index', params:[offset:params.offset]
    }

    def addActividad() {
        def actividad = new Actividad(params)
        def parcial = Parcial.findByDescripcion(params.descripcionParcial)
        actividad.parcial = parcial
        if(actividad.save(flush:true)) {
            response.status = 200
            render actividad as JSON
        } else {
            response.status = 204
        }
    }

    def deleteActividad(Actividad actividad) {
        def catedra = actividad?.parcial.catedra.id
        actividad.delete(flush:true)
        redirect action:'update', params:[id:catedra]
    }

    def addTemas() {
        println params
        def tema = new Temas(params)
        println tema
        def parcial = Parcial.findByDescripcion(params.descripcionParcial)
        println parcial
        tema.parcial = parcial
        if(tema.save(flush:true)) {
            response.status = 200
            render tema as JSON
        } else {
            response.status = 204
        }
    }

    def deleteTemas(Temas tema) {
        def catedra = tema?.parcial.catedra.id
        tema.delete(flush:true)
        redirect action:'update', params:[id:catedra]
    }

    def addPuntajes() {
        def puntaje = new Puntaje(params)
        def parcial = Parcial.findByDescripcion(params.descripcionParcial)
        puntaje.parcial = parcial
        if(puntaje.save(flush:true)) {
            def catedra = Catedra.get(params.idCatedra)
            def alumnos = []
            def grupos = catedra.grupos
            grupos.each {
                it.alumnos.each {
                    alumnos.add(it.persona)
                }
            }
            alumnos.each {
                def calificacion = new Calificacion(alumno:Persona.get(it.id), puntaje:puntaje).save(flush:true)
            }
            response.status = 200
            render puntaje as JSON
        } else {
            response.status = 204
        }
    }

    def deletePuntajes(Puntaje puntaje) {
        def catedra = puntaje?.parcial.catedra.id
        puntaje.delete(flush:true)
        redirect action:'update', params:[id:catedra]
    }

    def addGrupos() {
        def map = []
        def claves = params["claves[]"]
        def catedra = Catedra.get(params.idCatedra)

        if(claves instanceof String) {
            def grupo = Grupo.findByClave(claves)
            if(!catedra.grupos.contains(grupo)) {
                map.add([clave:grupo.clave, idGrupo:grupo.id])
            }
            catedra.addToGrupos(grupo).save(flush:true)
        } else {
            claves.each {
                def grupo = Grupo.findByClave(it)
                if(!catedra.grupos.contains(grupo)) {
                    map.add([clave:grupo.clave, idGrupo:grupo.id])
                }
                catedra.addToGrupos(grupo).save(flush:true)
            }
        }
        render map as JSON
    }

    def removeGrupo(Grupo grupo) {
        def catedra = Catedra.get(params.idCatedra)
        catedra.removeFromGrupos(grupo).save(flush:true)
        redirect action:'update', params:[id:catedra.id]
    }

    def removeGrupoAgain() {
        def grupo = Grupo.get(params.idGrupo)
        def catedra = Catedra.get(params.idCatedra)
        catedra.removeFromGrupos(grupo).save(flush:true)
        redirect action:'update', params:[id:catedra.id]
    }

    def returnClavesMateria() {
        def materia = Materia.findAllBySemestreAndCarrera(params.semestre, params.carrera)
        if(materia.size() > 0) {
            render materia as JSON
        } else {
            response.status = 204
        }
    }

    def addAdicional() {
        def catedra = Catedra.get(params.idCatedra)
        def adicional = null
        if(catedra.politicaNormas) {
            adicional = Adicional.get(catedra.politicaNormas.id)
            adicional.properties = params
        } else {
            adicional = new Adicional(norma:params.norma, politica:params.politica, catedra:catedra)
        }
        if (adicional.save(flush:true)) {
            response.status = 200
            render adicional as JSON
        } else {
            response.status = 204
        }
    }
}
