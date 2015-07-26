//
//  StarField.m
//  UIViewAdvanced
//
//  Created by Nguyen Thanh Tung on 7/26/15.
//  Copyright (c) 2015 Nguyen Thanh Tung. All rights reserved.
//

#import "StarField.h"

@interface StarField ()

@end

@implementation StarField{
    UIImageView *red ,*violet ,*brown ,*green;
    CGPoint center;
    CGFloat deltaX ;
    CGFloat deltaY ;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    deltaX = 100;
    deltaY = 100;
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    CGSize size = self.view.bounds.size;
    center = CGPointMake(size.width * 0.5, (size.height - 60) * 0.5 );
    red = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"red.png"]];
    brown = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"brown.png"]];
    violet = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"violet.png"]];
    green = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"green.png"]];

    [self setPosition];
    [self.view addSubview:red];
    [self.view addSubview:violet];
    [self.view addSubview:brown];
    [self.view addSubview:green];
    [self animate];
}

- (void)animate {
    [UIView animateWithDuration:1 animations:^{
        brown.center = CGPointMake(brown.center.x - deltaX, brown.center.y - deltaY);
        red.center = CGPointMake(red.center.x + deltaX, red.center.y + deltaY);
        violet.center = CGPointMake(violet.center.x - deltaX, violet.center.y + deltaY);
        green.center = CGPointMake(green.center.x + deltaX, green.center.y - deltaY);
        
    } completion:^(BOOL finished){
        [UIView animateWithDuration:1 animations:^{
            brown.center = CGPointMake(brown.center.x , brown.center.y + deltaY);
            red.center = CGPointMake(red.center.x, red.center.y - deltaY);
            violet.center = CGPointMake(violet.center.x + deltaX, violet.center.y );
            green.center = CGPointMake(green.center.x - deltaX , green.center.y);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:3 animations:^{
                [self setPosition];
            } completion:^(BOOL finished) {
                [self animate];
            }];
        }];
    }];
}

- (void)setPosition {
    red.center = center;
    brown.center = center;
    green.center = center;
    violet.center = center;

}

@end
