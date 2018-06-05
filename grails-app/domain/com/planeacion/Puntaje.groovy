package com.planeacion

class Puntaje {
    String descripcion
    Integer valor

    static belongsTo = [ parcial:Parcial ]

    static constraints = {
        descripcion size:2..800
        valor validator: { val, obj ->
            def puntajes = Puntaje.where {
                parcial.id == obj.parcial.id
            }
            def cont = 0
            puntajes.each {
                cont += it.valor
            }
            cont += val
            cont > 100 ? ['valor.overflow'] : true
        }
    }
}
