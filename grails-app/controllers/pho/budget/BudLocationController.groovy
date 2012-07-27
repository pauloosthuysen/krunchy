package pho.budget

import grails.converters.JSON

class BudLocationController {
    def beforeInterceptor = [action: this.&checkUser]
    static scaffold = true

    def checkUser() {
        if (!session.user) {
            redirect(controller: "user", action: "login")
            return false
        }
    }

    def getExistingLocationInfo(String type, String term){
        def locations = BudLocation.list().findAll {it.properties.get(type).toLowerCase() =~ term.toLowerCase()}
        def returnArray = []
        locations.each {
            if(!returnArray.contains(it.properties.get(type))){
                returnArray.add(it.properties.get(type))
            }
        }
        render returnArray as JSON
    }

}
