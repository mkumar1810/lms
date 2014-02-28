//
//  AppDelegate.h
//  sublimelms
//
//  Created by Macintosh User on 25/2/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "lmsGetDomain.h"
#import "defaults.h"
#import "lmsLogin.h"
#import "lmsStore.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>
{
    METHODCALLBACK __domainCaptured;
    METHODCALLBACK __loginSucceeded;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UITabBarController *tabBarController;

- (void) domainCaptured:(NSDictionary*) p_domainInfo;
- (void) loginSucceeded:(NSDictionary*) p_loginInfo;

@end
