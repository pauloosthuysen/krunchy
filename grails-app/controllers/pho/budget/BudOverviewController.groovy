package pho.budget

class BudOverviewController {
    def beforeInterceptor = [action: this.&checkUser]

    def checkUser() {
        if (!session.user) {
            redirect(controller: "user", action: "login")
            return false
        }
    }

    def index(){
        def curDate = new Date()
        def fromDate = new Date(curDate.year, curDate.month, 1).clearTime()
        def toDate = curDate
        if (request.getParameter("fromDate")){
            fromDate = Date.parse("y-M-d", ("${request.getParameter("fromDate_year")}-${request.getParameter("fromDate_month")}-${request.getParameter("fromDate_day")}"))
        }
        if (request.getParameter("toDate")){
            toDate = Date.parse("y-M-d", ("${request.getParameter("toDate_year")}-${request.getParameter("toDate_month")}-${request.getParameter("toDate_day")}"))
        }
        toDate.setHours(23)
        toDate.setMinutes(59)
        toDate.setSeconds(59)
        if (fromDate > toDate){
            fromDate = new Date(curDate.year, curDate.month, 1).clearTime()
            toDate = curDate
        }
        def incomes = BudTransaction.list().findAll{it.category.type.name == "Income"}
        if (fromDate && toDate){
            incomes = incomes.findAll {it.date >= fromDate && it.date <= toDate}
        }
        def incomesTotal = 0
        incomes.each {
            incomesTotal += it.amount
        }
        def expenses = BudTransaction.list().findAll{it.category.type.name == "Expense"}
        if (fromDate && toDate){
            expenses = expenses.findAll {it.date >= fromDate && it.date <= toDate}
        }
        def expensesTotal = 0
        expenses.each {
            expensesTotal += it.amount
        }

        def balance = incomesTotal - expensesTotal
        def cal = new GregorianCalendar()
        def daysLeftOfMonth = cal.getActualMaximum(Calendar.DAY_OF_MONTH) - (curDate.date - 1)
        def balanceLeftForMonth = balance / daysLeftOfMonth
        def threshold = 50 //TODO: rather get this from a settings table
        def excessAmount = balance - (threshold * daysLeftOfMonth)

        [
            incomes: incomes.sort{it.date},
            incomesTotal: incomesTotal.toBigDecimal(),
            expenses: expenses.sort{it.date},
            expensesTotal: expensesTotal.toBigDecimal(),
            fromDate: fromDate,
            toDate: toDate,
            balance: balance.toBigDecimal(),
            daysLeftOfMonth: daysLeftOfMonth,
            balanceLeftForMonth: balanceLeftForMonth.toBigDecimal(),
            excessAmount: excessAmount.toBigDecimal(),
            threshold: threshold.toBigDecimal()
        ]
    }
}
