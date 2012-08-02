package pho

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
            if (PasswordTools.checkDigestBase64(params["email"], u.email) &&
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
}
