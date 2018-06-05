package com.planeacion

class GrupoHasPersona {
    Integer numeroLista

    static belongsTo = [ persona:Persona, grupo:Grupo]

    static constraints = {
        numeroLista min:1
    }

    static mapping = {
        sort numeroLista: 'asc'
    }
}
