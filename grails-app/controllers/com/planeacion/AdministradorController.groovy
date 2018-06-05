package com.planeacion
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
class AdministradorController {

    def index() {
        def admins = UserRole.where {
            role == Role.findByAuthority('ROLE_ADMIN')
        }.list(params)
        def results = []
        admins.each {
            results.add(it.user)
        }
        [administradores:results, administradoresCount: results.size()]
    }

    def create(User user) {
        if(request.method == 'POST') {
            if(user.save(flush:true)) {
                println 'ok'
                UserRole.create user, Role.findByAuthority('ROLE_ADMIN')
                UserRole.withSession {
                    it.flush()
                    it.clear()
                }
                redirect action:'index'
            }
        }
        [user:user]
    }

    def update(User user) {
        params.offset = params.offset
        if(request.method == 'POST') {
            user.properties = params
            if(user.save(flush:true)) {
                redirect action:'index', params:[offset:params.offset]
            }
        }
        [user:user]
    }

    def delete(User user) {
        def userRole = UserRole.findByUser(user)
        userRole.delete(flush:true)
        user.delete(flush:true)
        redirect action:'index'
    }
}
