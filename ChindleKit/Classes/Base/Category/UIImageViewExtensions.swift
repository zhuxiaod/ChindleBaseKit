//
//  Avatar.swift
//  DesignKit
//
//  Created by Jake Lin on 20/10/20.
//

import UIKit

//public extension UIImageView {
//    
//    @objc func asAvatar(cornerRadius: CGFloat = 4) {
//        clipsToBounds = true
//        layer.cornerRadius = cornerRadius
//    }
//}

public extension UIView {
    
    func asAvatar(cornerRadius: CGFloat = 4) {
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
    }
}

extension UIImageView {
    
    /// 根据值从白色渐变为黑色并设置到图片上
    /// - Parameter value: 值范围从 0 到 1, 0 表示白色, 1 表示黑色
    public func setImageColor(for value: CGFloat) {
        // 确保值在 0 到 1 之间
        let clampedValue = min(max(value, 0), 1)
        
        // 混合白色到黑色的RGB
        let red = 1 - clampedValue
        let green = 1 - clampedValue
        let blue = 1 - clampedValue
        
        // 生成渐变颜色
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        
        // 确保图片为模板模式以支持颜色渲染
        if let originalImage = self.image?.withRenderingMode(.alwaysTemplate) {
            self.image = originalImage
            self.tintColor = color
        }
    }
}

