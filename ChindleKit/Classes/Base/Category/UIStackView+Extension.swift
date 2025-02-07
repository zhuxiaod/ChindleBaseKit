//
//  UIStackView+Extension.swift
//  StackViewDemo
//
//  Created by caohanchao on 2022/9/15.
//

import UIKit
import Then

// MARK: UIStackView扩展
extension UIStackView {
    
    /// 便捷初始化方法
    public convenience init(
        arrangedSubviews: [UIView],
        axis: NSLayoutConstraint.Axis,
        spacing: CGFloat = 0.0,
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fill) {

        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
    }
    
    /// 添加管理视图
    public func addArrangedSubviews(_ views: [UIView]) {
        for view in views {
            addArrangedSubview(view)
        }
    }
    
    /// 添加管理视图 并且 设置约束
    public func addArrangedSubviews(_ views: [UIView], makeConstraint:() -> (Void))  {
        makeConstraint()
        for view in views {
            addArrangedSubview(view)
            view.makeConstraint()
        }
    }
    
    /// 移除管理视图
    public func qd_removeArrangedSubviews() {
        
        for view in arrangedSubviews {
            removeArrangedSubview(view)
        }
        
    }
    
    /// 生成一个指定间隔的填充区域
    public func spacer(_ space: CGFloat) -> UIView {
        let spacer = UIView().then {
            switch self.axis {
            case .horizontal:
                $0.widthConstraint = space
            case .vertical:
                $0.heightConstraint = space
            default:
                break
            }
        }
        return spacer
    }
    
    /// 生成一个填充区域
    public func spacer() -> UIView {
        let spacer = UIView()
        return spacer
    }
}

// MARK: HStack
public class HStack: UIStackView {
    public convenience init (
        spacing: CGFloat = 0.0,
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fill) {

        self.init(arrangedSubviews: [], axis: .horizontal, spacing: spacing, alignment:alignment, distribution: distribution)

    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.axis = .horizontal
        self.spacing = 0.0
        self.alignment = .fill
        self.distribution = .fill
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: VStack
public class VStack: UIStackView {
    /// 便捷初始化方法
    public convenience init (
        spacing: CGFloat = 0.0,
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fill) {
            
        self.init(arrangedSubviews: [], axis: .vertical, spacing: spacing, alignment:alignment, distribution: distribution)
            
            print("axis:\(axis)")
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.axis = .vertical
        self.spacing = 0.0
        self.alignment = .fill
        self.distribution = .fill
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private var widthConstraintKey = "widthConstraintKey"
private var heightConstraintKey = "heightConstraintKey"
private var sizeConstraintKey = "sizeConstraintKey"

// MARK: UIView支持StackView的扩展
extension UIView {
    /// 宽度约束量
    public var widthConstraint: CGFloat {
        get {
            return objc_getAssociatedObject(self, &widthConstraintKey) as? CGFloat ?? 0
        }
        set {
            objc_setAssociatedObject(self, &widthConstraintKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    /// 高度约束量
    public var heightConstraint: CGFloat {
        get {
            return objc_getAssociatedObject(self, &heightConstraintKey) as? CGFloat ?? 0
        }
        set {
            objc_setAssociatedObject(self, &heightConstraintKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    /// 尺寸约束量
    public var sizeConstraint: CGSize {
        get {
            return objc_getAssociatedObject(self, &sizeConstraintKey) as? CGSize ?? .zero
        }
        set {
            objc_setAssociatedObject(self, &sizeConstraintKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    /// 根据设置约束
    public func makeConstraint() {
        if (widthConstraint > 0) { makeWidthConstraint(widthConstraint) }
        
        if (heightConstraint > 0) { makeHeightConstraint(heightConstraint) }
        
        if (sizeConstraint.width > 0 || sizeConstraint.height > 0) {
            makeWidthConstraint(sizeConstraint.width)
            makeHeightConstraint(sizeConstraint.height)
        }
    }
    
    /// 设置高度约束
    public func makeHeightConstraint(_ height: CGFloat) {
        let heightCons = NSLayoutConstraint.init(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: height)
        NSLayoutConstraint.activate([heightCons])
    }
    
    /// 设置宽度约束
    public func makeWidthConstraint(_ width: CGFloat) {
        let widthCons = NSLayoutConstraint.init(item: self, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: width)
        NSLayoutConstraint.activate([widthCons])
    }

}
