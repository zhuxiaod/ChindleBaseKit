//
//  Avatar.swift
//  DesignKit
//
//  Created by Jake Lin on 20/10/20.
//

import UIKit

//public extension UIImageView {
//    
//    @objc func asAvatar(cornerRadius: CGFloat = 4) {
//        clipsToBounds = true
//        layer.cornerRadius = cornerRadius
//    }
//}

public extension UIView {
    
    func asAvatar(cornerRadius: CGFloat = 4) {
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
    }
}
