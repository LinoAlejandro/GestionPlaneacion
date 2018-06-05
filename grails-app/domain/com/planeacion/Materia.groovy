package com.planeacion

class Materia {
    String clave
    String nombre
    String semestre
    String carrera

    static hasMany = [ catedra:Catedra ]

    static constraints = {
        carrera size:5..180
        semestre size:5..150
        clave size:3..350, unique:true
        nombre size:5..500
    }
}
