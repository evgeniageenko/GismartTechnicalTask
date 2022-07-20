//
//  UIViewExtensions.swift
//  GismartTechnicalTask
//
//  Created by Евгений Агеенко on 18.07.22.
//

import Foundation
import UIKit

extension UIFont {
    static func topTitleSemiboldFont() -> UIFont {
        let size: CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 35 : 22
        return UIFont.systemFont(ofSize: size, weight: .semibold)
    }
    
    static func discountTitleBlackFont() -> UIFont {
        let size: CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 80 : 55
        return UIFont.systemFont(ofSize: size, weight: .black)
    }
    
    static func descriptionTitleSemiboldFont() -> UIFont {
        let size: CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 20 : 15
        return UIFont.systemFont(ofSize: size, weight: .semibold)
    }
    
    static func descriptionTitleRegularFont() -> UIFont {
        let size: CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 18 : 14
        return UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    static func bottomButtonsRegularFont() -> UIFont {
        let size: CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 14 : 10
        return UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
}
