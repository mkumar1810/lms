//
//  AppDelegate.h
//  sublimelms
//
//  Created by Macintosh User on 25/2/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Authorizations/lmsGetDomain.h"
#import "Utilities/defaults.h"
#import "Utilities/lmsStore.h"
#import "Authorizations/lmsLogin.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>
{
    METHODCALLBACK __domainCaptured;
    METHODCALLBACK __loginSucceeded;
    lmsStore *__lmsds;    
    NSString *__domainname;
    NSString *__accesstoken;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UITabBarController *tabBarController;

- (void) domainCaptured:(NSDictionary*) p_domainInfo;
- (void) loginSucceeded:(NSDictionary*) p_loginInfo;

@end
