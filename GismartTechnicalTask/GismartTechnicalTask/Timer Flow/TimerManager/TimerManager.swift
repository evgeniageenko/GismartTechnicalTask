//
//  TimerManager.swift
//  GismartTechnicalTask
//
//  Created by Евгений Агеенко on 17.07.22.
//

import Foundation

protocol TimerManagerDelegate: AnyObject {
    func updateTimerWith(currentTimeModel: CurrentTimeModel)
}

class TimerManager {
    private let currentTimeModel = CurrentTimeModel()
    private var timer: Timer?
    weak var delegate: TimerManagerDelegate?

    @objc private func updateTimer() {
        if currentTimeModel.totalTime > 0 && timer != nil {
            currentTimeModel.totalTime -= 1
            delegate?.updateTimerWith(currentTimeModel: currentTimeModel)
        } else {
            stopTimer()
        }
    }
    
    @objc func runTimer() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            if self.timer == nil {
                self.timer = Timer.scheduledTimer(
                    timeInterval: 1.0,
                    target: self,
                    selector: #selector(self.updateTimer),
                    userInfo: nil,
                    repeats: true
                )
            }
        }
    }
    
    @objc func stopTimer() {
        DispatchQueue.main.async { [weak self] in
            if self?.timer != nil {
                self?.timer!.invalidate()
                self?.timer = nil
            }
        }
    }

    func updateCurrentTime() {
        let currentDay = currentTimeModel.daysCount
        let currrentHour = currentTimeModel.hoursCount
        let currentMinute = currentTimeModel.minutesCount
        let currentSecond = currentTimeModel.prevSecondsCount
        
        if let intCurrentDay = Int(currentDay) {
            if intCurrentDay > 0 {
                currentTimeModel.currentTime.append(currentDay)
            }
            if let intCurrentHour = Int(currrentHour) {
                if intCurrentHour > 0 {
                    currentTimeModel.currentTime.append(currrentHour)
                }
            }
            if let intCurrentMinute = Int(currentMinute) {
                if intCurrentMinute > 0 {
                    currentTimeModel.currentTime.append(currentMinute)
                }
            }
            if let intCurrentSecond = Int(currentSecond) {
                if intCurrentSecond > 0 {
                    currentTimeModel.currentTime.append(currentSecond)
                }
            }
        }
    }
    
    func getCurrentTimeModel() -> CurrentTimeModel {
        return currentTimeModel
    }
}
