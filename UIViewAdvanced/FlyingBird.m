//
//  FlyingBird.m
//  UIViewAdvanced
//
//  Created by Nguyen Thanh Tung on 7/25/15.
//  Copyright (c) 2015 Nguyen Thanh Tung. All rights reserved.
//

#import "FlyingBird.h"
#import <AVFoundation/AVFoundation.h>

@interface FlyingBird ()
{
    UIImageView* bird;
    UIImageView* insect;
    AVAudioPlayer *audioPlayer;
}

@end

@implementation FlyingBird

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self drawJungler];
    [self addBird];
    [self flyUpAndDown];
    [self playSong];
    //[self addInsect:[self getTargetPosition]];
}

-(void)drawJungler {
    UIImageView* background = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"jungle.jpg"]];
    background.frame = self.view.bounds;
    background.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:background];
}

- (void)addInsect: (CGPoint) position {
    [[self.view viewWithTag:1]removeFromSuperview];
    insect = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"insect.png"]];
    insect.frame = CGRectMake(position.x, position.y, 60, 30);
    [insect setTag:1];
    [self.view addSubview:insect];
}

- (void)addBird {
    bird = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 110, 68)];
    bird.animationImages = @[[UIImage imageNamed:@"bird0.png"],
                             [UIImage imageNamed:@"bird1.png"],
                             [UIImage imageNamed:@"bird2.png"],
                             [UIImage imageNamed:@"bird3.png"],
                             [UIImage imageNamed:@"bird4.png"],
                             [UIImage imageNamed:@"bird5.png"]];
    bird.animationDuration = 1;
    bird.animationRepeatCount = -1;
    [self.view addSubview:bird];
    [bird startAnimating];
}

-(void)flyUpAndDown {
    
    bird.transform = CGAffineTransformIdentity;
     CGPoint targetPosition = [self getTargetPosition];
    [self addInsect: targetPosition];
    [UIView animateWithDuration:5 animations:^{
        //bird.center = CGPointMake(self.view.bounds.size.width, self.view.bounds.size.height);
        
        [self setTargetForBird:targetPosition];
        
    } completion:^(BOOL finished){
//        bird.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(-1, 1),
//                                                 CGAffineTransformMakeRotation(M_PI_4));
      
        [self flyUpAndDown];
//        [UIView animateWithDuration:5 animations:^{
////            bird.center = CGPointMake(0, 0);
//            [self setTargetForBird];
//        } completion:^(BOOL finished){
//            
//        }];
        
    }];
}

-(CGPoint)getTargetPosition{
    return CGPointMake(arc4random_uniform(self.view.bounds.size.width), arc4random_uniform(self.view.bounds.size.height));
}

- (CGFloat)getAngel: (CGPoint) startPoint andTargetPoint: (CGPoint) targetPoint{
    return atan2(targetPoint.y - startPoint.y, targetPoint.x - startPoint.x);
}

- (void)setTargetForBird: (CGPoint)targetPosition{
    bird.transform = CGAffineTransformMakeRotation([self getAngel:bird.center andTargetPoint:targetPosition]);
    bird.center = targetPosition;
}

- (void) playSong {
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"birdsound" ofType:@"wav"];
    NSURL *url = [NSURL fileURLWithPath:filePath];
    NSError *error;
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url
                                                         error:&error];
    [audioPlayer prepareToPlay];
    [audioPlayer play];
}
- (void) viewWillDisappear:(BOOL)animated {
    [audioPlayer stop];
}

@end
