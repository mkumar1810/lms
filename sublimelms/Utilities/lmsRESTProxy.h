//
//  lmsRESTProxy.h
//  sublimelms
//
//  Created by Macintosh User on 27/2/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "defaults.h"

@interface lmsRESTProxy : NSObject <NSURLConnectionDataDelegate,NSURLConnectionDelegate>
{
    NSString *_responseType;
	NSMutableData *webData;
    NSXMLParser *xmlParser; 
	NSMutableString *parseElement,*value;
    NSMutableString *respcode, *respmessage;
    NSMutableDictionary *resultDataStruct;
    NSMutableArray *dictData;
    NSDictionary *inputParms;
    METHODCALLBACK _proxyReturnMethod;
}

- (void) initDataWithAPIType:(NSString*) p_apiType andInputParams:(NSDictionary*) prmDict andReturnMethod:(METHODCALLBACK) p_returnMethod;
- (void) generateData;
- (void) showAlertMessage:(NSString *) dispMessage;
- (void) returnErrorMessage:(NSString*) p_errmsg;

@end
