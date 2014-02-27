//
//  lmsStore.m
//  lmsmobile1
//
//  Created by Macintosh User on 24/1/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "lmsStore.h"

@implementation lmsStore

- (id) init
{
    self = [super init];
    if (self)
    {
        //[NSUserDefaults resetStandardUserDefaults]; 
        //following is disabled, need to be made available in higher version ios
        /*fileName = @"lmsDataStore.plist";
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0]; 
        filePath = [documentsDirectory stringByAppendingPathComponent:fileName]; 
        [self checkAndCreateIfStoreNotAvailable];*/
        //lmsStoreDefaults = [NSUserDefaults standardUserDefaults];
        //NSLog(@"current defaults %@", lmsStoreDefaults);
    }
    return self;
}

+ (void) checkAndCreateIfStoreNotAvailable
{
    return;
    //disabled time being to make it enable after new ios version is restored
    /*NSError *error;
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    if (![[NSFileManager defaultManager] fileExistsAtPath: filePath]) 
    {
        NSString *lmsBundle = [[NSBundle mainBundle] pathForResource:@"lmsDataStore" ofType:@"plist"];
        [[NSFileManager defaultManager] copyItemAtPath:lmsBundle toPath: filePath error:&error]; 
    }*/
}

+ (NSString*) domainName
{
    return [self readValueForKey:@"DOMAINNAME"];
}

+ (NSString*) accessToken
{
    return [self readValueForKey:@"ACCESSTOKEN"];
}

+ (NSString*) userId
{
    return [self readValueForKey:@"USERID"];
}

+ (void) writeDomainName : (NSString*) p_domainName
{
    [self writeKey:@"DOMAINNAME" andValue:p_domainName];
}

+ (void) writeAccessToken:(NSString *)p_accessToken
{
    [self writeKey:@"ACCESSTOKEN" andValue:p_accessToken];
}

+ (void) writeUserId :(NSString*) p_userid
{
    [self writeKey:@"USERID" andValue:p_userid];
}


+ (void) writeKey:(NSString*) p_key andValue:(NSString*) p_value
{
    //need to enable later
    /*NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile: filePath];
    [data setObject:p_value forKey:p_key];
    [data writeToFile:filePath atomically:YES];
    [data release];*/
    NSLog(@"setting value %@ for key %@", p_value, p_key);
    [[NSUserDefaults standardUserDefaults] setValue:p_value forKey:p_key];   
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString*) readValueForKey:(NSString*) p_key
{
    //need to enable later
    NSDictionary * dict = [[NSUserDefaults standardUserDefaults] dictionaryRepresentation];
    for (id key in dict) {
        //[defs removeObjectForKey:key];
        if ([key isEqualToString:p_key]) 
        {
            return [dict valueForKey:p_key];
        }
    }
    return nil; 
}

+ (void) removeEntireLoginInformation
{
    NSLog(@"REMOVING LOGIN ENTIRE INFORMATION");
    NSDictionary * dict = [[NSUserDefaults standardUserDefaults] dictionaryRepresentation];
    for (id key in dict) {
        if ([key isEqualToString:@"DOMAINNAME"] | [key isEqualToString:@"ACCESSTOKEN"] | [key isEqualToString:@"USERID"]) 
        {
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
        }
    }
}

@end

