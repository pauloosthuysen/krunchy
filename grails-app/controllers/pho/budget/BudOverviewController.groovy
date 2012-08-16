package pho.budget

import pho.GlobalService

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
        def incomesTotal = 0
        def expensesTotal = 0
        def incomes = BudTransaction.list().findAll{it.category.type.name == "Income"}
        def expenses = BudTransaction.list().findAll{it.category.type.name == "Expense"}
        def balance = 0
        def cal = new GregorianCalendar()
        def daysLeftOfMonth = cal.getActualMaximum(Calendar.DAY_OF_MONTH) - (curDate.date - 1)
        def balanceLeftForMonth = 0
        def settingsThreshold = GlobalService.getSettingValue('BudgetThreshold')
        def threshold = settingsThreshold ? settingsThreshold.toInteger() : 100
        def excessAmount = 0

        //get selected dates and assign these to variables. If fromDate > toDate, reset date selections to default
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

        //get incomes between dates
        incomes = incomes.findAll {it.date >= fromDate && it.date <= toDate}
        incomes.each {
            incomesTotal += it.amount
        }

        //get expenses between dates
        expenses = expenses.findAll {it.date >= fromDate && it.date <= toDate}
        expenses.each {
            expensesTotal += it.amount
        }

        //calculate and update variables
        balance = incomesTotal - expensesTotal
        balanceLeftForMonth = balance / daysLeftOfMonth
        excessAmount = balance - (threshold * daysLeftOfMonth)

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
