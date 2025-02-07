//
//  NSAttributedString+ChindleExtension.swift
//  ChindleKit
//
//  Created by 朱𣇈丹 on 2023/6/21.
//

import Foundation

extension NSAttributedString {
    
    public func add(lineHeight: CGFloat,alignment: NSTextAlignment = .left) -> NSAttributedString {
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineHeight
        
        paragraphStyle.alignment = alignment
        
        let mutableAttriString = NSMutableAttributedString(attributedString: self)
        let range = NSRange(location: 0, length: self.length)
        
        mutableAttriString.addAttribute(.paragraphStyle, value: paragraphStyle, range: range)
        
        return mutableAttriString
    }
}

extension NSAttributedString {
    
    public func calculateHeight(withConstrainedWidth width: CGFloat, lineSpacing: CGFloat? = nil) -> CGFloat {
        
        let size = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        
        let options: NSStringDrawingOptions = [.usesLineFragmentOrigin, .usesFontLeading]
        
        var attributes: [NSAttributedString.Key: Any] = [:]
        if let lineSpacing = lineSpacing {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = lineSpacing
            attributes[.paragraphStyle] = paragraphStyle
        }
        
        let boundingRect = self.boundingRect(with: size, options: options, context: nil)

        return ceil(boundingRect.height)
    }
    
    public func calculateAttributedTextHeight(text: String, width: CGFloat, font: UIFont, lineHeight: CGFloat) -> CGFloat {
        // 创建段落样式并设置行高
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineHeight
//        paragraphStyle.maximumLineHeight = lineHeight
        
        // 创建富文本属性
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .paragraphStyle: paragraphStyle
        ]
        
        // 创建富文本
        let attributedText = NSAttributedString(string: text, attributes: attributes)
        
        // 计算富文本的边界矩形
        let boundingRect = attributedText.boundingRect(
            with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude),
            options: [.usesLineFragmentOrigin, .usesFontLeading],
            context: nil
        )
        
        // 返回计算出的高度，四舍五入取整
        return ceil(boundingRect.height)
    }
    
}

extension NSAttributedString {
    
    public func bold() -> NSAttributedString {
        let mutableAttributedString = NSMutableAttributedString(attributedString: self)
        
        let range = NSRange(location: 0, length: mutableAttributedString.length)
        mutableAttributedString.enumerateAttributes(in: range, options: .longestEffectiveRangeNotRequired) { (attributes, range, _) in
            if let font = attributes[.font] as? UIFont {
                let boldFont = UIFont.boldSystemFont(ofSize: font.pointSize)
                mutableAttributedString.addAttribute(.font, value: boldFont, range: range)
            }
        }
        
        return mutableAttributedString
    }
    
    public func applyHorizontalOffset(at range: NSRange, offset: CGFloat) -> NSAttributedString {
        guard let mutableAttributedString = self.mutableCopy() as? NSMutableAttributedString else {
            return self
        }
        
        guard range.location < mutableAttributedString.length else {
            return self
        }
        mutableAttributedString.enumerateAttributes(in: range, options: []) { (attributes, range, _) in
            var modifiedAttributes = attributes
            let existingOffset = attributes[.baselineOffset] as? NSNumber ?? NSNumber(value: 0)
            let modifiedOffset = existingOffset.floatValue + Float(offset)
            modifiedAttributes[.baselineOffset] = NSNumber(value: modifiedOffset)
            mutableAttributedString.addAttributes(modifiedAttributes, range: range)
        }
        
        return mutableAttributedString.copy() as! NSAttributedString
    }
    
    public func applyColor(color: UIColor) -> NSAttributedString {
        let mutableAttributedString = NSMutableAttributedString(attributedString: self)
        
        mutableAttributedString.enumerateAttributes(in: NSRange(location: 0, length: mutableAttributedString.length), options: []) { (attributes, range, _) in
            var modifiedAttributes = attributes
            modifiedAttributes[.foregroundColor] = color
            mutableAttributedString.setAttributes(modifiedAttributes, range: range)
        }
        
        return mutableAttributedString.copy() as! NSAttributedString
    }
    
    
}

extension NSAttributedString {
    
    //匹配字符串改变颜色和字体
    public func applyColorAndFont(toText searchText: String, color: UIColor, font: UIFont) -> NSAttributedString {
        let mutableAttributedString = NSMutableAttributedString(attributedString: self)
        let string = self.string as NSString
        let range = string.range(of: searchText)
        
        if range.location != NSNotFound {
            mutableAttributedString.addAttribute(.foregroundColor, value: color, range: range)
            mutableAttributedString.addAttribute(.font, value: font, range: range)
        }
        
        return NSAttributedString(attributedString: mutableAttributedString)
    }
    
    public static func attributedString(withText text: String, color: UIColor, font: UIFont) -> NSAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: color,
            .font: font
        ]
        return NSAttributedString(string: text, attributes: attributes)
    }
}

