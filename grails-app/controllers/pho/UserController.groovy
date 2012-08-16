package pho

import cr.co.arquetipos.crypto.Blowfish
import cr.co.arquetipos.password.PasswordTools

class UserController {

    def beforeInterceptor = [action: this.&checkUser,except:['login','doLogin','doLogout']]
    def scaffold = User

    def login(){

    }

    def doLogin(){
        def users = User.list()
        def user = null;
        users.each { u->
            if (Blowfish.encryptBase64(params["email"], GlobalService.getDecryptionPassword()) == u.email &&
                    PasswordTools.checkDigestBase64(params["password"], u.password)){
                user = u
            }
        }
        session.user = user
        if (session.user){
            redirect(controller: "home", action: "index")
        }else{
            redirect(controller: "user", action: "login")
        }
    }

    def doLogout(){
        session.user = null;
        redirect(controller: "home", action: "index")
    }

    def checkUser(){
        if(!session.user || !session.user.isAdmin){
            redirect(controller:"user",action:"login")
            return false
        }
    }

    def save() {
        def userInstance = new User(params)
        userInstance.email = Blowfish.encryptBase64(userInstance.email, GlobalService.getDecryptionPassword())
        userInstance.password = PasswordTools.saltPasswordBase64(userInstance.password)
        if (!userInstance.save(flush: true)) {
            render(view: "create", model: [userInstance: userInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: "show", id: userInstance.id)
    }

    def update(Long id, Long version) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (userInstance.version > version) {
                userInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'user.label', default: 'User')] as Object[],
                        "Another user has updated this User while you were editing")
                render(view: "edit", model: [userInstance: userInstance])
                return
            }
        }

        userInstance.properties = params
        userInstance.email = Blowfish.encryptBase64(userInstance.email, GlobalService.getDecryptionPassword())
        userInstance.password = PasswordTools.saltPasswordBase64(userInstance.password)

        if (!userInstance.save(flush: true)) {
            render(view: "edit", model: [userInstance: userInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: "show", id: userInstance.id)
    }
}
