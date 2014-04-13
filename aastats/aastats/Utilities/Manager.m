//
//  Manager.m
//  aastats
//
//  Created by Bayon Forte on 4/13/14.
//  Copyright (c) 2014 Mocura. All rights reserved.
//

#import "Manager.h"

@implementation Manager
@synthesize  userDataDownloaded;
#pragma mark Singleton Methods
+ (id)sharedManager {
    static Manager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
    });
    return sharedManager;
}
- (id)init
{
    self = [super init];
    if (self) {
        //inits
        userDataDownloaded = NO;
        
    }
    return self;
}

@end