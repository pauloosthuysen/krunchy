package pho

import controlpanel.MenuItemCategory

class HomeController {

    def index() {
        def cpCat = MenuItemCategory.findWhere(name: "Control Panel")
        [
                adminMenuItems: controlpanel.MenuItem.findAllWhere(forAdmin: true, menuItemCategory: cpCat),
                userMenuItems: controlpanel.MenuItem.findAllWhere(forAdmin: false, menuItemCategory: cpCat)
        ]
    }
}
