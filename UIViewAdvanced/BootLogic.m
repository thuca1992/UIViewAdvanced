//
//  BootLogic.m
//  TechmasterApp
//
//  Created by techmaster on 9/7/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "BootLogic.h"
#import "MainScreen.h"


@implementation BootLogic
+ (void) boot: (UIWindow*) window
{
    MainScreen* mainScreen = [[MainScreen alloc] initWithStyle:UITableViewStyleGrouped];
    //--------- From this line, please customize your menu data -----------
    NSDictionary* advanced = @{SECTION: @"UIView Advanced", MENU: @[
                                    @{TITLE: @"Nested Squares", CLASS: @"NestedSquares"},
                                    @{TITLE: @"Flying Bird", CLASS: @"FlyingBird"},
                                    @{TITLE: @"Swing Ship", CLASS: @"SwingShip"},
                                    @{TITLE: @"Star Field", CLASS: @"StarField"},
                                    @{TITLE: @"Hex Color", CLASS: @"HexColor"},
                                    @{TITLE: @"Color View", CLASS: @"ColorView"},
                                    @{TITLE: @"Rolling Ball", CLASS: @"RollingBall"},
                                    @{TITLE: @"Earth Sun Moon", CLASS: @"EarthAroundSun"},
                                    @{TITLE: @"Drop Ball", CLASS: @"DropBall"}
                          ]};
    
    mainScreen.menu = @[advanced];
    mainScreen.title = @"UIView Advance Collection";
    mainScreen.about = @"UIView Advance Saturday, July 25, 2015 ";
    //--------- End of customization -----------
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController: mainScreen];
    
    window.rootViewController = nav;
}
@end
