//
//  Currency+Extension.swift
//  ChindleKit
//
//  Created by 朱𣇈丹 on 2023/7/20.
//

import Foundation

extension Double {
    
    public func toCurrencyString() -> String {
        
        let decimalNumber = Decimal(self)
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 0
        return formatter.string(from: NSDecimalNumber(decimal: decimalNumber)) ?? "\(self)"
        
    }
}



