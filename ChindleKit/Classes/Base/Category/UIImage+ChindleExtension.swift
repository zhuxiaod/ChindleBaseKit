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

extension UIImage {
    
    public func resized(to newSize: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(newSize, false, UIScreen.main.scale)
        defer { UIGraphicsEndImageContext() }
        
        draw(in: CGRect(origin: .zero, size: newSize))
        
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    //Base64转图片
    public class func corver(imageBase64 imageStr: String) -> UIImage? {
        guard let data = Data.init(base64Encoded: imageStr, options: Data.Base64DecodingOptions.ignoreUnknownCharacters) else {
            return nil
        }
        
        let image = UIImage.init(data: data)
        return image
    }
    
    //图片转Base64
    public class func corver(image: UIImage) -> String? {
        guard let imgData = UIImage.jpegData(image)(compressionQuality: 1.0) else {
            return nil
        }
        
        let base64 = imgData.base64EncodedString(options: [])
        return base64
    }
}

extension UIImage {
    
    // 根据给定的宽度计算等比例的高度
    // 根据给定的宽度计算等比例的尺寸
    public func resizedDimensions(forWidth targetWidth: CGFloat) -> CGSize {
        // 获取图片的原始宽度和高度
        let originalWidth = self.size.width
        let originalHeight = self.size.height
        
        // 计算纵横比 (高 / 宽)
        let aspectRatio = originalHeight / originalWidth
        
        // 根据目标宽度计算等比例的高度
        let resizedHeight = targetWidth * aspectRatio
        
        // 返回新的尺寸
        return CGSize(width: targetWidth, height: resizedHeight)
    }
    
    // 根据给定的高度计算等比例的尺寸
    public func resizedDimensions(forHeight targetHeight: CGFloat) -> CGSize {
        // 获取图片的原始宽度和高度
        let originalWidth = self.size.width
        let originalHeight = self.size.height
        
        // 计算纵横比 (宽 / 高)
        let aspectRatio = originalWidth / originalHeight
        
        // 根据目标高度计算等比例的宽度
        let resizedWidth = targetHeight * aspectRatio
        
        // 返回新的尺寸
        return CGSize(width: resizedWidth, height: targetHeight)
    }
}
