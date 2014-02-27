//
//  lmsLogin.h
//  lmsMobile
//
//  Created by Macintosh User on 15/1/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "defaults.h"

@interface lmsLogin : UIViewController <UIWebViewDelegate>
{
    IBOutlet UIWebView *wv;
    IBOutlet UIActivityIndicatorView *actView;
    METHODCALLBACK __returnNotify;
    BOOL l_notified;
    NSString *l_domainname;
    NSString *l_accesscode;
}

- (id)initWithNibName:(NSString *) xibName andReturnCallback:(NSString*) p_retNotify andDomainName:(NSString*) p_domainName;

@property (nonatomic, retain) UIWebView *wv;
@property (nonatomic, retain) UIActivityIndicatorView *actView;

@end
