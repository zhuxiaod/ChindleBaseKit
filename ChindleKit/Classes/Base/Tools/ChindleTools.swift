//
//  CommonTools.swift
//  SaaSSchool
//
//  Created by mac on 2022/2/8.
//  Copyright © 2022 青豆教育. All rights reserved.
//

import Foundation

public class ChindleTools {
    
    // MARK: 字符串转字典
    public static func stringValueDic(_ str: String) -> [String : Any]?{
        
        let data = str.data(using: String.Encoding.utf8)
        
        if let dict = try? JSONSerialization.jsonObject(with: data!,
                                                        options: .mutableContainers) as? [String : Any] {
            return dict
        }
                
        return nil
    }
    
    static func convertViewToImage(convertView: UIView) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(convertView.bounds.size, false, 0)
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        convertView.layer.render(in: context)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img
    }
    
    
    func jsonToData(jsonDic:Dictionary<String, Any>) -> Data? {
        
        if (!JSONSerialization.isValidJSONObject(jsonDic)) {
            
            print("is not a valid json object")
            
            return nil
            
        }
        
        //利用自带的json库转换成Data
        
        //如果设置options为JSONSerialization.WritingOptions.prettyPrinted，则打印格式更好阅读
        
        let data = try? JSONSerialization.data(withJSONObject: jsonDic, options: [])
        
        //Data转换成String打印输出
        
        let str = String(data:data!, encoding: String.Encoding.utf8)
        
        //输出json字符串
        
//        print("Json Str:\(str!)")
        
        return data
        
    }
    
    func dataToDictionary(data:Data) ->Dictionary<String, Any>?{
        
        do{
            
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            
            let dic = json as! Dictionary<String, Any>
            
            return dic
            
        }catch _ {
            
            print("失败")
            
            return nil
            
        }
        
    }
    
    /** json 字符串数组*/
    func getArrayFromJSONString(jsonString:String) ->Array<Any>{
        
        let jsonData:Data = jsonString.data(using: .utf8)!
        
        let array = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        
        if array == nil {
            return Array()
        }
        if array != nil {
            return array as! Array
        }
        return array as! Array
        
    }
    
    //UUID
//    func getUUID() -> String{
//
//        let keychain = Keychain(service: SDKConfig.uuidSever)
//        var uuid:String = ""
//        do {
//            uuid = try keychain.get(SDKConfig.uuidString) ?? ""
//        }
//        catch let error {
//            print(error)
//        }
//        if uuid.isEmpty {
//            uuid = UUID().uuidString
//            do {
//                try keychain.set(uuid, key: SDKConfig.uuidString)
//            }
//            catch let error {
//                print(error)
//                uuid = ""
//            }
//        }
//        return uuid
//    }

    
    public static func getAppVersion() -> String? {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    //格式化钱字符串的显示
    public static func formatMoneyStr(currency: String, amount: String, currencyFontSize: CGFloat, amountFontSize: CGFloat) -> NSAttributedString {
        // 创建一个属性字符串构建器
        let attributedString = NSMutableAttributedString()
        
        // 设置 "¥" 字符串的字体大小和属性
        let currencyAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: currencyFontSize)
        ]
        let currencyAttributedString = NSAttributedString(string: currency, attributes: currencyAttributes)
        attributedString.append(currencyAttributedString)
        
        // 设置 "金额" 字符串的字体大小和属性
        let amountAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: amountFontSize)
        ]
        let amountAttributedString = NSAttributedString(string: amount, attributes: amountAttributes)
        attributedString.append(amountAttributedString)
        
        return attributedString
    }
    
    public static func formatMoneyStr(currency: String, amount: String, currencyFontSize: CGFloat, amountFontSize: CGFloat, currencyColor: UIColor, amountColor: UIColor) -> NSAttributedString {
        let attributedString = NSMutableAttributedString()
        
        let currencyAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: currencyFontSize),
            .foregroundColor: currencyColor
        ]
        let currencyAttributedString = NSAttributedString(string: currency, attributes: currencyAttributes)
        attributedString.append(currencyAttributedString)
        
        let amountAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: amountFontSize),
            .foregroundColor: amountColor
        ]
        let amountAttributedString = NSAttributedString(string: amount, attributes: amountAttributes)
        attributedString.append(amountAttributedString)
        
        return attributedString
    }
    
    public static func formatMoneyStr(currency: String, amount: String, currencyFont: UIFont, amountFont: UIFont, currencyColor: UIColor, amountColor: UIColor) -> NSAttributedString {
        let attributedString = NSMutableAttributedString()
        
        let currencyAttributes: [NSAttributedString.Key: Any] = [
            .font: currencyFont,
            .foregroundColor: currencyColor
        ]
        let currencyAttributedString = NSAttributedString(string: currency, attributes: currencyAttributes)
        attributedString.append(currencyAttributedString)
        
        let amountAttributes: [NSAttributedString.Key: Any] = [
            .font: amountFont,
            .foregroundColor: amountColor
        ]
        let amountAttributedString = NSAttributedString(string: amount, attributes: amountAttributes)
        attributedString.append(amountAttributedString)
        
        return attributedString
    }
    
    //生成二维码
    public static func generateQRCode(from url: URL) -> UIImage? {
        // 将 URL 转换为字符串
        let urlString = url.absoluteString
        
        // 使用 CoreImage 框架创建 CIFilter 对象
        guard let filter = CIFilter(name: "CIQRCodeGenerator") else { return nil }
        
        // 将字符串数据设置为输入值
        let data = urlString.data(using: String.Encoding.ascii)
        filter.setValue(data, forKey: "inputMessage")
        
        // 获取生成的二维码图像
        guard let outputImage = filter.outputImage else { return nil }
        
        // 调整生成的图像尺寸
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        let scaledImage = outputImage.transformed(by: transform)
        
        // 创建 UIImage 对象
        let qrCodeImage = UIImage(ciImage: scaledImage)
        
        return qrCodeImage
    }
    
    //base64转data
    public static func base64ToData(_ base64String: String) -> Data? {
        // 移除 Base64 字符串中的非法字符
        let validBase64String = base64String.replacingOccurrences(of: "[^a-zA-Z0-9+/=]", with: "", options: .regularExpression)
        
        // 将修复后的 Base64 字符串转换为 Data 对象
        if let data = Data(base64Encoded: validBase64String) {
            return data
        } else {
            print("Invalid Base64 string")
            return nil
        }
    }
    
    public static func isCurrentViewControllerOfType<T: UIViewController>(_ viewControllerType: T.Type) -> Bool {
        if let presentingViewController = UIApplication.shared.keyWindow?.rootViewController?.presentingViewController {
            return type(of: presentingViewController) == viewControllerType
        }
        return false
    }

    /*
     可以修改字符串中的文字 字体大小 与 颜色
     let dynamicAttributes = [
         (substring: "邀请", color: UIColor.green, font: UIFont.boldSystemFont(ofSize: 12)),
         (substring: "1", color: UIColor.red, font: UIFont.systemFont(ofSize: 14))
     ]
     */
    public static func setAttributedString(string: String, color: UIColor, font: UIFont, dynamicAttributes: [(substring: String, color: UIColor, font: UIFont)]) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: string)

        attributedString.addAttribute(.foregroundColor, value: color, range: NSRange(location: 0, length: string.count))
        attributedString.addAttribute(.font, value: font, range: NSRange(location: 0, length: string.count))
        
        for attribute in dynamicAttributes {
            let range = (string as NSString).range(of: attribute.substring)
            if range.location != NSNotFound {
                attributedString.addAttribute(.foregroundColor, value: attribute.color, range: range)
                attributedString.addAttribute(.font, value: attribute.font, range: range)
            }
        }

       

        return attributedString
    }
    
    //View随图片计算宽度
    public static func calculateViewWidth(forImageHeight imageHeight: CGFloat, viewHeight: CGFloat) -> CGFloat {
        let aspectRatio = imageHeight / viewHeight
        let viewWidth = viewHeight / aspectRatio
        return viewWidth
    }
    
    //同一个View 大小改变时用
    public static func calculateViewHeight(forImageSize imageSize: CGSize, viewWidth: CGFloat) -> CGFloat {
        let aspectRatio = imageSize.height / imageSize.width
        let viewHeight = viewWidth * aspectRatio
        return viewHeight
    }

}


extension ChindleTools {
    public static func compareTimestamps(timestamp1: TimeInterval, timestamp2: TimeInterval) -> ComparisonResult {
        let date1 = Date(timeIntervalSince1970: timestamp1)
        let date2 = Date(timeIntervalSince1970: timestamp2)
        
        return date1.compare(date2)
    }
}
