//
//  ScreenConstant.swift
//  ChindleKit
//
//  Created by 朱𣇈丹 on 2023/3/7.
//

import Foundation

public let cScreenWidth = UIScreen.main.bounds.width
public let cScreenHeight = UIScreen.main.bounds.height

public let cStatusBarHeight: CGFloat = {
    /// 顶部状态栏高度
    var statusBarHeight: CGFloat = 0
    
    if #available( iOS 13.0, *) {
        let scene = UIApplication.shared.connectedScenes.first
        guard let windowScene = scene as? UIWindowScene else { return 0 }
        guard let statusBarManager = windowScene.statusBarManager else { return 0 }
        statusBarHeight = statusBarManager.statusBarFrame.height
    } else {
        statusBarHeight = UIApplication.shared.statusBarFrame.height
        
    }
    return statusBarHeight
}()

public let cNavigationBarHeight: CGFloat = 44.0
    
public let cTabBarHeight: CGFloat = 49.0

/// 底部安全区高度Inset距离
public let cSafeAreaBottomInset: CGFloat = {
    
    if #available(iOS 13.0, *) {
        let scene = UIApplication.shared.connectedScenes.first
        guard let windowScene = scene as? UIWindowScene else { return 0 }
        guard let window = windowScene.windows.first else { return 0 }
        return window.safeAreaInsets.bottom
        
    } else if #available(iOS 11.0, *) {
        
        guard let window = UIApplication.shared.windows.first else { return 0 }
        return window.safeAreaInsets.bottom
    }
    
    return 0
}()

/// 顶部安全区Inset距离
public let cSafeAreaTopInset: CGFloat = {
    
    if #available(iOS 13.0, *) {
        let scene = UIApplication.shared.connectedScenes.first
        guard let windowScene = scene as? UIWindowScene else { return 0 }
        guard let window = windowScene.windows.first else { return 0 }
        return window.safeAreaInsets.top
    } else if #available(iOS 11.0, *) {
        guard let window = UIApplication.shared.windows.first else { return 0 }
        return window.safeAreaInsets.top
    }
    return 0;
}()

extension UIViewController {
    
//    public func kTabBarHeight() -> CGFloat {
//        self.tabBarController?.tabBar.frame.size.height ?? 0.0
//    }
//
//    public func navigationBarHeight() -> CGFloat {
//        self.navigationController?.navigationBar.frame.size.height ?? 0.0
//    }

}

