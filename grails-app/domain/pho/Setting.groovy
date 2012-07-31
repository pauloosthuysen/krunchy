package pho

class Setting {

    static constraints = {
        name(blank: false)
        value(blank: false)
    }

    String name
    String value
}
