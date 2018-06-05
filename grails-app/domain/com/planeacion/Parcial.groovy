package com.planeacion

class Parcial {
    String descripcion

    static belongsTo = [ catedra:Catedra ]

    static hasMany = [ puntajes:Puntaje, temas:Temas, actividad:Actividad, calificaciones:Calificacion ]

    static constraints = {
        descripcion inList:['Primero','Segundo','Tercero','Ordinario']
    }
}
