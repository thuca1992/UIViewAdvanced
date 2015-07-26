//
//  NestedSquares.m
//  DemoCollection
//
//  Created by Nguyen Thanh Tung on 7/25/15.
//  Copyright (c) 2015 Cuong Trinh. All rights reserved.
//

#import "NestedSquares.h"

@interface NestedSquares ()

@end

@implementation NestedSquares

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    [self drawNestedSquares];
    [self rotateAllSquares];
}

- (void)drawNestedSquares{
    CGSize mainViewSize = self.view.bounds.size;
    CGFloat margin = 20;
    CGFloat recWidth = mainViewSize.width - margin * 2.0;
    CGFloat statusNavigationBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.bounds.size.height;
    CGPoint center = CGPointMake(mainViewSize.width * 0.5, (mainViewSize.height + statusNavigationBarHeight) * 0.5);
    UIView *square;
    for (int i = 0 ; i < 10; i++) {
        if (i % 2 == 0) {
            square = [self drawSquareByWidth:recWidth andRotate:false atCenter:center];
        }
        else{
            square = [self drawSquareByWidth:recWidth andRotate:true atCenter:center];
        }
        [self.view addSubview:square];
        recWidth *= 0.707;
    }
    
}

- (UIView*)drawSquareByWidth: (CGFloat) width
                   andRotate: (BOOL) isRotate
                    atCenter: (CGPoint) center{
    UIView* square = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width, width)];
    square.center = center;
    square.backgroundColor = isRotate ? [UIColor whiteColor] : [UIColor darkGrayColor];
    square.transform = isRotate ? CGAffineTransformMakeRotation(M_PI_4) : CGAffineTransformIdentity;
    return square;
    
}

- (void)rotateAllSquares{
    [UIView animateWithDuration:2.0 animations:^{
        for (int i = 0; i < self.view.subviews.count; i++) {
            if ( i % 2 == 0) {
                ((UIView*)self.view.subviews[i]).transform = CGAffineTransformMakeRotation(M_PI_4);
            }
            else{
                ((UIView*)self.view.subviews[i]).transform = CGAffineTransformIdentity;
            }
            
        }
    }];
}

@end
