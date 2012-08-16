package pho

class SettingController {
    def beforeInterceptor = [action: this.&checkUser]
    static scaffold = true

    def checkUser() {
        if (!session.user || !session.user.isAdmin) {
            redirect(controller: "user", action: "login")
            return false
        }
    }
}
