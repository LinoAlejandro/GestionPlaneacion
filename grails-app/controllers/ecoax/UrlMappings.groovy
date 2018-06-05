package ecoax

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: "general", action:'index')
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
