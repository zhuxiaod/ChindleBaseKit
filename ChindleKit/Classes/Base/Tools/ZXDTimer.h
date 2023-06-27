//
//  ZXDTimer.h
//  内存管理
//
//  Created by 朱𣇈丹 on 2022/7/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZXDTimer : NSObject

/*
 task: 任务
 start: 几秒后开始
 interval: 间隔多久再触发一次
 repeats: 是否重复
 isAsync: 是否异步调用，YES 开启子线程调用， NO 在主线程调用
 */

+(NSString *)execTask:(void(^)(void))task
                start:(NSTimeInterval)start
             interval:(NSTimeInterval)interval
              repeats:(BOOL)repeats
              isAsync:(BOOL)isAsync;

+ (NSString *)execTask:(id)target
              selector:(SEL)selector
                 start:(NSTimeInterval)start
              interval:(NSTimeInterval)interval
               repeats:(BOOL)repeats
               isAsync:(BOOL)isAsync;

+(void)cancelTask:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
