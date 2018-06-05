package com.planeacion
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN','ROLE_PROFESOR'])
class GeneralController {

    def springSecurityService

    def index() {
        def user = springSecurityService.currentUser
        def persona = Persona.findByUser(user)
        def notificaciones = Notificacion.where {
            (watched == false) && (persona.id == persona.id)
        }.list()
        println notificaciones.size()

        session.notificacionesTotal = notificaciones.size()
        return 
    }
}
