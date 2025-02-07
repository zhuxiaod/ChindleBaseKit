//
//  File.swift
//  EnglishLearningApp
//
//  Created by 朱𣇈丹 on 2024/6/28.
//

import Foundation

import UIKit

public class EKDeviceInfo {
    
    // 获取设备系统版本号
    static var systemVersion: String {
        return UIDevice.current.systemVersion
    }
    
    // 获取 APP 版本号
    static var appVersion: String {
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            return version
        }
        return "Unknown"
    }
    
    // 获取设备型号
    static var deviceModel: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let modelMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = modelMirror.children.compactMap { $0.value as? Int8 }.filter { $0 != 0 }.map { String(UnicodeScalar(UInt8($0))) }.joined()
        return mapToDevice(identifier: identifier)
    }
    
    // 将设备标识符映射到设备名称
    public static func mapToDevice(identifier: String) -> String {
        switch identifier {
        case "iPhone1,1": return "iPhone"
        case "iPhone1,2": return "iPhone 3G"
        case "iPhone2,1": return "iPhone 3GS"
        case "iPhone3,1": return "iPhone 4"
        case "iPhone3,2": return "iPhone 4 GSM Rev A"
        case "iPhone3,3": return "iPhone 4 CDMA"
        case "iPhone4,1": return "iPhone 4S"
        case "iPhone5,1": return "iPhone 5 (GSM)"
        case "iPhone5,2": return "iPhone 5 (GSM+CDMA)"
        case "iPhone5,3": return "iPhone 5C (GSM)"
        case "iPhone5,4": return "iPhone 5C (Global)"
        case "iPhone6,1": return "iPhone 5S (GSM)"
        case "iPhone6,2": return "iPhone 5S (Global)"
        case "iPhone7,1": return "iPhone 6 Plus"
        case "iPhone7,2": return "iPhone 6"
        case "iPhone8,1": return "iPhone 6s"
        case "iPhone8,2": return "iPhone 6s Plus"
        case "iPhone8,4": return "iPhone SE (GSM)"
        case "iPhone9,1": return "iPhone 7"
        case "iPhone9,2": return "iPhone 7 Plus"
        case "iPhone9,3": return "iPhone 7"
        case "iPhone9,4": return "iPhone 7 Plus"
        case "iPhone10,1": return "iPhone 8"
        case "iPhone10,2": return "iPhone 8 Plus"
        case "iPhone10,3": return "iPhone X Global"
        case "iPhone10,4": return "iPhone 8"
        case "iPhone10,5": return "iPhone 8 Plus"
        case "iPhone10,6": return "iPhone X GSM"
        case "iPhone11,2": return "iPhone XS"
        case "iPhone11,4": return "iPhone XS Max"
        case "iPhone11,6": return "iPhone XS Max Global"
        case "iPhone11,8": return "iPhone XR"
        case "iPhone12,1": return "iPhone 11"
        case "iPhone12,3": return "iPhone 11 Pro"
        case "iPhone12,5": return "iPhone 11 Pro Max"
        case "iPhone12,8": return "iPhone SE 2nd Gen"
        case "iPhone13,1": return "iPhone 12 Mini"
        case "iPhone13,2": return "iPhone 12"
        case "iPhone13,3": return "iPhone 12 Pro"
        case "iPhone13,4": return "iPhone 12 Pro Max"
        case "iPhone14,2": return "iPhone 13 Pro"
        case "iPhone14,3": return "iPhone 13 Pro Max"
        case "iPhone14,4": return "iPhone 13 Mini"
        case "iPhone14,5": return "iPhone 13"
        case "iPhone14,6": return "iPhone SE 3rd Gen"
        case "iPhone14,7": return "iPhone 14"
        case "iPhone14,8": return "iPhone 14 Plus"
        case "iPhone15,2": return "iPhone 14 Pro"
        case "iPhone15,3": return "iPhone 14 Pro Max"
        case "iPhone15,4": return "iPhone 15"
        case "iPhone15,5": return "iPhone 15 Plus"
        case "iPhone16,1": return "iPhone 15 Pro"
        case "iPhone16,2": return "iPhone 15 Pro Max"
            
        case "iPod1,1": return "1st Gen iPod"
        case "iPod2,1": return "2nd Gen iPod"
        case "iPod3,1": return "3rd Gen iPod"
        case "iPod4,1": return "4th Gen iPod"
        case "iPod5,1": return "5th Gen iPod"
        case "iPod7,1": return "6th Gen iPod"
        case "iPod9,1": return "7th Gen iPod"
            
        case "iPad1,1": return "iPad"
        case "iPad1,2": return "iPad 3G"
        case "iPad2,1": return "2nd Gen iPad"
        case "iPad2,2": return "2nd Gen iPad GSM"
        case "iPad2,3": return "2nd Gen iPad CDMA"
        case "iPad2,4": return "2nd Gen iPad New Revision"
        case "iPad3,1": return "3rd Gen iPad"
        case "iPad3,2": return "3rd Gen iPad CDMA"
        case "iPad3,3": return "3rd Gen iPad GSM"
        case "iPad2,5": return "iPad mini"
        case "iPad2,6": return "iPad mini GSM+LTE"
        case "iPad2,7": return "iPad mini CDMA+LTE"
        case "iPad3,4": return "4th Gen iPad"
        case "iPad3,5": return "4th Gen iPad GSM+LTE"
        case "iPad3,6": return "4th Gen iPad CDMA+LTE"
        case "iPad4,1": return "iPad Air (WiFi)"
        case "iPad4,2": return "iPad Air (GSM+CDMA)"
        case "iPad4,3": return "1st Gen iPad Air (China)"
        case "iPad4,4": return "iPad mini Retina (WiFi)"
        case "iPad4,5": return "iPad mini Retina (GSM+CDMA)"
        case "iPad4,6": return "iPad mini Retina (China)"
        case "iPad4,7": return "iPad mini 3 (WiFi)"
        case "iPad4,8": return "iPad mini 3 (GSM+CDMA)"
        case "iPad4,9": return "iPad Mini 3 (China)"
        case "iPad5,1": return "iPad mini 4 (WiFi)"
        case "iPad5,2": return "4th Gen iPad mini (WiFi+Cellular)"
        case "iPad5,3": return "iPad Air 2 (WiFi)"
        case "iPad5,4": return "iPad Air 2 (Cellular)"
        case "iPad6,3": return "iPad Pro (9.7 inch, WiFi)"
        case "iPad6,4": return "iPad Pro (9.7 inch, WiFi+LTE)"
        case "iPad6,7": return "iPad Pro (12.9 inch, WiFi)"
        case "iPad6,8": return "iPad Pro (12.9 inch, WiFi+LTE)"
        case "iPad6,11": return "iPad (2017)"
        case "iPad6,12": return "iPad (2017)"
        case "iPad7,1": return "iPad Pro 2nd Gen (WiFi)"
        case "iPad7,2": return "iPad Pro 2nd Gen (WiFi+Cellular)"
        case "iPad7,3": return "iPad Pro 10.5-inch 2nd Gen"
        case "iPad7,4": return "iPad Pro 10.5-inch 2nd Gen"
        case "iPad7,5": return "iPad 6th Gen (WiFi)"
        case "iPad7,6": return "iPad 6th Gen (WiFi+Cellular)"
        case "iPad7,11": return "iPad 7th Gen 10.2-inch (WiFi)"
        case "iPad7,12": return "iPad 7th Gen 10.2-inch (WiFi+Cellular)"
        case "iPad8,1": return "iPad Pro 11 inch 3rd Gen (WiFi)"
        case "iPad8,2": return "iPad Pro 11 inch 3rd Gen (1TB, WiFi)"
        case "iPad8,3": return "iPad Pro 11 inch 3rd Gen (WiFi+Cellular)"
        case "iPad8,4": return "iPad Pro 11 inch 3rd Gen (1TB, WiFi+Cellular)"
        case "iPad8,5": return "iPad Pro 12.9 inch 3rd Gen (WiFi)"
        case "iPad8,6": return "iPad Pro 12.9 inch 3rd Gen (1TB, WiFi)"
        case "iPad8,7": return "iPad Pro 12.9 inch 3rd Gen (WiFi+Cellular)"
        case "iPad8,8": return "iPad Pro 12.9 inch 3rd Gen (1TB, WiFi+Cellular)"
        case "iPad8,9": return "iPad Pro 11 inch 4th Gen (WiFi)"
        case "iPad8,10": return "iPad Pro 11 inch 4th Gen (WiFi+Cellular)"
        case "iPad8,11": return "iPad Pro 12.9 inch 4th Gen (WiFi)"
        case "iPad8,12": return "iPad Pro 12.9 inch 4th Gen (WiFi+Cellular)"
        case "iPad11,1": return "iPad mini 5th Gen (WiFi)"
        case "iPad11,2": return "iPad mini 5th Gen"
        case "iPad11,3": return "iPad Air 3rd Gen (WiFi)"
        case "iPad11,4": return "iPad Air 3rd Gen"
        case "iPad11,6": return "iPad 8th Gen (WiFi)"
        case "iPad11,7": return "iPad 8th Gen (WiFi+Cellular)"
        case "iPad12,1": return "iPad 9th Gen (WiFi)"
        case "iPad12,2": return "iPad 9th Gen (WiFi+Cellular)"
        case "iPad14,1": return "iPad mini 6th Gen (WiFi)"
        case "iPad14,2": return "iPad mini 6th Gen (WiFi+Cellular)"
        case "iPad13,1": return "iPad Air 4th Gen (WiFi)"
        case "iPad13,2": return "iPad Air 4th Gen (WiFi+Cellular)"
        case "iPad13,4": return "iPad Pro 11 inch 5th Gen"
        case "iPad13,5": return "iPad Pro 11 inch 5th Gen"
        case "iPad13,6": return "iPad Pro 11 inch 5th Gen"
        case "iPad13,7": return "iPad Pro 11 inch 5th Gen"
        case "iPad13,8": return "iPad Pro 12.9 inch 5th Gen"
        case "iPad13,9": return "iPad Pro 12.9 inch 5th Gen"
        case "iPad13,10": return "iPad Pro 12.9 inch 5th Gen"
        case "iPad13,11": return "iPad Pro 12.9 inch 5th Gen"
        case "iPad13,16": return "iPad Air 5th Gen (WiFi)"
        case "iPad13,17": return "iPad Air 5th Gen (WiFi+Cellular)"
        case "iPad13,18": return "iPad 10th Gen"
        case "iPad13,19": return "iPad 10th Gen"
        case "iPad14,3": return "iPad Pro 11 inch 4th Gen"
        case "iPad14,4": return "iPad Pro 11 inch 4th Gen"
        case "iPad14,5": return "iPad Pro 12.9 inch 6th Gen"
        case "iPad14,6": return "iPad Pro 12.9 inch 6th Gen"
        case "iPad14,8": return "iPad Air 6th Gen"
        case "iPad14,9": return "iPad Air 6th Gen"
        case "iPad14,10": return "iPad Air 7th Gen"
        case "iPad14,11": return "iPad Air 7th Gen"
        case "iPad16,3": return "iPad Pro 11 inch 5th Gen"
        case "iPad16,4": return "iPad Pro 11 inch 5th Gen"
        case "iPad16,5": return "iPad Pro 12.9 inch 7th Gen"
        case "iPad16,6": return "iPad Pro 12.9 inch 7th Gen"
        default: return identifier
        }
    }
}
