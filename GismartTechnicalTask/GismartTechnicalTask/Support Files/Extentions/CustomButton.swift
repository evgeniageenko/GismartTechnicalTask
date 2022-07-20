//
//  CustomButton.swift
//  GismartTechnicalTask
//
//  Created by Евгений Агеенко on 16.07.22.
//

import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        clipsToBounds = true
        layer.cornerRadius = 12
        layer.cornerCurve = .continuous

        //Gradient
        let gradientLayer = CAGradientLayer()
        let topColor = UIColor(
            red: (65/225.0),
            green: (69/255.0),
            blue: (152/255.0),
            alpha: 1)
        let bottomColor = UIColor(
            red: (234/255.0),
            green: (72/255.0),
            blue: (187/255.0),
            alpha: 1)
        let gradientColors: [CGColor] = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.colors = gradientColors
        gradientLayer.locations = nil
        gradientLayer.frame = bounds
        
        layer.insertSublayer(gradientLayer, at: 0)
        
        
        self.layer.cornerRadius = 12
        self.layer.cornerCurve = .continuous
        self.layer.shadowRadius = 25
        self.layer.shadowOpacity = 1.0
        self.layer.shadowOffset = CGSize(
            width: 2,
            height: 2)
        self.layer.shadowColor = UIColor(
            red: (234/255.0),
            green: (72/255.0),
            blue:(187/255.0),
            alpha: 1).cgColor
    }
}

