//
//  EarthAroundSun.m
//  UIViewAdvanced
//
//  Created by Nguyen Thanh Tung on 7/26/15.
//  Copyright (c) 2015 Nguyen Thanh Tung. All rights reserved.
//

#import "EarthAroundSun.h"

@interface EarthAroundSun ()

@end
@implementation EarthAroundSun {
    NSTimer *timer;
    UIImageView *sun;
    UIImageView *earth;
    UIImageView *moon;
    CGPoint sunCenter; //CoreGraphics Point
    CGFloat distanceEarthToSun;
    CGFloat distanceMoonToEarth;
    CGFloat angle;
    CGFloat moonAngle;//goc quay
}
    
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    [self addSunAndEarth];
    [self sunShine];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.0167
                                             target:self
                                           selector:@selector(spinEarth)
                                           userInfo:nil
                                            repeats:true];
    
}
- (void)addSunAndEarth {
    sun = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 128, 128)];
    earth = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"earth.png"]];
    moon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"moon.png"]];
    CGSize mainViewSize = self.view.bounds.size;
    
    CGFloat statusNavigationBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.bounds.size.height;
    
    sunCenter = CGPointMake(mainViewSize.width * 0.5, (mainViewSize.height + statusNavigationBarHeight) * 0.5);
    
    distanceEarthToSun = mainViewSize.width * 0.5 - 70;
    distanceMoonToEarth = 50;
    sun.center = sunCenter;
    angle = 0.0;
    moonAngle = 0.0;
    earth.center = [self computePositionOfEarch:angle];
    
    moon.center = [self computePositionOfMoon:angle];
    
    [self.view addSubview:sun];
    [self.view addSubview:earth];
    [self.view addSubview:moon];
    
}

- (CGPoint)computePositionOfEarch: (CGFloat) _angle {
    return CGPointMake(sunCenter.x + distanceEarthToSun * cos(angle),
                       sunCenter.y + distanceEarthToSun * sin(angle));
}

- (CGPoint)computePositionOfMoon: (CGFloat) _angle {
    return CGPointMake(earth.center.x + distanceMoonToEarth * cos(moonAngle),
                       earth.center.y + distanceMoonToEarth * sin(moonAngle));
}

- (void) spinEarth {
    angle += 0.01;
    earth.center = [self computePositionOfEarch:angle];
    moonAngle +=0.08;
    moon.center = [self computePositionOfMoon:moonAngle];
}


- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [timer invalidate];
    timer = nil;
}

- (void)sunShine {
    NSMutableArray *images = [[NSMutableArray alloc]initWithCapacity:2];
    for (int i = 0; i < 2; i++) {
        NSString *fileName;
            fileName = [NSString stringWithFormat:@"sun0%d.png",i];
        [images addObject:[UIImage imageNamed:fileName]];
    }
    sun.contentMode = UIViewContentModeScaleAspectFit;
    sun.animationImages = images;
    sun.animationDuration = 1.5;
    sun.animationRepeatCount = 0;
    [sun startAnimating];

}

@end