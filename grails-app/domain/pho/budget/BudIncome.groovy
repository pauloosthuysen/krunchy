package pho.budget

class BudIncome {

    static constraints = {
        description(blank: false)
        amount(blank: false)
        date()
    }
    String description
    Double amount
    Date date
}
