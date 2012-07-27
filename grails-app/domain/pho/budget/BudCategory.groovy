package pho.budget

class BudCategory {

    static constraints = {
        name(blank: false)
        description()
        type()
        parent(nullable: true)
    }
    String name
    String description
    BudCategory parent
    BudTransactionType type

    String toString(){
        return (parent? "${parent.name} -> " : "") + "${name} [${type.name}]";
    }
}
