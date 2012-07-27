package pho.budget

class BudTransactionType {

    static constraints = {
        name(blank: false)
    }
    String name

    String toString(){
        return name
    }
}
