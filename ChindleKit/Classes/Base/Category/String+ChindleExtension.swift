//
//  String+ChindleExtension.swift
//  ChindleKit
//
//  Created by 朱𣇈丹 on 2023/3/9.
//

import Foundation

extension String {
    
    //判断是不是邮箱登录
    public func isValidateEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with:self)
    }
    
    //判断是不是手机号
    public func isMobile() -> Bool {
        
        let trueMobile = self
        
        if trueMobile.count > 0 {
            let mobileReg = "\\d{11}"
            let regextestmobile = NSPredicate(format: "SELF MATCHES %@",mobileReg)
            return regextestmobile.evaluate(with: trueMobile);
        }
        return false
    }
    
    ///手机号码分割 3 4 4
    public func formatPhoneNum() -> String {
        
        var phone = self.replacingOccurrences(of: " ", with: "")
        
        switch phone.count {
            
        case 4...7:
            phone.insert(" ", at: phone.index(phone.startIndex, offsetBy: 3))
            
        case 8...11:
            phone.insert(" ", at: phone.index(phone.startIndex, offsetBy: 7))
            phone.insert(" ", at: phone.index(phone.startIndex, offsetBy: 3))
            
        default:
            break
            
        }
        
        return phone
    }
    
    public func maskPhoneNumber() -> String {
        if self.count == 11 {
            let startIndex = self.index(self.startIndex, offsetBy: 3)
            let endIndex = self.index(self.startIndex, offsetBy: 7)
            let maskedSubstring = self[startIndex..<endIndex]
            let maskedNumber = self.replacingCharacters(in: startIndex..<endIndex, with: String(repeating: "*", count: maskedSubstring.count))
            return maskedNumber
        } else {
            return self
        }
    }
    
}

extension String {
    //富文本使用 输入字符 返回NSRange
    public func nsRange(of substring: String) -> NSRange? {
        guard let range = self.range(of: substring) else {
            return nil
        }
        let utf16view = self.utf16
        let from = range.lowerBound.samePosition(in: utf16view)!
        let to = range.upperBound.samePosition(in: utf16view)!
        let location = utf16view.distance(from: utf16view.startIndex, to: from)
        let length = utf16view.distance(from: from, to: to)
        return NSRange(location: location, length: length)
    }
}

extension String {
    public func size(withFont font: UIFont) -> CGSize {
        let attributes = [NSAttributedString.Key.font: font]
        return (self as NSString).size(withAttributes: attributes)
    }
    
    //计算文字高度
    public func heightForString(withFont font: UIFont, maxWidth: CGFloat) -> CGFloat {
        let size = CGSize(width: maxWidth, height: .greatestFiniteMagnitude)
        let options: NSStringDrawingOptions = [.usesLineFragmentOrigin, .usesFontLeading]
        let attributes = [NSAttributedString.Key.font: font]
        
        let boundingRect = self.boundingRect(with: size, options: options, attributes: attributes, context: nil)
        
        return ceil(boundingRect.height)
    }
    
    /// 判断文字是否超过两行
    /// - Parameter width: UILabel 的宽度
    /// - Returns: 是否超过两行
    public func isTextOverTwoLines(width: CGFloat, font: UIFont) -> Bool {
        
        // 设置最大宽度和计算所需的尺寸
        let maxSize = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let textHeight = (self as NSString).boundingRect(
            with: maxSize,
            options: .usesLineFragmentOrigin,
            attributes: [.font: font],
            context: nil
        ).height
        
        // 计算单行文字的高度
        let singleLineHeight = font.lineHeight
        
        // 如果所需高度大于单行高度的两倍，则说明是两行或更多
        return textHeight > singleLineHeight * 2
    }
}


