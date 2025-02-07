//
//  File.swift
//  ChindleKit
//
//  Created by 朱𣇈丹 on 2024/12/9.
//

import Foundation
import UIKit
import AudioToolbox

public class VibrationHelper {
    
    // MARK: - 震动反馈类型
    
    // 轻微震动
    public static func light() {
        if #available(iOS 10.0, *) {
            let feedbackGenerator = UIImpactFeedbackGenerator(style: .light)
            feedbackGenerator.prepare()
            feedbackGenerator.impactOccurred()
        } else {
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        }
    }
    
    // 中等震动
    public static func medium() {
        if #available(iOS 10.0, *) {
            let feedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
            feedbackGenerator.prepare()
            feedbackGenerator.impactOccurred()
        } else {
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        }
    }
    
    // 强烈震动
    public static func heavy() {
        if #available(iOS 10.0, *) {
            let feedbackGenerator = UIImpactFeedbackGenerator(style: .heavy)
            feedbackGenerator.prepare()
            feedbackGenerator.impactOccurred()
        } else {
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        }
    }
    
    // 选择反馈
    public static func selectionChanged() {
        if #available(iOS 10.0, *) {
            let feedbackGenerator = UISelectionFeedbackGenerator()
            feedbackGenerator.prepare()
            feedbackGenerator.selectionChanged()
        } else {
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        }
    }
    
    // 触发震动 (使用系统默认震动)
    public static func triggerVibration() {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
    
    // MARK: - 简单调用示例
    // 触发轻微震动
    public static func triggerLightVibration() {
        light()
    }
    
    // 触发中等震动
    public static func triggerMediumVibration() {
        medium()
    }
    
    // 触发强烈震动
    public static func triggerHeavyVibration() {
        heavy()
    }
    
    // 触发选择震动
    public static func triggerSelectionVibration() {
        selectionChanged()
    }
}
