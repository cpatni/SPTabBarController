## SPTabBarController

SPTabBarController is a custom tab bar container controller in ios 5. Unlike stock TabBarController, it can be embedded inside UINavigationController and it can be used with a custom tab bar.

SPTabBarController is also an example of implementing custom container conttoller in ios 5 which fully interoperate with other built in container in iphone and ipad.

SPTabBarController also supports replacing a controller at a given index with a new controller. For example, we want to replace a container when the user logs in or logs out.

``` objective-c
- (void)replaceViewControllerAtIndex:(NSUInteger)index withViewController:(UIViewController*)newvc;
```
