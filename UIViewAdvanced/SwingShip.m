//
//  SwingShip.m
//  UIViewAdvanced
//
//  Created by Nguyen Thanh Tung on 7/25/15.
//  Copyright (c) 2015 Nguyen Thanh Tung. All rights reserved.
//

#import "SwingShip.h"
#import <AVFoundation/AVFoundation.h>

@interface SwingShip ()

@end

@implementation SwingShip{
    UIImageView *ship;
    UIImageView *sea1;
    UIImageView *sea2;
    AVAudioPlayer *audioPlayer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self drawShipAndSea];
    [self animateShip];
    [self animateSea];
    [self playSong];
}

-(void)drawShipAndSea {
    sea1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sea1.jpg"]];
    sea1.frame = self.view.bounds;
    [self.view addSubview:sea1];
    
    sea2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sea2.jpg"]];
    sea2.frame = CGRectMake(self.view.bounds.size.width, 0 , self.view.bounds.size.width, self.view.bounds.size.height);
    [self.view addSubview:sea2];
    
    ship = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ship3.png"]];
    ship.center = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2+50);
    
    [self.view addSubview:ship];
}

-(void)animateShip {
    [UIView animateWithDuration:1 animations:^{
        ship.transform = CGAffineTransformMakeRotation(-0.08);
    } completion:^(BOOL finished){
        
        [UIView animateWithDuration:1 animations:^{
            ship.transform = CGAffineTransformMakeRotation(0.08);
        } completion:^(BOOL finished){
                [self animateShip];
        }];
    }];
}

-(void)animateSea {
    [UIView animateWithDuration:10 animations:^{
        sea1.frame = CGRectMake(-self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        sea2.frame = self.view.bounds;
    }completion:^(BOOL finished){
        sea1.frame = CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        [UIView animateWithDuration:10 animations:^{
            sea2.frame = CGRectMake(-self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
            sea1.frame = self.view.bounds;
        } completion:^(BOOL finished) {
            sea2.frame = CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
            [self animateSea];
        }];
        
    }];
}

- (void) playSong {
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"newOcean" ofType:@"mp3"];
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
