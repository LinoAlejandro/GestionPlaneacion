package com.planeacion

class Actividad {
    String tipo
    String descripcion
    Date fLimite

    static belongsTo = [ parcial:Parcial ]

    static constraints = {
        tipo size:5..300
        descripcion size:5..8000
    }
}
