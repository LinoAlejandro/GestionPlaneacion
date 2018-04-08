package com.ecoax
import grails.plugin.springsecurity.annotation.Secured

class DenunciaController {

    @Secured('ROLE_USER')
    def index() { }
}
