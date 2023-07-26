//
//  UIImage+ChindleExtension.swift
//  ChindleKit
//
//  Created by 朱𣇈丹 on 2023/2/22.
//

import Foundation

extension UIImage {
    
    //根据颜色返回图片2
    public convenience init?(color: UIColor, size: CGSize = CGSize(width: 10, height: 10)) {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        
        self.init(cgImage:(UIGraphicsGetImageFromCurrentImageContext()?.cgImage!)!)
        UIGraphicsEndImageContext()
    }
    
    //base64转图片
    public convenience init?(qd_base64String: String) {
        guard let url = URL(string: qd_base64String) else {
            return nil
        }
        guard let imageData = try? Data(contentsOf: url) else {
            return nil
        }
        self.init(data: imageData)
    }
    
    //图片转data
    public func compressedData(quality: CGFloat = 0.5) -> Data? {
        return jpegData(compressionQuality: quality)
    }
    
    //获取项目内图片
    public convenience init?(bundleName: String) {
        guard let bundlePath = Bundle.main.path(forResource: bundleName, ofType: "png") else {
            return nil
        }
        
        self.init(contentsOfFile: bundlePath)
    }
    
}

extension UIImage {
    public func scalePreservingAspectRatio(targetSize: CGSize) -> UIImage? {
        let size = self.size
        
        let widthRatio = targetSize.width / size.width
        let heightRatio = targetSize.height / size.height
        let scaleFactor = max(widthRatio, heightRatio)
        
        let scaledSize = CGSize(width: size.width * scaleFactor, height: size.height * scaleFactor)
        let renderer = UIGraphicsImageRenderer(size: scaledSize)
        
        let scaledImage = renderer.image { _ in
            self.draw(in: CGRect(origin: .zero, size: scaledSize))
        }
        
        return scaledImage.withRenderingMode(renderingMode)
    }
}
