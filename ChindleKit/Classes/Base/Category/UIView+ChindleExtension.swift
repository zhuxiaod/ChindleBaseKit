//
//  UIView+ChindleExtension.swift
//  ChindleKit
//
//  Created by 朱𣇈丹 on 2023/3/9.
//

import Foundation
import Toast

extension UIView {
    
    //获取最上层页面
    public static func show(message: String) {
        
        guard let visibleVC = UIView.getCurrentVC() else {
            return
        }
        
        visibleVC.view .makeToast(message, duration: 2.0, position: CSToastPositionCenter)
    }
    
    public static func show(message: String, second: Double, completion: ((Bool) -> Void)! ) {
        
        guard let visibleVC = UIView.getCurrentVC() else {
            return
        }
        
        visibleVC.view.makeToast(message, duration: second , position: CSToastPositionCenter, title: message, image: nil, style: nil, completion: completion)
    }
        
//    public var masksToBounds: Bool {
//        get {
//            return layer.masksToBounds
//        }
//        set {
//            layer.masksToBounds = newValue
//        }
//    }
    
//    public var cornerRadius: CGFloat {
//        get {
//            return layer.cornerRadius
//        }
//        set {
//            layer.cornerRadius = newValue
//        }
//    }
    
//    public var cornerRadius: Int {
//        get {
//            return Int(layer.cornerRadius)
//        }
//        set {
//            layer.cornerRadius = CGFloat(newValue)
//        }
//    }
    
}

extension UIView {

    public static func getCurrentVC() -> UIViewController? {
        
        guard let rootViewController = UIApplication.shared.keyWindow?.rootViewController else {
            return nil
        }
         
        return UIView.findVisibleViewController(viewController: rootViewController)
    }
    
    public static func findVisibleViewController(viewController: UIViewController) -> UIViewController {
        /// UINavigationController
        if let navigationController = viewController as? UINavigationController,
           let visibleController = navigationController.visibleViewController
        {
            return findVisibleViewController(viewController: visibleController)
        }
        
        /// UITabBarController
        if let tabBarController = viewController as? UITabBarController,
           let selectedTabController = tabBarController.selectedViewController
        {
            return findVisibleViewController(viewController: selectedTabController)
        }
        
        /// PresentedViewController
        if let presentedViewController = viewController.presentedViewController {
            return findVisibleViewController(viewController: presentedViewController)
        }
        
        return viewController
    }

    public func snapshot() -> UIImage? {
        let scale: CGFloat = 2.0
        let size = self.bounds.size
        let percent = 750 / size.width
        UIGraphicsBeginImageContextWithOptions(CGSize(width: size.width * percent, height: size.height * percent), self.isOpaque, scale)
        self.drawHierarchy(in: CGRect(x: 0, y: 0, width: size.width * percent, height: size.height * percent), afterScreenUpdates: false)
        let snapshotImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return snapshotImage
    }
    
    
}

extension UIView {
    
    // 扩展UIView，添加一个方法来执行弹出动画
    public func popInFromBottom(withOffset offset: CGFloat, duration: TimeInterval, damping: CGFloat, velocity: CGFloat) {
        
        // 获取目标位置
        let startPosition = self.layer.position
        
        // 将初始位置设置在视图框架外
        self.layer.position = CGPoint(x: self.layer.position.x, y: self.layer.position.y + offset)
        
        UIView.animate(withDuration: duration,
                       delay: 0,
                       usingSpringWithDamping: damping,
                       initialSpringVelocity: velocity,
                       options: .curveEaseOut,
                       animations: {
            self.alpha = 1

            self.layer.position = startPosition
        }, completion: nil)
    }
    
    public func popOutToBottom(withOffset offset: CGFloat, duration: TimeInterval, damping: CGFloat, velocity: CGFloat, completion: (() -> Void)? = nil) {
        UIView.animate(withDuration: duration,
                       delay: 0,
                       usingSpringWithDamping: damping,
                       initialSpringVelocity: velocity,
                       options: .curveEaseIn,
                       animations: {
            // 将视图移动到视图框架外
            self.snp.updateConstraints { make in
                make.bottom.equalTo(self.superview!).offset(offset)
            }
            self.alpha = 0
            self.superview?.layoutIfNeeded()
        }, completion: { finished in
            // 完成动画后可以选择将视图从父视图中移除
            self.removeFromSuperview()
            completion?()
        })
    }
}
