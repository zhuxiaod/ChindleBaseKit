//
//  ZXDTimer.m
//  内存管理
//
//  Created by 朱𣇈丹 on 2022/7/6.
//

#import "ZXDTimer.h"

@implementation ZXDTimer

static NSMutableDictionary *zxdTimers_;
dispatch_semaphore_t zxdSemaphore_;

+(void)initialize{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        zxdTimers_ = [NSMutableDictionary dictionary];
        zxdSemaphore_ = dispatch_semaphore_create(1);
    });
}

+ (NSString *)execTask:(void (^)(void))task start:(NSTimeInterval)start interval:(NSTimeInterval)interval repeats:(BOOL)repeats isAsync:(BOOL)isAsync
{
    if (!task || start < 0 || (interval <= 0 && repeats)) return nil;
    
    // 队列
    dispatch_queue_t queue = isAsync ? dispatch_get_global_queue(0, 0) : dispatch_get_main_queue();
    
    // 创建定时器
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    // 设置时间
    dispatch_source_set_timer(timer,
                              dispatch_time(DISPATCH_TIME_NOW, start * NSEC_PER_SEC),
                              interval * NSEC_PER_SEC, 0);
    
    
    dispatch_semaphore_wait(zxdSemaphore_, DISPATCH_TIME_FOREVER);
    // 定时器的唯一标识
    NSString *name = [NSString stringWithFormat:@"%zd", zxdTimers_.count];
    // 存放到字典中
    zxdTimers_[name] = timer;
    dispatch_semaphore_signal(zxdSemaphore_);
    
    // 设置回调
    dispatch_source_set_event_handler(timer, ^{
        task();
        
        if (!repeats) { // 不重复的任务
            [self cancelTask:name];
        }
    });
    
    // 启动定时器
    dispatch_resume(timer);
    
    return name;
}

+ (NSString *)execTask:(id)target selector:(SEL)selector start:(NSTimeInterval)start interval:(NSTimeInterval)interval repeats:(BOOL)repeats isAsync:(BOOL)isAsync
{
    if (!target || !selector) return nil;
    
    return [self execTask:^{
        if ([target respondsToSelector:selector]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [target performSelector:selector];
#pragma clang diagnostic pop
        }
    } start:start interval:interval repeats:repeats isAsync:isAsync];
}

+(void)cancelTask:(NSString *)name{
    
    if (name.length == 0) return;
    
    dispatch_semaphore_wait(zxdSemaphore_, DISPATCH_TIME_FOREVER);
    
    dispatch_source_t timer = zxdTimers_[name];
    if (timer) {
        dispatch_source_cancel(timer);
        [zxdTimers_ removeObjectForKey:name];
    }

    dispatch_semaphore_signal(zxdSemaphore_);

}     

@end
