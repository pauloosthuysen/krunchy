package pho

import pho.homeautomation.HmaActionSchedule

class ActionSchedulesService {

    def doIt(String params) {
        def url = new URL("http://192.168.0.71:8088/?secret=ajh32ww&${params}")
        return url.getText()
    }

    def checkAndDoAction(){
        def now = new Date()
        def url = null
        def doRun = false
        def actions = HmaActionSchedule.list().findAll{it-> it.effectiveDate <= now && it.execTimeH == now.hours && it.execTimeM == now.minutes && it.endDate >= now.clearTime()}
        actions.each{
            if(!doRun && it.repeatType.name == "Once-off" && it.lastRun == null){
                doRun = true
            }else if (!doRun && it.repeatType.name == "Daily" && (it.lastRun == null || it.lastRun.date == (now.date - 1))){
                doRun = true
            }else if (!doRun && it.repeatType.name == "Weekly" && (it.lastRun == null || it.lastRun.date == (now.date - 7))){
                doRun = true
            }else if (!doRun && it.repeatType.name == "Monthly" && (it.lastRun == null || it.lastRun.month == (now.month - 1))){
                doRun = true
            }else if (!doRun && it.repeatType.name == "Yearly" && (it.lastRun == null || it.lastRun.year == (now.year - 1))){
                doRun = true
            }
            if (doRun){
                url = new URL(it.url)
                it.lastRun = now
                it.lastResponse = url.getText().size() <= 10000 ? url.getText() : "{OUTPUT WAS TOO LONG}"
                it.save()
                System.out.println("${now}: execActionScripts|${it.url}|${url?.getText()}")
            }
        }
    }
}
