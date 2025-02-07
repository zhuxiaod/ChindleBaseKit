//
//  UITextView+Extension.swift
//  ChindleKit
//
//  Created by 朱𣇈丹 on 2024/7/4.
//

import Foundation

extension UITextView {
    
    public func numberOfLines() -> Int {
        let layoutManager = self.layoutManager
        var numberOfLines = 0
        var index = 0
        let numberOfGlyphs = layoutManager.numberOfGlyphs
        var lineRange = NSRange(location: 0, length: 0)
        
        while index < numberOfGlyphs {
            layoutManager.lineFragmentRect(forGlyphAt: index, effectiveRange: &lineRange)
            index = NSMaxRange(lineRange)
            numberOfLines += 1
        }
        
        return numberOfLines
    }
    
}


