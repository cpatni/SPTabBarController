//
//  SPTabBarController.m
//  Tabs
//
//  Created by Chandra Patni on 5/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SPTabBarController.h"
#define TAB_BAR_HEIGHT 44

@interface SPTabBarController () <UITabBarDelegate>
{
  NSMutableArray* _controllers;
}
@end

@implementation SPTabBarController
@synthesize selectedViewController = _selectedViewController;
@synthesize controllers = _controllers; 
@synthesize tabBar = _tabBar; 
@synthesize initialTabIndex = _initialTabIndex;
@synthesize selectedTabIndex = _selectedTabIndex;

- (id)init
{
  self = [super init];
  if(self) {
  }
  return self;
}

-(void) setControllers:(NSArray*) newControllers
{
  _controllers = [NSMutableArray arrayWithArray:newControllers];
  [_controllers retain];
  for (UIViewController* controller in _controllers) {
    [self addChildViewController:controller];
    [controller didMoveToParentViewController:self];
  }
  [self setInitialTabIndex:0];
}

-(void) setInitialTabIndex:(NSUInteger) newInitialTabIndex
{
  _initialTabIndex = newInitialTabIndex;
  _selectedViewController = [_controllers objectAtIndex:newInitialTabIndex];
  _selectedTabIndex = newInitialTabIndex;
}

-(void) viewDidLoad
{
  CGRect bounds = self.view.bounds;
  CGFloat w = bounds.size.width;
  CGFloat h = bounds.size.height;
  
  CGRect tabBarRect = CGRectMake(0, h - TAB_BAR_HEIGHT, w, TAB_BAR_HEIGHT);
  NSMutableArray* tabBarItems = [[NSMutableArray alloc]initWithCapacity:_controllers.count];
  
  for (UIViewController* controller in _controllers) {
    [tabBarItems addObject:controller.tabBarItem];
  }
  _tabBar = [[UITabBar alloc] initWithFrame:tabBarRect];
  [_tabBar setItems:tabBarItems animated:NO];
  [_tabBar setSelectedItem:[tabBarItems objectAtIndex:_selectedTabIndex]];
  [tabBarItems release];
  _tabBar.delegate = self;
  _tabBar.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleTopMargin;
  _tabBar.contentMode = UIViewContentModeRedraw;
  [self.view addSubview:_tabBar];
  [_tabBar release];
  
  UIView* contentView = [_selectedViewController view];
  contentView.frame = CGRectMake(0, 0, w, h - TAB_BAR_HEIGHT);
  contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
  [self.view addSubview:contentView];
}

-(void)viewDidUnload
{
  _tabBar = nil;
  [_controllers release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
	return [self.selectedViewController shouldAutorotateToInterfaceOrientation:toInterfaceOrientation];
}

#pragma mark UITabBarDelegate protocol
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
  //we use indexOfObject here instead of hash lookup
  //because for small array it's not an issue.
  //generally, index lookup on small array outperforms
  //hash lookup. YMMV
  NSUInteger newIndex = [_tabBar.items indexOfObject:item];
  UIViewController* fromvc = _selectedViewController;
  UIViewController* tovc = [_controllers objectAtIndex:newIndex];
  tovc.view.frame = fromvc.view.frame;
  [self 
   transitionFromViewController:fromvc
   toViewController:tovc
   duration:0.4
   options:UIViewAnimationOptionTransitionFlipFromLeft
   animations:nil
   completion:^(BOOL done) {
     _selectedTabIndex = newIndex;
     _selectedViewController = tovc;
   }];
}
@end
