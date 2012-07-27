package controlpanel

class MenuItemCategory {

    static constraints = {
        name(blank: false)
    }
    String name

    String toString(){
        return name;
    }
}
