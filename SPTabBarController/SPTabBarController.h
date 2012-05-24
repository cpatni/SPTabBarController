//
//  SPTabBarViewController.h
//  SPTabBarController
//
//  Created by Chandra Patni on 5/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SPTabBarController : UIViewController

@property (nonatomic, retain) UIViewController* selectedViewController;
@property (nonatomic, copy) NSArray* controllers; 
@property (nonatomic, readonly) UITabBar* tabBar; 
@property (nonatomic, assign) NSUInteger initialTabIndex;
@property (nonatomic, assign) NSUInteger selectedTabIndex;

/*
 * Replaces the view controller at the given index with a new view 
 * controller. The current implemenation doesn't change the tab bar
 * item.
 */
- (void)replaceViewControllerAtIndex:(NSUInteger)index withViewController:(UIViewController*)newvc;
@end
