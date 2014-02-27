//
//  lmsGetDomain.h
//  lmsmobile1
//
//  Created by Macintosh User on 24/1/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "defaults.h"

@interface lmsGetDomain : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    CGPoint scrollOffset;
    IBOutlet UITableView *tv;
    IBOutlet UITableViewCell *tvc;
    NSString *returnNotify;
    IBOutlet UIScrollView *scrollView;
    IBOutlet UITextField *txtdomain;
    CGRect _screensize;
}

@property (nonatomic, retain) UITableView *tv;
@property (nonatomic, retain) UITableViewCell *tvc;
@property (nonatomic, retain) UIScrollView *scrollView;
@property (nonatomic, retain) UITextField *txtdomain;

- (id)initWithNibName:(NSString *) xibName andReturnNotification:(NSString*) p_retNotify;

- (IBAction)connectClicked:(id)sender;
@end
