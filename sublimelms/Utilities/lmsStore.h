//
//  lmsStore.h
//  lmsmobile1
//
//  Created by Macintosh User on 24/1/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface lmsStore : NSObject
{
    NSString *fileName;
    NSString *filePath;
  }

- (void) checkAndCreateIfStoreNotAvailable;
- (NSString*) domainName;
- (NSString*) accessToken;
- (NSString*) userId;
- (void) writeDomainName : (NSString*) p_domainName;
- (void) writeAccessToken : (NSString*) p_accessToken;
- (void) writeUserId :(NSString*) p_userid;
- (void) writeKey:(NSString*) p_key andValue:(NSString*) p_value;
- (void) removeEntireLoginInformation;
- (NSString*) readValueForKey:(NSString*) p_key;

@end


