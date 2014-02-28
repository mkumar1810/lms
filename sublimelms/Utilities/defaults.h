//
//  defaults.h
//  sublimelms
//
//  Created by Macintosh User on 25/2/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#define GET_ACCESS_TOKEN =  @"/login/oauth2/token"
//?client_id=:client_id&redirect_uri=:redirect_uri&client_secret=:client_secret&code=:code';

typedef void (^METHODCALLBACK) (NSDictionary*);

@interface defaults : NSObject
{
    
}

@end
