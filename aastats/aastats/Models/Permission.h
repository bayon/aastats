//
//  Permission.h
//  API1
//
//  Created by Bayon Forte on 4/11/14.
//  Copyright (c) 2014 Mocura. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pivot.h"

@interface Permission : NSObject

@property (nonatomic, retain) Pivot *pivot;

@property (nonatomic, retain) NSString *permission_id;
@property (nonatomic, retain) NSString *product_id;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *description;
@property (nonatomic, retain) NSString *created_at;
@property (nonatomic, retain) NSString *updated_at;

- (id)initWithJsonDictionary:(NSDictionary *)dict;

@end
