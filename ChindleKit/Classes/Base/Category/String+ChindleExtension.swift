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
