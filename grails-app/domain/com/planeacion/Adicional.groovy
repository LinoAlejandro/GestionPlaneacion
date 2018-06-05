package com.planeacion

class Adicional {
    String norma
    String politica
    Catedra catedra

    static constraints = {
        norma size:0..10000
        politica size:0..10000
    }
}
