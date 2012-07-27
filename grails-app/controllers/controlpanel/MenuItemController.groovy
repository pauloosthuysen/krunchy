package controlpanel

class MenuItemController {

    def beforeInterceptor = [action: this.&checkUser]
    def scaffold = MenuItem

    def checkUser(){
        if(!session.user || !session.user.isAdmin){
            redirect(controller:"user",action:"login")
            return false
        }
    }
}
