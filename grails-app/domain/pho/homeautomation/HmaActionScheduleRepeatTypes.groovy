package pho.homeautomation

class HmaActionScheduleRepeatTypes {

    static constraints = {
        name(blank: false)
    }
    String name

    String toString(){
        return name
    }
}
