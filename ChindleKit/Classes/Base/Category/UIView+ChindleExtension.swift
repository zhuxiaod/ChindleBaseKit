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
