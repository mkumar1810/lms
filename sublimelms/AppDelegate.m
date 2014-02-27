//
//  AppDelegate.m
//  sublimelms
//
//  Created by Macintosh User on 25/2/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

#import "FirstViewController.h"

#import "SecondViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize tabBarController = _tabBarController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    __block id myself = self;
    __domainCaptured = ^(NSDictionary *p_domainInfo)
    {
        [myself domainCaptured:p_domainInfo];
    };
    __loginSucceeded = ^(NSDictionary * p_dictInfo)
    {
        [myself loginSucceeded:p_dictInfo];
    };
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    __domainname = [__lmsds domainName];
    __accesstoken = [__lmsds accessToken];
    // Override point for customization after application launch.
    /*UIViewController *viewController1 = [[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil];
    UIViewController *viewController2 = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:viewController1, viewController2, nil];
    self.window.rootViewController = self.tabBarController;*/
    //scenario when domain name is not available domain name need to be captured
    //that is done below
    if (__domainname==nil)
    {
        lmsGetDomain l_getDomain = [[lmsGetDomain alloc] initWithNibName:@"lmsGetDomain" andReturnNotification:@"domainCaptured"];
        [self.window addSubview:getDomain.view];
        //self.window.rootViewController = getDomain;
        [self.window makeKeyAndVisible];
        //[getDomain release];
        return YES;
    }
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
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

- (void) domainCaptured:(NSDictionary*) p_domainInfo;
{
    //[getDomain.view removeFromSuperview];
    NSLog(@"inside domain captured event");
    __domainname = [p_domainInfo valueForKey:@"domain"];
    [__lmsds writeDomainName:__domainname];
    lmsLogin *l_login = [[lmsLogin alloc] initWithNibName:@"lmsLogin" andReturnNotification:@"loginOpsCompleted" andDomainName:__domainname];
    [self.window addSubview:l_login.view];
    //self.window.rootViewController = login;
    [self.window makeKeyAndVisible];   
    //[login release];
}

@end
