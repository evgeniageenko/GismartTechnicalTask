//
//  Devices.swift
//  GismartTechnicalTask
//
//  Created by Евгений Агеенко on 16.07.22.
//

import Foundation
import UIKit

public enum Device: String {
    case iPodTouch5
    case iPodTouch6
    case iPhone4
    case iPhone4S
    case iPhone5
    case iPhone5C
    case iPhone5S
    case iPhone6
    case iPhone6Plus
    case iPhone6S
    case iPhone6SPlus
    case iPhone7
    case iPhone7Plus
    case iPhoneSE
    case iPhone8
    case iPhone8Plus
    case iPhoneX
    case iPad2
    case iPad3
    case iPad4
    case iPad5
    case iPadAir
    case IPadAir2
    case iPadMini
    case iPadMini2
    case iPadMini3
    case iPadMini4
    case iPadPro_9_7
    case iPadPro_12_9
    case iPadPro_12_9_2ndGen
    case iPadPro_10_5
    case appleTV_5_3
    case appleTV_6_2
    case homePod
    case simulator
    case other
}


public extension UIDevice {

    var modelName: Device {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8 , value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }

        switch identifier {
        case "iPod5,1":                                 return Device.iPodTouch5
        case "iPod7,1":                                 return Device.iPodTouch6
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return Device.iPhone4
        case "iPhone4,1":                               return Device.iPhone4S
        case "iPhone5,1", "iPhone5,2":                  return Device.iPhone5
        case "iPhone5,3", "iPhone5,4":                  return Device.iPhone5C
        case "iPhone6,1", "iPhone6,2":                  return Device.iPhone5S
        case "iPhone7,2":                               return Device.iPhone6
        case "iPhone7,1":                               return Device.iPhone6Plus
        case "iPhone8,1":                               return Device.iPhone6S
        case "iPhone8,2":                               return Device.iPhone6SPlus
        case "iPhone9,1", "iPhone9,3":                  return Device.iPhone7
        case "iPhone9,2", "iPhone9,4":                  return Device.iPhone7Plus
        case "iPhone8,4":                               return Device.iPhoneSE
        case "iPhone10,1", "iPhone10,4":                return Device.iPhone8
        case "iPhone10,2", "iPhone10,5":                return Device.iPhone8Plus
        case "iPhone10,3", "iPhone10,6":                return Device.iPhoneX
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return Device.iPad2
        case "iPad3,1", "iPad3,2", "iPad3,3":           return Device.iPad3
        case "iPad3,4", "iPad3,5", "iPad3,6":           return Device.iPad4
        case "iPad4,1", "iPad4,2", "iPad4,3":           return Device.iPadAir
        case "iPad5,3", "iPad5,4":                      return Device.IPadAir2
        case "iPad6,11", "iPad6,12":                    return Device.iPad5
        case "iPad2,5", "iPad2,6", "iPad2,7":           return Device.iPadMini
        case "iPad4,4", "iPad4,5", "iPad4,6":           return Device.iPadMini2
        case "iPad4,7", "iPad4,8", "iPad4,9":           return Device.iPadMini3
        case "iPad5,1", "iPad5,2":                      return Device.iPadMini4
        case "iPad6,3", "iPad6,4":                      return Device.iPadPro_9_7
        case "iPad6,7", "iPad6,8":                      return Device.iPadPro_12_9
        case "iPad7,1", "iPad7,2":                      return Device.iPadPro_12_9_2ndGen
        case "iPad7,3", "iPad7,4":                      return Device.iPadPro_10_5
        case "AppleTV5,3":                              return Device.appleTV_5_3
        case "AppleTV6,2":                              return Device.appleTV_6_2
        case "AudioAccessory1,1":                       return Device.homePod
        case "i386", "x86_64":                          return Device.simulator
        default:                                        return Device.other
        }
    }
}
