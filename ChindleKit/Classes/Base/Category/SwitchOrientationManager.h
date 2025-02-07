//
//  SwitchOrientationManager.h
//  ChindleKit
//
//  Created by 朱𣇈丹 on 2023/2/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^SwitchOrientationBlock)(BOOL isLaunchScreen);

@interface SwitchOrientationManager : NSObject

@property(nonatomic,copy)SwitchOrientationBlock switchOrientationBlock;

//+(instancetype)shareManager;

-(void)p_switchOrientationWithLaunchScreen:(BOOL)isLaunchScreen viewController:(UIViewController *)viewController;

- (void)reloadScreenStatusWithMasBlock:(void(^)(BOOL isHeader))masBlock;

@end

NS_ASSUME_NONNULL_END
