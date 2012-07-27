package pho.budget

class BudTransaction {

    static constraints = {
        description(blank: false)
        amount(blank:false)
        date()
        category()
        location(nullable: true)
    }
    String description
    Double amount
    Date date
    BudCategory category
    BudLocation location
}
