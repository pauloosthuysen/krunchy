package pho

class GlobalService {

    def static getSettingValue(String settingName) {
        return pho.Setting.findWhere(name: settingName)?.value
    }
}
