## SPTabBarController

SPTabBarController is a custom tab bar container controller in ios 5. Unlike stock TabBarController, it can be embedded inside UINavigationController and it can be used with a custom tab bar. SPTabBarController API is identical to UITabBarController.

``` objective-c
  SPTabBarController* tbc = [[[SPTabBarController alloc] init] autorelease];
  tbc.controllers = [NSArray arrayWithObjects:vc1, vc2, vc3, vc4, nil];
```

SPTabBarController supports replacing a controller at a given index with a new controller. For example, we want to replace a container when the user logs in or logs out.

``` objective-c
- (void)replaceViewControllerAtIndex:(NSUInteger)index withViewController:(UIViewController*)newvc;
```
### One more thing

SPTabBarController is an example of implementing custom container conttoller in ios 5 which fully interoperate with other built in container in iphone and ipad. The default behavior is using IOS 5 UIViewController api to transition between two sibling view controllers. `replaceViewControllerAtIndex` is an example of a swapping a child view controllers with a new UIViewController.
