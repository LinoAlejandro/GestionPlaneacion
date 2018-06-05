package com.planeacion

class Calificacion {

    String calificacion

    static belongsTo = [alumno:Persona, puntaje:Puntaje]

    static constraints = {
        calificacion nullable:true, blank:true
    }
}
