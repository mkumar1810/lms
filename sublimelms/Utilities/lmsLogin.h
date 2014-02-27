//
//  lmsLogin.h
//  lmsMobile
//
//  Created by Macintosh User on 15/1/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface lmsLogin : UIViewController <UIWebViewDelegate>
{
    IBOutlet UIWebView *wv;
    IBOutlet UIActivityIndicatorView *actView;
    NSString *returnNotify;
    BOOL l_notified;
    NSString *l_domainname;
    NSString *l_accesscode;
}

- (id)initWithNibName:(NSString *) xibName andReturnNotification:(NSString*) p_retNotify andDomainName:(NSString*) p_domainName;

@property (nonatomic, retain) UIWebView *wv;
@property (nonatomic, retain) UIActivityIndicatorView *actView;

@end
