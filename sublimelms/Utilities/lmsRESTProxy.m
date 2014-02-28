//
//  lmsRESTProxy.m
//  sublimelms
//
//  Created by Macintosh User on 27/2/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "lmsRESTProxy.h"
#import "lmsStore.h"


@implementation lmsRESTProxy

- (void) initDataWithAPIType:(NSString*) p_apiType andInputParams:(NSDictionary*) prmDict andReturnMethod:(METHODCALLBACK) p_returnMethod
{
    _responseType = [[NSString alloc] initWithFormat:@"%@", p_apiType];
    _proxyReturnMethod = p_returnMethod;
    if (prmDict) 
        inputParms = [[NSDictionary alloc] initWithDictionary:prmDict];
    dictData = [[NSMutableArray alloc] init];
    [self generateData];
}

- (void) generateData
{
    NSString *jsonMessage,*msgLength;//,*jsonAction;
    NSURL *url;
    NSMutableURLRequest *theRequest;
    NSURLConnection *theConnection;
    //?client_id=:client_id&redirect_uri=:redirect_uri&client_secret=:client_secret&code=:code';
    

    if ([_responseType isEqualToString:@"GETACCESSTOKEN"]==YES) 
    {
        jsonMessage = [NSString stringWithFormat:@"%@", inputParms]; 
        /*jsonMessage = [NSString stringWithFormat:@"{\"client_id\":\"%@\",\"redirect_uri\":\"%@\",\"client_secret\":\"%@\",\"code\":\"%@\"}",[inputParms valueForKey:@"clientid"],[inputParms valueForKey:@"redirecturi"],[inputParms valueForKey:@"clientsecret"],[inputParms valueForKey:@"code"]];*/
        NSLog(@"the json message %@", jsonMessage);
        url = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@/%@",[lmsStore domainName] , GET_ACCESS_TOKEN]];
        NSLog(@"the rest url is %@", url);
        
    }    
    theRequest = [NSMutableURLRequest requestWithURL:url];
    msgLength = [NSString stringWithFormat:@"%d", [jsonMessage length]];
    [theRequest addValue: @"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    //[theRequest addValue:soapAction forHTTPHeaderField:@"SOAPAction"];
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [jsonMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if(theConnection)
        webData = [[NSMutableData data] init];
    else 
        [self returnErrorMessage:@"Error in Connection"];

}

- (void) showAlertMessage:(NSString *) dispMessage
{
    
}

- (void) returnErrorMessage:(NSString*) p_errmsg
{
    
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [webData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [webData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSError *myError = nil;
	NSString *theXML = [[NSString alloc] initWithBytes: [webData mutableBytes] length:[webData length] encoding:NSUTF8StringEncoding];
    NSLog(@"the result is %@", theXML);
    //[self processAndReturnXMLMessage];
    NSDictionary *l_res = [NSJSONSerialization JSONObjectWithData:webData options:NSJSONReadingMutableLeaves error:&myError];
    _proxyReturnMethod(l_res);
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSString *errmsg = [error description];
    NSLog(@"the error is %@", errmsg);
    [self returnErrorMessage:errmsg];
}


@end
