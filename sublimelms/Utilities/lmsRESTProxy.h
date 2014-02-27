//
//  lmsRESTProxy.h
//  sublimelms
//
//  Created by Macintosh User on 27/2/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "defaults.h"

@interface lmsRESTProxy : NSObject
{
    NSString *_reportType;
	NSMutableData *webData;
    NSXMLParser *xmlParser; 
	NSMutableString *parseElement,*value;
    NSMutableString *respcode, *respmessage;
    NSMutableDictionary *resultDataStruct;
    NSMutableArray *dictData;
    NSDictionary *inputParms;
    METHODCALLBACK _proxyReturnMethod;
}

- (void) initWithAPIType:(NSString*) p_apiType andInputParams:(NSDictionary*) prmDict andReturnMethod:(METHODCALLBACK) p_returnMethod;

@end
