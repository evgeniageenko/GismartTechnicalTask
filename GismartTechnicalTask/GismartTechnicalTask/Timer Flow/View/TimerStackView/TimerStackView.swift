//
//  TimerStackView.swift
//  GismartTechnicalTask
//
//  Created by Евгений Агеенко on 18.07.22.
//

import UIKit
 
protocol TimerStackViewDelegate: AnyObject {
    func updateHeight(constant: CGFloat)
}

class TimerStackView: UIStackView {    
    @IBOutlet private weak var dayLabel: UILabel!
    @IBOutlet private weak var hourLabel: UILabel!
    @IBOutlet private weak var minuteLabel: UILabel!
    @IBOutlet private weak var secondLabel: UILabel!
    @IBOutlet private weak var prevSecondLabel: UILabel!
    
    @IBOutlet private weak var dayView: UIView!
    @IBOutlet private weak var hourView: UIView!
    @IBOutlet private weak var minuteView: UIView!
    @IBOutlet private weak var secondView: UIView!
    
    weak var delegate: TimerStackViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        if let nibStackView = Bundle.main.loadNibNamed("\(type(of: self))", owner: self, options: nil)?.first as? UIStackView {
            addArrangedSubview(nibStackView)
        }
        
        updateSizeToiPad()
        
        dayView.layer.cornerRadius = 12
        hourView.layer.cornerRadius = 12
        minuteView.layer.cornerRadius = 12
        secondView.layer.cornerRadius = 12
    }
    
    private func updateSizeToiPad() {
        if UIDevice.current.userInterfaceIdiom == .pad {
            let heightValue: CGFloat = 57            
            dayView.frame.size.height = heightValue
            hourView.frame.size.height = heightValue
            minuteView.frame.size.height = heightValue
            secondView.frame.size.height = heightValue
            delegate?.updateHeight(constant: heightValue)
        }
    }
    
    func updateLabelsWith(currentTimeModel: CurrentTimeModel) {
        dayLabel.text = currentTimeModel.daysCount
        hourLabel.text = currentTimeModel.hoursCount
        minuteLabel.text = currentTimeModel.minutesCount
        secondLabel.text = currentTimeModel.secondsCount
        prevSecondLabel.text = currentTimeModel.prevSecondsCount
        secondLabel.fadeOutUp()
        prevSecondLabel.fadeOutUpSecondDigit()
    }
}
