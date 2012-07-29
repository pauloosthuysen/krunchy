class BootStrap {

    def init = { servletContext ->
        //admin users
        def adminUser = new pho.User(email: "admin@user.com", password: "1234",isAdmin: true)
        adminUser.save()

        //normal users
        def normalUser = new pho.User(email: "normal@user.com", password: "1234",isAdmin: false)
        normalUser.save()

        //menuItemCategory defs
        def cpMenuItemCat = new controlpanel.MenuItemCategory(name: "Control Panel")
        cpMenuItemCat.save()
        def hmaMenuItemCat = new controlpanel.MenuItemCategory(name: "Home Automation")
        hmaMenuItemCat.save()
        def budMenuItemCat = new controlpanel.MenuItemCategory(name: "Budget")
        budMenuItemCat.save()

        //admin CP items
        new controlpanel.MenuItem(name: "Menu Items", component: "menuItem", imgFilename: "menuitems.png", forAdmin: true, menuItemCategory: cpMenuItemCat).save()
        new controlpanel.MenuItem(name: "Menu Item Categories", component: "menuItemCategory", imgFilename: "menuitemcategories.png", forAdmin: true, menuItemCategory: cpMenuItemCat).save()
        new controlpanel.MenuItem(name: "Users", component: "user", imgFilename: "users.png", forAdmin: true, menuItemCategory: cpMenuItemCat).save()

        //normal CP items
        new controlpanel.MenuItem(name: "Notes", component: "note", imgFilename: "notes.png", forAdmin: false, menuItemCategory: cpMenuItemCat).save()
        new controlpanel.MenuItem(name: "Home Automation", component: "hma", imgFilename: "homeautomation.png", forAdmin: false, menuItemCategory: cpMenuItemCat).save()
        new controlpanel.MenuItem(name: "Budget", component: "bud", imgFilename: "budget.png", forAdmin: false, menuItemCategory: cpMenuItemCat).save()

        //normal HmaCP Items
        new controlpanel.MenuItem(name: "Appliances", component: "hmaAppliance", imgFilename: "appliances.png", forAdmin: false, menuItemCategory: hmaMenuItemCat).save()
        new controlpanel.MenuItem(name: "Appliance Categories", component: "hmaApplianceCategory", imgFilename: "appliancecategories.png", forAdmin: false, menuItemCategory: hmaMenuItemCat).save()
        new controlpanel.MenuItem(name: "Action Schedules", component: "hmaActionSchedule", imgFilename: "actionschedules.png", forAdmin: false, menuItemCategory: hmaMenuItemCat).save()
        new controlpanel.MenuItem(name: "Control Appliances", component: "hma/controlDevices", imgFilename: "controldevices.png", forAdmin: false, menuItemCategory: hmaMenuItemCat).save()

        //normal BudCP Items
        new controlpanel.MenuItem(name: "Transactions", component: "budTransaction", imgFilename: "transactions.png", forAdmin: false, menuItemCategory: budMenuItemCat).save()
        new controlpanel.MenuItem(name: "Categories", component: "budCategory", imgFilename: "transactioncategories.png", forAdmin: false, menuItemCategory: budMenuItemCat).save()
        new controlpanel.MenuItem(name: "Locations", component: "budLocation", imgFilename: "locations.png", forAdmin: false, menuItemCategory: budMenuItemCat).save()

        //adminUser notes
        new pho.Note(name: "Sample Note 1", subject: "Out-of-the-box Note 1", content: "This is a sample note...[Note 1]", user: adminUser).save()
        new pho.Note(name: "Sample Note 2", subject: "Out-of-the-box Note 2", content: "This is a sample note...[Note 2]", user: adminUser).save()
        new pho.Note(name: "Sample Note 3", subject: "Out-of-the-box Note 3", content: "This is a sample note...[Note 3]", user: adminUser).save()

        //normalUser notes
        new pho.Note(name: "Sample Note 1", subject: "Out-of-the-box Note 1", content: "This is a sample note...[Note 1]", user: normalUser).save()
        new pho.Note(name: "Sample Note 2", subject: "Out-of-the-box Note 2", content: "This is a sample note...[Note 2]", user: normalUser).save()
        new pho.Note(name: "Sample Note 3", subject: "Out-of-the-box Note 3", content: "This is a sample note...[Note 3]", user: normalUser).save()

        //HmaCategories
        def livingRoomHmaCat = new pho.homeautomation.HmaApplianceCategory(name: "Living Room")
        livingRoomHmaCat.save()
        new pho.homeautomation.HmaApplianceCategory(name: "Kitchen").save()
        new pho.homeautomation.HmaApplianceCategory(name: "Main Bedroom").save()
        new pho.homeautomation.HmaApplianceCategory(name: "Second Bedroom").save()
        new pho.homeautomation.HmaApplianceCategory(name: "Balcony").save()
        new pho.homeautomation.HmaApplianceCategory(name: "Bathroom").save()

        //HmaAppliances
        new pho.homeautomation.HmaAppliance(name: "Main Light", code: "L", applianceCategory: livingRoomHmaCat, description: "").save()

        //HmaActionScheduleRepeatTypes
        new pho.homeautomation.HmaActionScheduleRepeatTypes(name: "Once-off").save()
        new pho.homeautomation.HmaActionScheduleRepeatTypes(name: "Daily").save()
        new pho.homeautomation.HmaActionScheduleRepeatTypes(name: "Weekly").save()
        new pho.homeautomation.HmaActionScheduleRepeatTypes(name: "Monthly").save()
        new pho.homeautomation.HmaActionScheduleRepeatTypes(name: "Yearly").save()

        //BudTransactionTypes
        def budTransTypeInc = new pho.budget.BudTransactionType(name: "Income")
        budTransTypeInc.save()
        def budTransTypeExp = new pho.budget.BudTransactionType(name: "Expense")
        budTransTypeExp.save()

        //BudCategories
        new pho.budget.BudCategory(name: "Transport", description: "All transport related expenses.", type: budTransTypeExp, parent: null).save()
    }
    def destroy = {
    }
}
