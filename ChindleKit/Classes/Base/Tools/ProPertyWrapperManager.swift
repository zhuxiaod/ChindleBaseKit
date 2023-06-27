//
//  UserDefault.swift
//  NewDemo
//
//  Created by MissSunRise on 2022/3/5.
//

import Foundation

//快捷添加一个UserDefaults

@propertyWrapper
public struct UserDefaultWrapper<T> {
    public let key: String
    public let defaultValue: T
    
    public var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
    
    public init(_ key: String, defaultValue: T) {
        UserDefaults.standard.register(defaults: [key: defaultValue])
        
        self.key = key
        self.defaultValue = defaultValue
    }
}



//快速添加一个颜色属性
@propertyWrapper
public struct RGBColorWrapper {
    private var r: CGFloat
    private var g: CGFloat
    private var b: CGFloat
    private var alpha: CGFloat
    
    public var wrappedValue: UIColor { UIColor.init(red: r, green: g, blue: b, alpha: alpha) }
    
    public init(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ alpha: CGFloat = 1) {
        self.r = r / 255
        self.g = g / 255
        self.b = b / 255
        self.alpha = alpha
    }
}

// 用法
//struct Color {
//    @RGBColorWrapper(255, 0, 0)
//    static var redRed: UIColor
//}
