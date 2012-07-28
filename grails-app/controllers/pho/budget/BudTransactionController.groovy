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

    def showPerCategory(long categoryId){
        def cat = BudCategory.findWhere(id: categoryId)
        def transactions = BudTransaction.findAllWhere(category:cat)
        return [category: cat, budTransactionInstanceList: transactions, budTransactionInstanceTotal: transactions.size()]
    }

    def showPerLocation(long locationId){
        def loc = BudCategory.findWhere(id: locationId)
        def transactions = BudTransaction.findAllWhere(location: loc)
        return [location: loc, budTransactionInstanceList: transactions, budTransactionInstanceTotal: transactions.size()]
    }

}
