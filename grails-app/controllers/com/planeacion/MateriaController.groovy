package com.planeacion
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
class MateriaController {

    def index() {
        if(!params.max) {
            params.max = 10
        }
        [materias:Materia.list(params), materiasCount:Materia.count()]
    }

    def create(Materia materia) {
        if(request.method == 'POST') {
            if(materia.save()) {
                redirect action:'index'
            }
        }
        [materia:materia]
    }

    def update(Materia materia) {
        params.offset = params.offset
        if(request.method == 'POST') {
            materia.properties = params
            if(materia.save(flush:true)) {
                redirect action:'index', params:[offset:params.offset]
            }
        }
        [materia:materia]
    }

    def delete(Materia materia) {
        materia.delete(flush:true)
        redirect action:'index', params:[offset:params.offset]
    }
}
