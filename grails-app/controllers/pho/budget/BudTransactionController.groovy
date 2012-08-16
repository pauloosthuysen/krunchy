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

    def create() {
        [budTransactionInstance: new BudTransaction(params), type: request.getParameter("type"),backTo: request.getParameter("backTo")]
    }

    def save() {
        def budTransactionInstance = new BudTransaction(params)
        if (!budTransactionInstance.save(flush: true)) {
            render(view: "create", model: [budTransactionInstance: budTransactionInstance, type: params.get('type'), backTo: params.get('backTo')])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'budTransaction.label', default: 'BudTransaction'), budTransactionInstance.id])
        if (request.getParameter('backTo')){
            redirect(controller: request.getParameter('backTo'), action: "index")
        }else{
            redirect(action: "show", id: budTransactionInstance.id)
        }
    }

}
