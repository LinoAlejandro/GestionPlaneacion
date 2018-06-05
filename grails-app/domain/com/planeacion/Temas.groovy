package com.planeacion

class Temas {
    String descripcion
    Date fecha

    static belongsTo = [ parcial:Parcial ]

    static constraints = {
        descripcion size:5..800
    }
}
