//
//  lmsRESTProxy.m
//  sublimelms
//
//  Created by Macintosh User on 27/2/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "lmsRESTProxy.h"

@implementation lmsRESTProxy

- (id) fetchDataWithAPIType:(NSString*) p_apiType andInputParams:(NSDictionary*) prmDict andReturnMethod:(METHODCALLBACK) p_returnMethod
{
    _reportType = [[NSString alloc] initWithFormat:@"%@", p_apiType];
    _proxyReturnMethod = p_returnMethod;
    if (prmDict) 
        inputParms = [[NSDictionary alloc] initWithDictionary:prmDict];
    dictData = [[NSMutableArray alloc] init];
    [self generateData];
}

- (void) generateData
{
    NSString *jsonMessage,*msgLength,*jsonAction;
    NSURL *url;
    NSMutableURLRequest *theRequest;
    NSURLConnection *theConnection;
    //?client_id=:client_id&redirect_uri=:redirect_uri&client_secret=:client_secret&code=:code';

    if ([_res isEqualToString:@"GETACCESSTOKEN"]==YES) 
    {
        jsonMessage = [NSString stringWithFormat:@"{\"client_id\":\"%@\",\"redirect_uri\""\"%@\",\"client_secret\":\"%@\",\"code\":\"%@\"}",[inputParms valueForKey:@"clientid"],[inputParms valueForKey:@"redirecturi"],[inputParms valueForKey:@"clientsecret"],[inputParms valueForKey:@"code"]];
        
        url = [NSURL URLWithString:[[NSString stringWithFormat:@"%@%@%@", , WS_ENV, CUSTOMERLISTFORSM_URL]];
        
        soapAction = [NSString stringWithFormat:@"%@",@"http://aahg.ws.org/getCustomerListForSalesMan"];
    }    
}

- (void) showAlertMessage:(NSString *) dispMessage
{
    
}

- (void) returnErrorMessage:(NSString*) p_errmsg
{
    
}


@end
