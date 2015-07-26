//
//  CustomView.h
//  UIViewAdvanced
//
//  Created by Nguyen Thanh Tung on 7/26/15.
//  Copyright (c) 2015 Nguyen Thanh Tung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomView : UIView

@property (nonatomic,  strong) NSString *hex;

- (instancetype) initWithHex: (NSString*) hex
                       alpha: (CGFloat) alpha
                       frame: (CGRect) rect;

- (void)fadeOut:(NSString *) hex ;



@end
