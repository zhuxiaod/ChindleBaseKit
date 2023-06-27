//
//  UIButton+LCBase.m
//  EnglishTeacherPlatform
//
//  Created by ZXD on 2020/9/4.
//  Copyright © 2020 com.chindle.talk915. All rights reserved.
//

#import "UIButton+TESBlock.h"
#import "objc/runtime.h"

@interface UIButton ()

@property (nonatomic, copy) void(^tes_block)(UIButton *);

@end

@implementation UIButton(TESBlock)

- (void)setTes_block:(void (^)(UIButton *))tes_block {
    objc_setAssociatedObject(self, @selector(tes_block), tes_block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(UIButton *))tes_block {
    return objc_getAssociatedObject(self, @selector(tes_block));
}


- (void)onClick:(UIButton *)btn {
    
    if (self.tes_block) {
        self.tes_block(btn);
    }
}

- (void)tes_addTouchUpInsideBlock:(void (^)(UIButton *))block {
    
    self.tes_block = block;
    [self addTarget:self action:@selector(onClick:) forControlEvents:(UIControlEventTouchUpInside)];
}


@end
