//
//  Pivot.m
//  API1
//
//  Created by Bayon Forte on 4/11/14.
//  Copyright (c) 2014 Mocura. All rights reserved.
//

#import "Pivot.h"

@implementation Pivot

@synthesize company_id, user_id, role_id;

- (id)initWithJsonDictionary:(NSDictionary *)dict {
    NSLog(@"\n F I L E -> F U N C T I O N : \n %s \n",__FUNCTION__);

	self = [super init];
	if (self) {
        self.company_id = dict[@"company_id"];
        self.user_id = dict[@"user_id"];
        self.role_id = dict[@"role_id"];
	}
    
	return self;
}

@end
