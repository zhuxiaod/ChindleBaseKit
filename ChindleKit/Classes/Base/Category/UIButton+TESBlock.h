//
//  UIButton+LCBase.h
//  EnglishTeacherPlatform
//
//  Created by ZXD on 2020/9/4.
//  Copyright © 2020 com.chindle.talk915. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (TESBlock)

/**
 为按钮添加 block 方式点击回调

 @param block 点击执行的代码
 */
- (void)tes_addTouchUpInsideBlock:(void(^)(UIButton *btn))block;


@end

NS_ASSUME_NONNULL_END
