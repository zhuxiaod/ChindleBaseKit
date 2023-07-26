//
//  NSNumber+Extension.m
//  SaaSSchool
//
//  Created by 朱𣇈丹 on 2023/7/20.
//  Copyright © 2023 青豆教育. All rights reserved.
//

#import "NSNumber+Extension.h"

@implementation NSNumber (Extension)

//- (NSString *)tes_stringValue {
//
//    NSDecimalNumber *decimalNumber = [NSDecimalNumber decimalNumberWithDecimal:self.decimalValue];
//
//    return decimalNumber.stringValue;
//}

- (NSString *)tes_stringValue {
    
    NSDecimalNumber *decimalNumber = [NSDecimalNumber decimalNumberWithDecimal:[self decimalValue]];
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.maximumFractionDigits = 2;
    formatter.minimumFractionDigits = 0;
    return [formatter stringFromNumber:decimalNumber] ?: [NSString stringWithFormat:@"%@", self];
    
}

@end
