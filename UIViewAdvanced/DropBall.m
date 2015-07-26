//
//  DropBall.m
//  UIViewAdvanced
//
//  Created by Nguyen Thanh Tung on 7/26/15.
//  Copyright (c) 2015 Nguyen Thanh Tung. All rights reserved.
//

#import "DropBall.h"

@interface DropBall ()

@end

@implementation DropBall{
    NSTimer *timer;
    UIImageView *ball;
    CGFloat ballRadius;
    CGFloat x, y , velocityY , accellerateY , maxHeight, damper;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self addBall];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.016 target:self selector:@selector(dropBall) userInfo:nil repeats:true];
}

- (void)addBall {
    CGSize  mainViewSize = self.view.bounds.size;
    ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ball.png"]];
    ballRadius = 32.0;
    
    x = mainViewSize.width * 0.5;
    y = ballRadius;
    
    velocityY = 0.0;
    accellerateY = 1;
    damper = 0.9;
    
    CGFloat navigationBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.bounds.size.height;
    maxHeight = mainViewSize.height - ballRadius - navigationBarHeight;
    ball.center = CGPointMake(x, y);
    [self.view addSubview:ball];
}

- (void)dropBall {
    velocityY += accellerateY;
    y+=velocityY;
    if (y > maxHeight) {
        velocityY = -velocityY;
        velocityY *= damper;
        y = maxHeight;
    }
    ball.center = CGPointMake(x, y);
}

@end
