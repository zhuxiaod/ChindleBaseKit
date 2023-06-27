//
//  qmpConstant.m
//  NewTalkEnglishStudentProject
//
//  Created by mac on 2020/12/2.
//

#import "ChindleConstant.h"

@implementation ChindleConstant

NSString *const qmp_requestNetErrorMessage = @"网络问题,请检查网络";

NSString *const qmp_requestNetTokenOverdueMessage = @"账号过期,请重新登录";

NSString *const qmp_AccountErrorMessage = @"请输入正确的账号密码";

NSString *const qmp_phoneNumErrorMessage = @"请输入正确的电话号码";

NSString *const qmp_userNameErrorMessage = @"用户名不能为空";

NSString *const qmp_agreePrivacyErrorMessage = @"登录需要阅读并同意《说客英语服务协议》和《隐私政策》";

NSString *const qmp_verCodeErrorMessage = @"请输入正确的验证码";

NSString *const qmp_passwordErrorMessage = @"请输入6-12位字母和数字密码";

//程序名字
NSString *const qmp_AppNameString = @"说客英语";



/******************** 常量 ******************************/

CGFloat const qmpSpace = 18;

CGFloat const qmpTSpace = 36;

CGFloat const qmpLineLength = 1;

//预留一个line的入口
+(CGFloat)qmpLineLength{
    return qmpLineLength;
}



@end
