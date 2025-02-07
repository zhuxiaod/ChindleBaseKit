//
//  String+ChindleExtension.swift
//  ChindleKit
//
//  Created by 朱𣇈丹 on 2023/3/9.
//

import Foundation

public enum ChindleImagePosition {
    
    case top
    case center
    case bottom
    case left
    case right
}

public extension UIButton {
    
    func setButtonImage(image: UIImage?, buttonSize: CGSize, imageSize: CGSize, position: ChindleImagePosition = .center) {
        guard let image = image else { return }
        
        // 设置按钮的图片
        self.setImage(image, for: .normal)
        
        // 计算图片的边距
        let verticalInset = (buttonSize.height - imageSize.height) / 2
        let horizontalInset = (buttonSize.width - imageSize.width) / 2
        
        switch position {
        case .top:
            self.imageEdgeInsets = UIEdgeInsets(top: -verticalInset, left: -horizontalInset, bottom: verticalInset, right: horizontalInset)
        case .center:
            self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        case .bottom:
            self.imageEdgeInsets = UIEdgeInsets(top: verticalInset, left: -horizontalInset, bottom: -verticalInset, right: horizontalInset)
        case .left:
            self.imageEdgeInsets = UIEdgeInsets(top: -verticalInset, left: -horizontalInset, bottom: verticalInset, right: horizontalInset)
        case .right:
            self.imageEdgeInsets = UIEdgeInsets(top: -verticalInset, left: horizontalInset, bottom: verticalInset, right: -horizontalInset)
        }
        
        // 确保按钮的内容边距不会影响图片显示
        self.contentEdgeInsets = UIEdgeInsets(top: verticalInset, left: horizontalInset, bottom: verticalInset, right: horizontalInset)
        
        // 更新按钮的尺寸
        self.frame.size = buttonSize
    }
}
