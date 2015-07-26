
//
//  ColorView.m
//  UIViewAdvanced
//
//  Created by Nguyen Thanh Tung on 7/26/15.
//  Copyright (c) 2015 Nguyen Thanh Tung. All rights reserved.
//

#import "ColorView.h"
#import "CustomView.h"

@interface ColorView ()

@end

@implementation ColorView{
    CustomView *view1, *view2, *view3 , *view4 , *view5;
    NSArray *cpArray;
    int colorPattenIndex;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    [self initData];
    [self createColorView];
    [self performSelector: @selector(animateColor:)
               withObject:[[NSNumber alloc]initWithInt:colorPattenIndex]
               afterDelay:1];
    
    
}

- (void)initView {
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;

}

- (void)createColorView{
    CGFloat colorViewWidth = 200.0;
    CGFloat colorViewHeight = 40.0;
    CGFloat x0 = (self.view.bounds.size.width - colorViewWidth/2) * 0.5;
    
    view1 = [[CustomView alloc] initWithHex: @"556270"
                                         alpha: 1.0
                                         frame: CGRectMake(x0, 10, colorViewWidth, colorViewHeight)];
    view2 = [[CustomView alloc] initWithHex: @"4ECDC4"
                                         alpha: 1.0
                                         frame: CGRectMake(x0, 60, colorViewWidth, colorViewHeight)];
    view3 = [[CustomView alloc] initWithHex: @"C7F464"
                                         alpha: 1.0
                                         frame: CGRectMake(x0, 110, colorViewWidth, colorViewHeight)];
    view4 = [[CustomView alloc] initWithHex: @"FF6B6B"
                                         alpha: 1.0
                                         frame: CGRectMake(x0, 160, colorViewWidth, colorViewHeight)];
    view5 = [[CustomView alloc] initWithHex: @"C44D58"
                                         alpha: 1.0
                                         frame: CGRectMake(x0, 210, colorViewWidth, colorViewHeight)];
    [self.view addSubview:view1];
    [self.view addSubview:view2];
    [self.view addSubview:view3];
    [self.view addSubview:view4];
    [self.view addSubview:view5];
}

- (void)initData {
    NSArray* cp1 = @[@"ECD078", @"D95B43", @"C02942", @"542437", @"53777A"];
    NSArray* cp2 = @[@"00A0B0", @"6A4A3C", @"CC333F", @"EB6841", @"EDC951"];
    NSArray* cp3 = @[@"594F4F", @"547980", @"45ADA8", @"9DE0AD", @"E5FCC2"];
    NSArray* cp4 = @[@"FF9900", @"424242", @"E9E9E9", @"BCBCBC", @"3299BB"];
    NSArray* cp5 = @[@"5E412F", @"FCEBB6", @"78C0A8", @"F07818", @"F0A830"];
    NSArray* cp6 = @[@"FAD089", @"FF9C5B", @"F5634A", @"ED303C", @"3B8183"];
    cpArray = @[cp1, cp2, cp3, cp4, cp5, cp6];
    colorPattenIndex = 0;

}

- (void)animateColor: (NSNumber*) nsIndex {
    int index = [nsIndex integerValue];
    [UIView animateWithDuration:3.0
                     animations:^{
                         NSArray* cp = cpArray[index];
                            view1.hex = cp[0];
                            view2.hex = cp[1];
                            view3.hex = cp[2];
                            view4.hex = cp[3];
                            view5.hex = cp[4];
                     } completion:^(BOOL finished) {
                         [UIView animateWithDuration:1 animations:^{
                             NSArray* cp = cpArray[index];
                             [view1 fadeOut:cp[0]];
                             [view2 fadeOut:cp[1]];
                             [view3 fadeOut:cp[2]];
                             [view4 fadeOut:cp[3]];
                             [view5 fadeOut:cp[4]];
                         } completion:^(BOOL finished) {
                             self->colorPattenIndex++;
                             if (self->colorPattenIndex == self->cpArray.count  ) {
                                 self->colorPattenIndex = 0 ;
                             }
                             [self animateColor:[[NSNumber alloc]initWithInt:colorPattenIndex ]];

                         }];
                     }];
}
@end
