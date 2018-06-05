package com.planeacion
import org.grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN','ROLE_PROFESOR'])
class NotificacionController {

    def springSecurityService

    def index() {
        def user = springSecurityService.currentUser
        def persona = Persona.findByUser(user)

        if(!params.max) {
            params.max = 10
        }

        def notificaciones = Notificacion.where {
            persona.id == persona.id
        }.lit(params)

        [notificaciones: notificaciones, notificacionesCount: Notificacion.count()]
    }
}
