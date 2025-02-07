//
//  SwitchOrientationManager.m
//  ChindleKit
//
//  Created by 朱𣇈丹 on 2023/2/22.
//

#import "SwitchOrientationManager.h"

@implementation SwitchOrientationManager

//static SwitchOrientationManager *manager = nil;

//+(instancetype)shareManager{
//    
//    static dispatch_once_t onceToken;
//    
//    dispatch_once(&onceToken, ^{
//    
//        manager = [[SwitchOrientationManager alloc] init];
//    });
//    
//    return manager;
//}

/// 切换设备方向
/// - Parameter isLaunchScreen: 是否是全屏
-(void)p_switchOrientationWithLaunchScreen:(BOOL)isLaunchScreen viewController:(UIViewController *)viewController{
    
    
    //YES 横屏 No 竖屏
    if(self.switchOrientationBlock){
        self.switchOrientationBlock(isLaunchScreen);
    }

    if (@available(iOS 16.0, *)) {
        void (^errorHandler)(NSError *error) = ^(NSError *error) {
                    NSLog(@"强制%@错误:%@", isLaunchScreen ? @"横屏" : @"竖屏", error);
                };
        #pragma clang diagnostic push
        #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
                SEL supportedInterfaceSelector = NSSelectorFromString(@"setNeedsUpdateOfSupportedInterfaceOrientations");
                [viewController performSelector:supportedInterfaceSelector];
                NSArray *array = [[UIApplication sharedApplication].connectedScenes allObjects];
                UIWindowScene *scene = (UIWindowScene *)[array firstObject];
                Class UIWindowSceneGeometryPreferencesIOS = NSClassFromString(@"UIWindowSceneGeometryPreferencesIOS");
                if (UIWindowSceneGeometryPreferencesIOS) {
                    SEL initWithInterfaceOrientationsSelector = NSSelectorFromString(@"initWithInterfaceOrientations:");
                    UIInterfaceOrientationMask orientation = isLaunchScreen ? UIInterfaceOrientationMaskLandscapeRight : UIInterfaceOrientationMaskPortrait;
                    id geometryPreferences = [[UIWindowSceneGeometryPreferencesIOS alloc] performSelector:initWithInterfaceOrientationsSelector withObject:@(orientation)];
                    if (geometryPreferences) {
                        SEL requestGeometryUpdateWithPreferencesSelector = NSSelectorFromString(@"requestGeometryUpdateWithPreferences:errorHandler:");
                        if ([scene respondsToSelector:requestGeometryUpdateWithPreferencesSelector]) {
                            NSLog(@"旋转");

                            [scene performSelector:requestGeometryUpdateWithPreferencesSelector withObject:geometryPreferences withObject:errorHandler];
                        }
                    }
                }
        #pragma clang diagnostic pop
//        [self setNeedsUpdateOfSupportedInterfaceOrientations];
//        NSArray *array = [[[UIApplication sharedApplication] connectedScenes] allObjects];
//        UIWindowScene *scene = [array firstObject];
//        UIInterfaceOrientationMask orientation = isLaunchScreen ? UIInterfaceOrientationMaskLandscapeRight : UIInterfaceOrientationMaskPortrait;
//        UIWindowSceneGeometryPreferencesIOS *geometryPreferencesIOS = [[UIWindowSceneGeometryPreferencesIOS alloc] initWithInterfaceOrientations:orientation];
//        [scene requestGeometryUpdateWithPreferences:geometryPreferencesIOS errorHandler:^(NSError * _Nonnull error) {
//            NSLog(@"强制%@错误:%@", isLaunchScreen ? @"横屏" : @"竖屏", error);
//        }];
    } else {

        [self p_swichToNewOrientation:isLaunchScreen ? UIInterfaceOrientationLandscapeRight : UIInterfaceOrientationPortrait];
    }
}

/// iOS16 之前进行横竖屏切换方式
/// - Parameter interfaceOrientation: 需要切换的方向
- (void)p_swichToNewOrientation:(UIInterfaceOrientation)interfaceOrientation {

    //    NSNumber *resetOrientationTarget = [NSNumber numberWithInt:UIInterfaceOrientationUnknown];
    //    [[UIDevice currentDevice] setValue:resetOrientationTarget forKey:@"orientation"];
    NSNumber *orientationTarget = [NSNumber numberWithInteger:interfaceOrientation];
    [[UIDevice currentDevice] setValue:orientationTarget forKey:@"orientation"];
    [[NSNotificationCenter defaultCenter] postNotificationName:UIDeviceOrientationDidChangeNotification object:nil];

}

- (void)reloadScreenStatusWithMasBlock:(void(^)(BOOL isHeader))masBlock{
    
    BOOL isLaunchScreen = NO;
    
    if (@available(iOS 16.0, *)) {
        NSArray *array = [[[UIApplication sharedApplication] connectedScenes] allObjects];
        UIWindowScene *scene = [array firstObject];
        isLaunchScreen = scene.interfaceOrientation == UIInterfaceOrientationLandscapeRight;
    } else {
        // 这里是 UIDeviceOrientationLandscapeLeft（我们需要 Home 按键在右边）
        // UIDeviceOrientationLandscapeLeft,       // Device oriented horizontally, home button on the right
        isLaunchScreen = [UIDevice currentDevice].orientation == UIDeviceOrientationLandscapeRight;
    }
    
    masBlock(isLaunchScreen);
    
}


@end
