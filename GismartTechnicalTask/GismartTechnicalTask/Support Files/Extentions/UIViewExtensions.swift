//
//  UIViewExtensions.swift
//  GismartTechnicalTask
//
//  Created by Евгений Агеенко on 15.07.22.
//

import Foundation
import UIKit

extension UIView {
    
    func fadeOutUp() {
        transform = CGAffineTransform(translationX: 0, y: 0)
        self.alpha = 1
        
        UIView.animate(withDuration: 1.2,
                       delay: 0,
                       usingSpringWithDamping: 0.9,
                       initialSpringVelocity: 2,
                       options: [],
                       animations: {
            self.transform = CGAffineTransform(translationX: 0, y: -15)
            self.alpha = 0
        }, completion: nil)
    }
    
    func fadeOutUpSecondDigit() {
        transform = CGAffineTransform(translationX: 0, y: +15)
        self.alpha = 0
        
        UIView.animate(withDuration: 1.2,
                       delay: 0,
                       usingSpringWithDamping: 0.9,
                       initialSpringVelocity: 2,
                       options: [],
                       animations: {
            self.transform = CGAffineTransform(translationX: 0, y: 0)
            self.alpha = 1
        }, completion: nil)
    }
}
