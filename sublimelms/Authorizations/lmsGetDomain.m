//
//  lmsGetDomain.m
//  lmsmobile1
//
//  Created by Macintosh User on 24/1/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "lmsGetDomain.h"

static bool shouldScroll = true;

@implementation lmsGetDomain

@synthesize tv,tvc, scrollView, txtdomain;

- (id)initWithNibName:(NSString *) xibName andReturnCallback:(METHODCALLBACK) p_retNotify
{
    self = [super initWithNibName:xibName bundle:nil];
    NSLog(@"nib name is %@", xibName);
    if (self) {
        __returnNotify = p_retNotify;
        CGRect tvrect = [tv frame];
        tvrect.size.height = [tvc frame].size.height;
        
        //[tvc setHidden:YES];
        [tv setFrame:tvrect];
        [tv setBackgroundColor:self.view.backgroundColor];
        tv.backgroundView = nil;
        // Custom initialization
    } 
    return self;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        // Custom initialization
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
    return YES;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  [tvc frame].size.height;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*static NSString *cellid=@"Celldomain";
    UITableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] 
                initWithStyle:UITableViewCellStyleSubtitle
                reuseIdentifier:cellid];
        [tvc setHidden:NO];
        //[tvc setBounds:CGRectMake(0, 0, [tvc frame].size.width, [tvc frame].size.height)];
        [cell.contentView addSubview:tvc];
    }*/
    return tvc;
}

- (IBAction)connectClicked:(id)sender
{
    //NSLog(@"dictionary datra %@", loginInputs);
    [self.view removeFromSuperview];
    //[[NSNotificationCenter defaultCenter] postNotificationName:returnNotify object:self userInfo: [[NSDictionary alloc] initWithObjectsAndKeys:[[NSString alloc] initWithFormat:@"%@",txtdomain.text ] , @"domain", nil]];  
    __returnNotify([[NSDictionary alloc] initWithObjectsAndKeys:[[NSString alloc] initWithFormat:@"%@",txtdomain.text ] , @"domain", nil]);
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
   return @"";
}

- (NSString*) tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return @"";
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    shouldScroll = true;
    [scrollView setContentOffset:scrollOffset animated:YES]; 
    [textField resignFirstResponder];
    scrollOffset = scrollView.contentOffset;
    scrollOffset.y = 0;
    return NO;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField 
{
    if (shouldScroll) {
        scrollOffset = scrollView.contentOffset;
        CGPoint scrollPoint;
        CGRect inputFieldBounds = [textField bounds];
        inputFieldBounds = [textField convertRect:inputFieldBounds toView:scrollView];
        scrollPoint = inputFieldBounds.origin;
        scrollPoint.x = 0;
        scrollPoint.y=150;
        [scrollView setContentOffset:scrollPoint animated:YES];  
        shouldScroll = false;
    }
}

- (BOOL) textFieldDidEndEditing:(UITextField *) textField 
{
    return YES;
}


@end
