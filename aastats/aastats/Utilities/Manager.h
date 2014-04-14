//
//  Manager.h
//  aastats
//
//  Created by Bayon Forte on 4/13/14.
//  Copyright (c) 2014 Mocura. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Manager : NSObject{
    NSString *currentIntervalType;
}
+ (id)sharedManager;

@property (nonatomic) BOOL userDataDownloaded;
@property (nonatomic,retain) NSString *currentIntervalType;
@end
 