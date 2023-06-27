//
//  AvatarView.swift
//  ChindleKit
//
//  Created by 朱𣇈丹 on 2023/5/12.
//

import Foundation
import UIKit
import SnapKit

open class AvatarView: UIView {
    
    public var imageView: UIImageView!
    
    // 设置默认头像
    public var defaultImage: UIImage? {
        didSet {
            if let defaultImage = defaultImage {
                imageView.image = defaultImage
            }
        }
    }
    
    // 头像图片
    public var image: UIImage? {
        didSet {
            if let image = image {
                imageView.image = image
            } else {
                imageView.image = defaultImage
            }
        }
    }
    
    // 圆角半径
    public var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
        }
    }
    
    // 边框宽度
    public var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    // 边框颜色
    public var borderColor: UIColor? {
        didSet {
            if let borderColor = borderColor {
                layer.borderColor = borderColor.cgColor
            }
        }
    }
    
    // 初始化
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    // 初始化
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupUI()
    }
    
    // 设置UI
    private func setupUI() {
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
 
}
