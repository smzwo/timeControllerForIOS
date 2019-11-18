//
//  timeController.m
//  timerController
//
//  Created by sunmingzhe on 2019/11/18.
//  Copyright © 2019 v_sunmingzhe01. All rights reserved.
//

#import "timeController.h"

@implementation timeController
dispatch_source_t timer=nil;

+ (void)initWithGCD:(int)timeValue beginState:(void (^)(void))begin endState:(void (^)(int seconds))end {
    __block NSInteger time = timeValue;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    //设置倒计时为1秒一次计时
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(timer, ^{
        
        if (time < 0) {dispatch_source_cancel(timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                begin();
            });
        } else {
            int seconds = time % 60;
            dispatch_async(dispatch_get_main_queue(), ^{
                end(seconds);
            });
            time--;
        }
    });
    dispatch_resume(timer);
    
}

+ (void)cancelTimer{
    if(timer!=nil){
        dispatch_source_cancel(timer);
    }
}
@end
