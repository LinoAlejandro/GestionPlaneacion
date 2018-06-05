package com.planeacion

class Notificacion {
    String link
    String descripcion
    boolean watched

    static belongsTo = [ persona:Persona ]

    static constraints = {
        link size:2..800, nullable:true, blank:true
        descripcion size:5..1500
    }
}
