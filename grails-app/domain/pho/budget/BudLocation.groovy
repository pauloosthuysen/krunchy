package pho.budget

class BudLocation {

    static constraints = {
        country(blank: false)
        state(blank: false)
        city(blank: false)
        suburb(blank: false)
        description(blank: false)
    }
    String country
    String state
    String city
    String suburb
    String description

    String toString(){
        return "${description} (${country}, ${state}, ${city}, ${suburb})"
    }
}
