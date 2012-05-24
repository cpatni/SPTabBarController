//
//  AppDelegate.m
//  SPTabBarController
//
//  Created by Chandra Patni on 5/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize tabBarController = _tabBarController;

- (void)dealloc
{
  [_window release];
  [_tabBarController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
  UIViewController *vc1 = [[[UIViewController alloc] init] autorelease];
  vc1.title = @"First";
  vc1.view.backgroundColor = [UIColor whiteColor];

  UIViewController *vc2 = [[[UIViewController alloc] init] autorelease];
  vc2.title = @"Second";
  vc2.view.backgroundColor = [UIColor grayColor];

  UIViewController *vc3 = [[[UIViewController alloc] init] autorelease];
  vc3.title = @"Third";  
  vc3.view.backgroundColor = [UIColor orangeColor];
  
UIViewController *vc4 = [[[UIViewController alloc] init] autorelease];
  vc4.title = @"Fourth";
  vc4.view.backgroundColor = [UIColor purpleColor];

  self.tabBarController = [[[SPTabBarController alloc] init] autorelease];
  self.tabBarController.controllers = [NSArray arrayWithObjects:vc1, vc2, vc3, vc4, nil];
  self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
  // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
  // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
  // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
