//
//  SVProgressHUD+Extension.swift
//  ParentsOnlineSchool
//
//  Created by 朱𣇈丹 on 2022/11/14.
//  Copyright © 2022 青豆教育. All rights reserved.
//

import Foundation
import SVProgressHUD

extension SVProgressHUD {
    
    //加载显示 限制点击
    public static func showMaskTypeClear() {
        SVProgressHUD.show()
        SVProgressHUD.setDefaultMaskType(.clear)
    }
}
