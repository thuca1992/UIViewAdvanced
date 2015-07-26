//
//  RollingBall.m
//  UIViewAdvanced
//
//  Created by Nguyen Thanh Tung on 7/26/15.
//  Copyright (c) 2015 Nguyen Thanh Tung. All rights reserved.
//

#import "RollingBall.h"

@interface RollingBall ()

@end

@implementation RollingBall{
    UIImageView *ball, *ball2;
    NSTimer *timer;
    CGFloat angel;
    CGFloat ballRadius;
    CGFloat delta1,delta2;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addBall];
    angel = 0.0;
    delta1 = 1;
    delta2 = 1;
    timer = [NSTimer scheduledTimerWithTimeInterval:0.05
                                             target:self
                                           selector:@selector(rollBall)
                                           userInfo:nil
                                            repeats:true];
}

-(void) addBall {
    CGSize mainViewSize = self.view.bounds.size;
    
    ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ball.png"]];
    ballRadius = 32.0;
    ball.center = CGPointMake(ballRadius, mainViewSize.height * 0.5);
    
    ball2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ball.png"]];
    ball2.center = CGPointMake(300, mainViewSize.height * 0.5);
    [self.view addSubview:ball];
    [self.view addSubview:ball2];
}

- (void)rollBall {
    CGFloat deltaAngle = 0.1;
       angel += deltaAngle;
    ball.transform = CGAffineTransformMakeRotation(angel * delta1);
    ball2.transform = CGAffineTransformMakeRotation(angel * delta2);
    [self checkBall];
    
   ball.center = CGPointMake(ball.center.x + ballRadius * deltaAngle * delta1, ball.center.y);
   ball2.center = CGPointMake(ball2.center.x + ballRadius * deltaAngle * delta2, ball2.center.y);
}

- (void)checkBall {
    CGFloat x1 = ball.center.x;
    CGFloat x2 = ball2.center.x;
    if (ball2.center.x + ballRadius > self.view.bounds.size.width) {
        delta2 = -delta2;
    }
    if(ball.center.x - ballRadius < 0){
        delta1 = -delta1;
    }
    if ((ballRadius) > (x2 - x1)/2){
        delta2 = -delta2;
        delta1 = -delta1;
    }
    
}
- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [timer invalidate];
    timer = nil;
}
@end
