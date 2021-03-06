package com.planeacion
import grails.plugin.springsecurity.annotation.Secured

class ProfesorController {
    @Secured('ROLE_ADMIN')
    def index() {
        if(!params.max) {
            params.max = 10
        }
        def profesores = Persona.where {
            isAlumno == false
        }.list(params)
        [profesores:profesores, profesoresCount:profesores.size()]
    }

    @Secured('ROLE_ADMIN')
    def create(Persona persona) {
        if(request.method == "POST") {
            def user = new User(params)
            persona.user = user
            persona.isAlumno = false
            if(persona.save(flush:true)) {
                user.save(flush:true)
                def role = Role.findByAuthority('ROLE_PROFESOR')
                UserRole.create user, role
                UserRole.withSession {
                    it.flush()
                    it.clear()
                }
                redirect action:'index'
            }
        [persona:persona]
        }
    }

    @Secured('ROLE_ADMIN')
    def update(Persona persona) {
        params.offset = params.offset
        persona.properties = params
        if(request.method == "POST") {
            if(persona.save(flush:true)) {
                def user = persona.user
                user.username = persona.username
                user.password = persona.password
                user.save(flush:true)
                redirect action:'index',  params:[offset:params.offset]
            }
        }
        [persona:persona]
    }

    @Secured('ROLE_ADMIN')
    def delete(Persona persona) {
        params.offset = params.offset
        def user = persona.user
        def userRole = UserRole.findByUser(user)
        def allUserRole = UserRole.list()
        userRole.delete(flush:true)
        persona.delete(flush:true)
        user.delete(flush:true)
        redirect action:'index', params:[offset:params.offset]
    }
}
