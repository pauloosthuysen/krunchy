package pho.homeautomation

class HmaApplianceCategory {

    static constraints = {
        name(blank: false)
    }
    String name

    String toString(){
        return name
    }
}
