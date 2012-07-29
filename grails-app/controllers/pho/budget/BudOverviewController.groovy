package pho.budget

class BudOverviewController {
    def beforeInterceptor = [action: this.&checkUser]

    def checkUser() {
        if (!session.user) {
            redirect(controller: "user", action: "login")
            return false
        }
    }

    def index(int from, int to){
        def incomes = BudTransaction.list().findAll{it.category.type.name == "Income"}
        def incomesTotal = 0
        incomes.each {
            incomesTotal += it.amount
        }
        def expenses = BudTransaction.list().findAll{it.category.type.name == "Expense"}
        def expensesTotal = 0
        expenses.each {
            expensesTotal += it.amount
        }
        [
            incomes: incomes.sort{it.date},
            incomesTotal: incomesTotal.toBigDecimal(),
            expenses: expenses.sort{it.date},
            expensesTotal: expensesTotal.toBigDecimal()
        ]
    }
}
