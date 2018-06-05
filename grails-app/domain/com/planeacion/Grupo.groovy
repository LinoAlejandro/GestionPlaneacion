package com.planeacion

class Grupo {
    String clave
    String carrera
    String semestre

    static hasMany = [ alumnos:GrupoHasPersona, catedras:Catedra ]

    static belongsTo = Catedra

    static constraints = {
        semestre size:5..25
        clave size:3..150
        carrera size:5..850
    }
}
