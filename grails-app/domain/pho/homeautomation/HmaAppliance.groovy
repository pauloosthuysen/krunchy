package pho.homeautomation

class HmaAppliance {

    static constraints = {
        name(blank: false)
        code(blank:  false)
        applianceCategory()
        description()
    }
    String name
    String code
    String description
    HmaApplianceCategory applianceCategory
}
