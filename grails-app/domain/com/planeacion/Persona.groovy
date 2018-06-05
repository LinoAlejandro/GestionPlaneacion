package com.planeacion

class Persona {
    User user
    String username
    String password
    String nombre
    String apPaterno
    String apMaterno
    Integer matricula
    String email
    Boolean isAlumno

    static hasMany = [notificaciones:Notificacion, calificaciones:Calificacion]

    static constraints = {
        username unique:true, size:4..40, matches:'[A-z0-9@#$%]{4,}'
        nombre size:2..400
        apPaterno size:3..500
        apMaterno size:3..500
        matricula unique:true
        email email:true
    }

    static mapping = {
        sort apPaterno: 'asc'
    }
}
