//
//  AppDelegate.h
//  SPTabBarController
//
//  Created by Chandra Patni on 5/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SPTabBarController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) SPTabBarController *tabBarController;

@end
