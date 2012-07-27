package pho

class UserController {

    def beforeInterceptor = [action: this.&checkUser,except:['login','doLogin','doLogout']]
    def scaffold = User

    def login(){

    }

    def doLogin(){
        def user = User.findWhere(email: params["email"],password: params["password"])
        session.user = user
        if (user){
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
