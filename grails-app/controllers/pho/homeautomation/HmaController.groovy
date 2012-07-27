package pho.homeautomation

import controlpanel.MenuItem
import controlpanel.MenuItemCategory
import grails.converters.JSON
import pho.ActionSchedulesService

class HmaController {
    def beforeInterceptor = [action: this.&checkUser, except: ['execActionScripts','panicButton']]
    def secret = "d65454df342qwed"

    def checkUser(){
        if(!session.user){
            redirect(controller:"user",action:"login")
            return false
        }
    }

    def index(){
        def hmaCat = MenuItemCategory.findWhere(name: "Home Automation")
        [menuItems: MenuItem.findAllWhere(menuItemCategory: hmaCat)]
    }

    /*
        Call this method from crontab every minute:
        http://localhost:9090/PHO/hma/execActionScripts?secret=d65454df342qwed
     */
    def execActionScripts(String secret){
        if (secret == this.secret){
            new ActionSchedulesService().checkAndDoAction()
            render "done"
        }
    }

    def toggleAppliance(String secret, String params){
        if (secret == this.secret){
            def res = new ActionSchedulesService().doIt(params)
            render res
        }
    }

    def controlDevices(){
        [appliances: HmaAppliance.list(),appCategories: HmaApplianceCategory.list()]
    }

    def getAppliancesStatus(String secret){
        if (secret == this.secret){
            def res = new ActionSchedulesService().doIt("action=getStatus")
            render JSON.parse(res) as JSON
        }
    }

    /*
        Call this method from Arduino:
        http://localhost:9090/PHO/hma/panicButton?secret=d65454df342qwed
     */
    def panicButton(String secret){
        if (secret == this.secret){
            //post to FB and/or Twitter, send mail
            render "Done"
        }
    }
}
