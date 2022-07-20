//
//  CurrentTimeModel.swift
//  GismartTechnicalTask
//
//  Created by Евгений Агеенко on 18.07.22.
//

import Foundation

class CurrentTimeModel {
    
    var totalTime = 86400
    
    var currentTime = [String]()
    
    var prevTotalTime: String {
        let prevTotalTime = totalTime - 1
        return timeToString(prevTotalTime)
    }
    
    var daysCount: String {
        let day = totalTime / 86400
        return timeToString(day)
    }
    var hoursCount: String {
        let hour = (totalTime % 86400) / 3600
        return timeToString(hour)
    }
    var minutesCount: String {
        let minute = (totalTime % 3600) / 60
        return timeToString(minute)
    }
    
    var secondsCount: String {
        let second = (totalTime % 3600) % 60
        return timeToString(second)
    }
    
    var prevSecondsCount: String {
        if let prevSeondInt = Int(prevTotalTime){
            let prevSecond = (prevSeondInt % 3600) % 60
            return timeToString(prevSecond)
        }
        return "0"
    }
    
    
    func timeToString(_ time: Int) -> String {
        return String(format: "%02d", time)
    }
    
}

