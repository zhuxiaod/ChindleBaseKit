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
    public var xd_cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = xd_cornerRadius
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

public class DottedSeparatorView: UIView {
    
    var segmentHeight: CGFloat = 1.0
    var segmentWidth: CGFloat = 5.0
    var segmentGap: CGFloat = 3.0
    var strokeColor = UIColor.lightGray

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.backgroundColor = UIColor.white
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.setLineWidth(segmentHeight)
        context.setStrokeColor(strokeColor.cgColor)
        
        let dashPattern: [CGFloat] = [segmentWidth, segmentGap]
        
        context.setLineDash(phase: 0, lengths: dashPattern)
        
        context.move(to: CGPoint(x: 0, y: rect.height / 2))
        context.addLine(to: CGPoint(x: rect.width, y: rect.height / 2))
        
        context.strokePath()
    }
    
    public func configure(segmentHeight: CGFloat, segmentWidth: CGFloat, segmentGap: CGFloat,strokeColor: UIColor) {
        self.segmentHeight = segmentHeight
        self.segmentWidth = segmentWidth
        self.segmentGap = segmentGap
        self.strokeColor = strokeColor

        setNeedsDisplay()  // 重新绘制视图
    }
}
