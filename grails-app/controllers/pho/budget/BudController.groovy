package pho.budget

import controlpanel.MenuItemCategory
import controlpanel.MenuItem

class BudController {
    def beforeInterceptor = [action: this.&checkUser]

    def checkUser() {
        if (!session.user) {
            redirect(controller: "user", action: "login")
            return false
        }
    }

    def index(){
        def hmaCat = MenuItemCategory.findWhere(name: "Budget")
        [menuItems: MenuItem.findAllWhere(menuItemCategory: hmaCat)]
    }
}
