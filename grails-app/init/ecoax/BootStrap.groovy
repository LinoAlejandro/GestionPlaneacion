package ecoax
import com.planeacion.User
import com.planeacion.Role
import com.planeacion.UserRole
import com.planeacion.Persona
import com.planeacion.Grupo
import com.planeacion.GrupoHasPersona
import com.planeacion.Materia
import com.planeacion.Notificacion

class BootStrap {
    def init = { servletContext ->
        def userAdmin = new User(username:'admin', password:'admin').save(flush:true)
        def userProfesor = new User(username:'profesor', password:'profesor').save(flush:true)
        def userAlumno1 = new User(username:'alumno1', password:'alumno1').save(flush:true)
        def userAlumno2 = new User(username:'alumno2', password:'alumno2').save(flush:true)
        def userAlumno3 = new User(username:'alumno3', password:'alumno3').save(flush:true)

        def roleAdmin = new Role(authority:'ROLE_ADMIN').save(flush:true)
        def roleProfesor = new Role(authority:'ROLE_PROFESOR').save(flush:true)
        def roleAlumno = new Role(authority:'ROLE_ALUMNO').save(flush:true)

        UserRole.create userAdmin, roleAdmin
        UserRole.create userProfesor, roleProfesor
        UserRole.create userAlumno1, roleAlumno
        UserRole.create userAlumno2, roleAlumno
        UserRole.create userAlumno3, roleAlumno

        UserRole.withSession {
            it.flush()
            it.clear()
        }

        def personaProfesor = new Persona(user:userProfesor,password:"profesor",
        username:"profesor", nombre:"profesor",
        apPaterno:"profesor", apMaterno:"profesor", matricula:"142300025",
        email:"profesor@profesor.com", isAlumno:false).save(flush:true)

        def alumno1 = new Persona(user:userAlumno1 ,password:"alumno1",
        username:"alumno1", nombre:"alumno1",
        apPaterno:"alumno1", apMaterno:"alumno1", matricula:"14230050",
        email:"alumno1@alumno1.com", isAlumno:true).save(flush:true)

        def alumno2 = new Persona(user:userAlumno2 ,password:"alumno2",
        username:"alumno2", nombre:"alumno2",
        apPaterno:"alumno2", apMaterno:"alumno2", matricula:"14230051",
        email:"alumno2@alumno2.com", isAlumno:true).save(flush:true)

        def alumno3 = new Persona(user:userAlumno3 ,password:"alumno3",
        username:"alumno3", nombre:"alumno3",
        apPaterno:"alumno3", apMaterno:"alumno3", matricula:"14230052",
        email:"alumno3@alumno3.com", isAlumno:true).save(flush:true)

        def grupo = new Grupo(clave:'is8a', carrera:'Ingeniería en Software y Sistemas Computacionales',
        semestre:'Octavo').save(flush:true)

        def grupoHasPersona1 = new GrupoHasPersona(numeroLista:1, persona:alumno1,
        grupo:grupo).save(flush:true)
        def grupoHasPersona2 = new GrupoHasPersona(numeroLista:2, persona:alumno2,
        grupo:grupo).save(flush:true)
        def grupoHasPersona3 = new GrupoHasPersona(numeroLista:3, persona:alumno3,
        grupo:grupo).save(flush:true)

        def materia = new Materia(clave:'SO2', nombre:'Sistemas Operativos 2', carrera:'Ingeniería en Software y Sistemas Computacionales',
        semestre:'Octavo').save(flush:true)

        def notificacion = new Notificacion(descripcion:'Alberto Morales de la clase claveCatedra', watched:false, persona:personaProfesor).save(flush:true)
        def notificacion2 = new Notificacion(descripcion:'Alberto Morales de la clase claveCatedra', watched:false, persona:personaProfesor).save(flush:true)
        def notificacion3 = new Notificacion(descripcion:'Alberto Morales de la clase claveCatedra', watched:false, persona:personaProfesor).save(flush:true)
        def notificacion4 = new Notificacion(descripcion:'Alberto Morales de la clase claveCatedra', watched:true, persona:personaProfesor).save(flush:true)
    }
    def destroy = {
    }
}
