//
//  UILabel+ViewHeight.swift
//  ChindleKit
//
//  Created by 朱𣇈丹 on 2024/5/20.
//

import Foundation
import YYKit

//Label计算高度
extension UILabel {
    
    public func heightForText(width: CGFloat) -> CGFloat {
        guard let text = self.text, !text.isEmpty else {
            return 0
        }
        
        let maxSize = CGSize(width: width, height: CGFloat(MAXFLOAT))
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        let attributes = [NSAttributedString.Key.font: self.font]
        
        let boundingRect = text.boundingRect(with: maxSize, options: options, attributes: attributes as [NSAttributedString.Key : Any], context: nil)
        
        return ceil(boundingRect.height)
    }

    public func heightForText(width: CGFloat, lineHeight: CGFloat? = nil) -> CGFloat {
        guard let text = self.text, !text.isEmpty else {
            return 0
        }
        
        let maxSize = CGSize(width: width, height: CGFloat(MAXFLOAT))
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        
        var attributes = [NSAttributedString.Key: Any]()
        attributes[.font] = self.font
        
        if let lineHeight = lineHeight {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.minimumLineHeight = lineHeight
            attributes[.paragraphStyle] = paragraphStyle
        }
        
        let boundingRect = text.boundingRect(with: maxSize, options: options, attributes: attributes, context: nil)
        
        return ceil(boundingRect.height)
    }
    
    
}



extension YYLabel {
    
    public func heightForText(width: CGFloat) -> CGFloat {
        
        guard let text = self.attributedText, ((self.attributedText?.string.isEmpty) == false) else {
            return 0
        }
        
        let maxSize = CGSize(width: width, height: CGFloat(MAXFLOAT))

        let layout = YYTextLayout(containerSize: maxSize, text: self.attributedText ?? NSAttributedString(string: ""))
        
        return layout?.textBoundingSize.height ?? 0.0
    }
    
}

