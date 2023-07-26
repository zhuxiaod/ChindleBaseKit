//
//  NSAttributedString+ChindleExtension.swift
//  ChindleKit
//
//  Created by 朱𣇈丹 on 2023/6/21.
//

import Foundation

extension NSAttributedString {
    
    public func add(lineHeight: CGFloat) -> NSAttributedString {
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineHeight
        
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

