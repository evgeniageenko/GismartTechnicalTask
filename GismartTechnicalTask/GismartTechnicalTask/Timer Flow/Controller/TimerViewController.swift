//
//  TimerViewController.swift
//  GismartTechnicalTask
//
//  Created by Евгений Агеенко on 13.07.22.
//

import UIKit

final class TimerViewController: UIViewController {
    @IBOutlet private weak var stackView: UIStackView!
    @IBOutlet private weak var backgroundImageView: UIImageView!
    
    @IBOutlet private weak var closeButton: UIButton!
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subTitleLabel: UILabel!
    @IBOutlet private weak var discountLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
        
    @IBOutlet private weak var timerStackView: TimerStackView!
    @IBOutlet private weak var timerStackViewHeight: NSLayoutConstraint!
    
    @IBOutlet private weak var discountDescriptionLabel: UILabel!
    
    @IBOutlet private weak var activateButtonBackgroundView: UIView!
    @IBOutlet private weak var activateButton: CustomButton!
    
    @IBOutlet private weak var privacyLabel: UILabel!
    @IBOutlet private weak var restoreLabel: UILabel!
    @IBOutlet private weak var temrsLabel: UILabel!
    
    private let timerManager = TimerManager()
    private let popup = Popup()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        runTimer()
        updateUI()
        observeNotifications()
        
        timerStackView.delegate = self
        timerManager.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        popup.frame = view.bounds
    }
    
    func observeNotifications() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(stopTimer),
            name: UIApplication.willResignActiveNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(runTimer),
            name: UIApplication.willEnterForegroundNotification,
            object: nil
        )
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

//MARK: - UI Settings
extension TimerViewController {
    func updateUI() {
        updateFontZiseToIPad()
        updateContentSizeToIPhoneSE()
        
        view.backgroundColor = UIColor.black
        backgroundImageView.image = UIImage(named: "music")
                
        closeButton.tintColor = UIColor(
            red: 0,
            green: 0.19,
            blue: 0.19,
            alpha: 1)
        
        addShadowToActivateButton()
    }
    
    func addShadowToActivateButton() {
        activateButtonBackgroundView.layer.cornerRadius = 12
        activateButtonBackgroundView.layer.cornerCurve = .continuous
        activateButtonBackgroundView.layer.shadowRadius = 25
        activateButtonBackgroundView.layer.shadowOpacity = 1.0
        activateButtonBackgroundView.layer.shadowOffset = CGSize(
            width: 2,
            height: 2)
        activateButtonBackgroundView.layer.shadowColor = UIColor(
            red: (234/255.0),
            green: (72/255.0),
            blue:(187/255.0),
            alpha: 1).cgColor
    }
    
    
    func updateFontZiseToIPad () {
        titleLabel.font = UIFont.topTitleSemiboldFont()
        subTitleLabel.font = UIFont.topTitleSemiboldFont()
        discountLabel.font = UIFont.discountTitleBlackFont()
        descriptionLabel.font = UIFont.descriptionTitleSemiboldFont()
    }
    
    func updateContentSizeToIPhoneSE() {
        switch UIDevice.current.modelName {
        case Device.iPhoneSE:
            stackView.transform = self.view.transform.scaledBy(
                x: 0.65,
                y: 0.65);
        default:
            break
        }
    }
}

//MARK: - Timer logic
extension TimerViewController {
    @objc func runTimer() {
        timerManager.runTimer()
    }
    
    @objc func stopTimer() {
        timerManager.stopTimer()
    }

    func updateCurrentTime() {
        timerManager.updateCurrentTime()
    }
}

//MARK: - IBActions
extension TimerViewController {
    @IBAction func activateButtonPressed(_ sender: UIButton) {
        updateCurrentTime()
        let timeToPopup = timerManager.getCurrentTimeModel().currentTime.joined(separator: ":")
        popup.updateDescriptionWith(text: "Offer activated at \(timeToPopup)")

        view.addSubview(popup)
        stopTimer()
    }
}

//MARK: - TimerManagerDelegate
extension TimerViewController: TimerManagerDelegate {
    func updateTimerWith(currentTimeModel: CurrentTimeModel) {
        timerStackView.updateLabelsWith(currentTimeModel: currentTimeModel)
    }
}

//MARK: - TimerStackViewDelegate
extension TimerViewController: TimerStackViewDelegate {
    func updateHeight(constant: CGFloat) {
        timerStackViewHeight.constant = constant
    }
}
