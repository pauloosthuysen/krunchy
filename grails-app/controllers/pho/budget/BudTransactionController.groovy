package pho.budget

class BudTransactionController {
    def beforeInterceptor = [action: this.&checkUser]
    static scaffold = true

    def checkUser() {
        if (!session.user) {
            redirect(controller: "user", action: "login")
            return false
        }
    }
}
