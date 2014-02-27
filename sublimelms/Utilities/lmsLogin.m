//
//  lmsLogin.m
//  lmsMobile
//
//  Created by Macintosh User on 15/1/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "lmsLogin.h"

@implementation lmsLogin
@synthesize wv, actView;

- (id)initWithNibName:(NSString *) xibName andReturnNotification:(NSString*) p_retNotify andDomainName:(NSString*) p_domainName
{
    self = [super initWithNibName:xibName bundle:nil];
    if (self) {
        returnNotify = p_retNotify;
        // Custom initialization
        l_domainname = p_domainName;
    } 
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGPoint l_activityPos = CGPointMake([[actView superview] frame].size.width/2.0-[actView frame].size.width/2.0 , [[actView superview] frame].size.height/2.0-[actView frame].size.height/2.0);
    [actView setFrame:CGRectMake(l_activityPos.x, l_activityPos.y, actView.frame.size.width , actView.frame.size.height)];
    //NSLog(@"login screen made visible");
    //NSString *urlAddress = @"http://www.google.com/";
    NSString *urlAddress = [NSString stringWithFormat:@"http://%@/login/oauth2/auth?client_id=4&response_type=code&redirect_uri=urn:ietf:wg:oauth:2.0:oob",l_domainname];
    NSURL *url = [NSURL URLWithString:urlAddress];
    //
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url]; //[NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:100];
    NSHTTPCookie *cookie;
    //NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    NSArray *cookiesArray = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:url];
    for (cookie in cookiesArray) {
        NSLog(@"cookie information %@", cookie);
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:cookie];
    }
    [wv loadRequest:requestObj];
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL) webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *requestString = [[request URL] absoluteString];
    NSLog(@"uiweb view started and request string is %@", requestString);
    //[webView.window makeKeyAndVisible];
    return YES;
}

-  (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"webview started to load");
    [actView startAnimating];
}

-(void) webViewDidFinishLoad:(UIWebView *)webView
{
    /*[self.view removeFromSuperview];
    [[NSNotificationCenter defaultCenter] postNotificationName:returnNotify object:self userInfo: nil];
    return;*/

    //http://openlms.arrivuapps.com/login/oauth2/auth?code=a88f00c05622a08a9e4e3d899cd7f3db9519bc9ea53cdfb818b6db929464a9f54754540043358d302894415b7f668ebda84a66a89171a296f430662e61629ffc
    if (l_notified==NO)
    {
        NSString *requestString =  [[[webView request] URL] absoluteString];
        NSString *searchString = @"login/oauth2/auth?code=";
        NSRange range = [requestString rangeOfString:searchString];
        [actView stopAnimating];
        if (!(range.location == NSNotFound)) 
        {
            NSArray *codeData = [requestString componentsSeparatedByString:@"="];
            NSLog(@"code found %@", [codeData objectAtIndex:1]);
            [self.view removeFromSuperview];
            [[NSNotificationCenter defaultCenter] postNotificationName:returnNotify object:self userInfo:[[NSDictionary alloc] initWithObjectsAndKeys:[[NSString alloc] initWithFormat:@"%@",[codeData objectAtIndex:1]], @"code", nil]];
            l_notified = YES;
        }
    }
}

- (void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"webview failed with error message %@",[error description]);
    
}


@end
