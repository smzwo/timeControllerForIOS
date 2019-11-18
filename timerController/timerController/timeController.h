//
//  timeController.h
//  timerController
//
//  Created by sunmingzhe on 2019/11/18.
//  Copyright © 2019 v_sunmingzhe01. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface timeController : NSObject
+ (void)initWithGCD:(int)timeValue beginState:(void (^)(void))begin endState:(void (^)(int seconds))end;
+ (void)cancelTimer;
@end

NS_ASSUME_NONNULL_END
