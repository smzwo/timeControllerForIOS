//
//  ViewController.m
//  timerController
//
//  Created by sunmingzhe on 2019/11/18.
//  Copyright © 2019 v_sunmingzhe01. All rights reserved.
//

#import "ViewController.h"
#import "timeController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *timeCounter;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.timeCounter.frame = CGRectMake(CGRectGetMidX(self.view.bounds) - 80, CGRectGetMidY(self.view.bounds)-50 -(CGRectGetMidY(self.view.frame)-50)/2, 160, 50);
    
    self.timeCounter.textColor = [UIColor redColor];
    [self.view addSubview:self.timeCounter];
    [self initCaptchaTimer];
    // Do any additional setup after loading the view.
}
-(void) initCaptchaTimer{
    [timeController cancelTimer];
    [timeController initWithGCD:10 beginState:^{
        //倒计时结束的操作
        NSLog(@"结束");
    } endState:^(int seconds) {
        //倒计时过程中的操作，可以刷新UI
        self.timeCounter.text  =[NSString stringWithFormat:@"剩余%d s",seconds];
    }];
}

@end
