//
//  UIColor+TesExtension.swift
//  ChindleKit
//
//  Created by 朱𣇈丹 on 2023/9/5.
//

import Foundation

import UIKit

/**
渐变方式

- XDGradientChangeDirectionLevel:              水平渐变
- XDGradientChangeDirectionVertical:           竖直渐变
- XDGradientChangeDirectionUpwardDiagonalLine: 向下对角线渐变
- XDGradientChangeDirectionDownDiagonalLine:   向上对角线渐变
*/
public enum XDGradientChangeDirection {
    case level
    case vertical
    case upwardDiagonalLine
    case downDiagonalLine
}

extension UIColor {
    
    public static func gradientChange(size: CGSize, direction: XDGradientChangeDirection, startColor: UIColor, endColor: UIColor) -> UIColor? {
        if size == CGSize.zero || startColor.cgColor === nil || endColor.cgColor === nil {
            return nil
        }
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        
        var startPoint = CGPoint.zero
        if direction == .downDiagonalLine {
            startPoint = CGPoint(x: 0.0, y: 1.0)
        }
        gradientLayer.startPoint = startPoint
        
        var endPoint = CGPoint.zero
        switch direction {
        case .level:
            endPoint = CGPoint(x: 1.0, y: 0.0)
        case .vertical:
            endPoint = CGPoint(x: 0.0, y: 1.0)
        case .upwardDiagonalLine:
            endPoint = CGPoint(x: 1.0, y: 1.0)
        case .downDiagonalLine:
            endPoint = CGPoint(x: 1.0, y: 0.0)
        }
        gradientLayer.endPoint = endPoint
        
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        
        UIGraphicsBeginImageContext(size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return UIColor(patternImage: image!)
    }
}
