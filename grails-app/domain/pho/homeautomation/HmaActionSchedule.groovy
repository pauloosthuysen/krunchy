package pho.homeautomation

class HmaActionSchedule {

    static constraints = {
        name(blank: false)
        url(blank: false)
        effectiveDate()
        endDate()
        execTimeH(min: 0, max: 23)
        execTimeM(min: 0, max: 59)
        repeatType()
        lastRun(nullable: true)
        lastResponse(maxSize: 10000, nullable: true)
    }
    String name
    Date effectiveDate
    String url
    Date lastRun
    String lastResponse
    Integer execTimeH
    Integer execTimeM
    Date endDate
    HmaActionScheduleRepeatTypes repeatType
}
