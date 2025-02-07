//
//  ChindlePhotoLibrary.swift
//  ChindleKit
//
//  Created by 朱𣇈丹 on 2023/3/14.
//

import Foundation
import Photos
@objcMembers
public class ChindlePhotoLibrary {
    
    public init() {
        
    }
    
    //拍照
    @discardableResult
    public func photograpUI(vc: UIViewController, allowsEditing: Bool = false) -> UIImagePickerController?{
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            
            let cameraPicker = UIImagePickerController()
            cameraPicker.delegate = vc as? any UIImagePickerControllerDelegate & UINavigationControllerDelegate
            cameraPicker.allowsEditing = allowsEditing
            cameraPicker.sourceType = .camera
            //在需要的地方present出来
            UIView.getCurrentVC()?.present(cameraPicker, animated: true, completion: nil)
            
            return cameraPicker

        } else {
            
            UIView.show(message: "不支持拍照")
        }
        
        return nil
    }
    
    //从相册选择
    public func albumUI(vc: UIViewController, allowsEditing: Bool = true) {
        
        PHPhotoLibrary.requestAuthorization({(status:PHAuthorizationStatus) in
            switch status{
            case .authorized:
                DispatchQueue.global(qos: .userInitiated).async {
                    DispatchQueue.main.async {
                        
                        let photoPicker =  UIImagePickerController()
                        photoPicker.delegate = vc as? any UIImagePickerControllerDelegate & UINavigationControllerDelegate
                        photoPicker.allowsEditing = allowsEditing
                        photoPicker.sourceType = .photoLibrary
                        //在需要的地方present出来
                        UIView.getCurrentVC()?.present(photoPicker, animated: true, completion: nil)
                    }
                }
                break
            case .denied:
                DispatchQueue.global(qos: .userInitiated).async {
                    DispatchQueue.main.async {
                        
                        UIView.show(message: "请先允许访问相册")
                    }
                    
                }
                break
            default:
                break
            }
        })
    }
    
}
