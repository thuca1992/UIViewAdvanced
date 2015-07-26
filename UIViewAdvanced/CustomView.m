//
//  CustomView.m
//  UIViewAdvanced
//
//  Created by Nguyen Thanh Tung on 7/26/15.
//  Copyright (c) 2015 Nguyen Thanh Tung. All rights reserved.
//

#import "CustomView.h"
#import "CustomUIColor.h"

@implementation CustomView
{
    UILabel *label;
}
- (instancetype) initWithHex: (NSString*) hex
                       alpha: (CGFloat) alpha
                       frame: (CGRect) rect {
    self = [super initWithFrame:rect];
    self.backgroundColor = [[CustomUIColor alloc] initWithHex:hex
                                                  andAlpha:alpha];
    if (rect.size.width > 150 && rect.size.height > 30) {
        label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, rect.size.width - 10.0, 30)];
        label.center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
        label.textAlignment = NSTextAlignmentCenter;
        label.text = hex;
        [self addSubview:label];
    }
    
    return self;
}

- (void) setHex:(NSString *) hex {
    self.backgroundColor = [[CustomUIColor alloc] initWithHex:hex andAlpha:1.0];
    label.text = hex;
    label.textColor = [UIColor blackColor];
}

- (void)fadeOut :(NSString *) hex {
    self.backgroundColor = [[CustomUIColor alloc]initWithHex:hex andAlpha:0.1];
    label.textColor = [[CustomUIColor alloc]initWithHex:@"000000" andAlpha:0.1];
}

@end
