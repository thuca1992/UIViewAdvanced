//
//  HexColor.m
//  UIViewAdvanced
//
//  Created by Nguyen Thanh Tung on 7/26/15.
//  Copyright (c) 2015 Nguyen Thanh Tung. All rights reserved.
//

#import "HexColor.h"
#import "UIColor+HexExtend.h"

@interface HexColor ()

@end

@implementation HexColor

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 60)];
    label.backgroundColor = [[UIColor alloc]initWithHex:@"D9CEB2" andAlpha:1.0];
    [self.view addSubview:label];
}



@end
