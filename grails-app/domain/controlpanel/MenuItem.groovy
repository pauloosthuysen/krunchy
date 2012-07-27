package controlpanel

class MenuItem {

    static constraints = {
        name(blank: false)
        component(blank: false)
        imgFilename(blank: false)
        menuItemCategory()
        forAdmin()
    }
    MenuItemCategory menuItemCategory
    String name
    String imgFilename
    String component
    Boolean forAdmin
}