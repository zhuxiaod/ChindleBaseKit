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
