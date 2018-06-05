package com.planeacion

class Catedra {
    String identificador
    String folioRegistro

    static belongsTo = [ profesor:Persona, materia:Materia ]

    static hasMany = [ parcial:Parcial, grupos:Grupo ]

    static hasOne = [ politicaNormas: Adicional ]

    static constraints = {
        identificador validator: { val, obj ->
            def ide = obj.id ?: 0
            def catedras = Catedra.where {
                (profesor == obj.profesor) && (identificador == val) && (id != ide)
            }
            return catedras.count() == 0
        }
        politicaNormas nullable:true
    }
}
