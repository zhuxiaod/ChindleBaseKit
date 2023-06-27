//
//  qmpConstant.h
//  NewTalkEnglishStudentProject
//
//  Created by mac on 2020/12/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChindleConstant : NSObject

#define WeakifySelf()       __weak typeof(self) weakSelf = self; weakSelf;

#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

#define UI_IS_IPAD (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)

// 3.5英寸
#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
// 4.0英寸
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
// 4.7英寸
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
// 5.5英寸
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

// 判断iPhone X
#define Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

//判断iPHoneXr | 11
#define Is_iPhoneXR ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) && !UI_IS_IPAD : NO)

//判断iPHoneXs | 11Pro
#define Is_iPhoneXS ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !UI_IS_IPAD : NO)

//判断iPhoneXs Max | 11ProMax
#define Is_iPhoneXS_MAX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) && !UI_IS_IPAD : NO)

//判断iPhone12_Mini
#define Is_iPhone12_Mini ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1080, 2340), [[UIScreen mainScreen] currentMode].size) && !UI_IS_IPAD : NO)

//判断iPhone12 | 12Pro
#define Is_iPhone12 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1170, 2532), [[UIScreen mainScreen] currentMode].size) && !UI_IS_IPAD : NO)

//判断iPhone12 Pro Max
#define Is_iPhone12_ProMax ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1284, 2778), [[UIScreen mainScreen] currentMode].size) && !UI_IS_IPAD : NO)

//x系列
#define IS_IPhoneX_All (Is_iPhoneX || Is_iPhoneXR || Is_iPhoneXS || Is_iPhoneXS_MAX || Is_iPhone12_Mini || Is_iPhone12 || Is_iPhone12_ProMax)


//#define  StatusBarHeight     (IS_IPhoneX_All ? 44.f : 20.f)
//#define  NavigationBarHeight  44.f
//#define  TabbarHeight         (IS_IPhoneX_All ? (49.f+34.f) : 49.f)
//#define  TabbarSafeBottomHeight         (IS_IPhoneX_All ? 34.f : 0.f)
//#define  StatusBarAndNavigationBarHeight  (IS_IPhoneX_All ? 88.f : 64.f)

////网络请求失败消息
//extern NSString *const qmp_requestNetErrorMessage;
//
////Token过期
//extern NSString *const qmp_requestNetTokenOverdueMessage;
//
////账号输入错误
//extern NSString *const qmp_AccountErrorMessage;
//
////请输入正确的电话号码
//extern NSString *const qmp_phoneNumErrorMessage;
//
////用户名不能为空
//extern NSString *const qmp_userNameErrorMessage;
//
////用户头像展位图
//extern NSString *const qmp_UserPlaceholderImageName;
//
////阅读协议
//extern NSString *const qmp_agreePrivacyErrorMessage;
//
////验证码
//extern NSString *const qmp_verCodeErrorMessage;
//
////密码输入错误
//extern NSString *const qmp_passwordErrorMessage;
//
////程序名字
//extern NSString *const qmp_AppNameString;
//
//
//
///******************** 常量 ******************************/
//extern CGFloat const qmpSpace;//UI安全区距离
//
//extern CGFloat const qmpTSpace;//UI安全区距离
//
//extern CGFloat const qmpLineLength;//分割线的长度
//
//+(CGFloat)qmpLineLength;
//
//
//
//


@end

NS_ASSUME_NONNULL_END
