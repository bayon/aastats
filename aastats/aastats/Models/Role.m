//
//  Role.m
//  API1
//
//  Created by Bayon Forte on 4/11/14.
//  Copyright (c) 2014 Mocura. All rights reserved.
//

#import "Role.h"

@implementation Role
@synthesize company_id, description, name;
@synthesize permission;

- (id)initWithJsonDictionary:(NSDictionary *)dict {
    NSLog(@"\n F I L E -> F U N C T I O N : \n %s \n",__FUNCTION__);

	self = [super init];
	if (self) {
        
        self.role_id = dict[@"role_id"];
        self.company_id = dict[@"company_id"];
        self.name = dict[@"name"];
        self.description = dict[@"description"];
        
        self.role_type_id = dict[@"role_type_id"];
        self.created_at = dict[@"created_at"];
        self.updated_at = dict[@"updated_at"];
        self.deleted_at = dict[@"deleted_at"];
        
        NSArray *arrayOfPermission  = dict[@"permissions"];
		NSDictionary *dictionaryOfPermission  = arrayOfPermission[0];
		permission = [[Permission alloc] initWithJsonDictionary:dictionaryOfPermission];
        
	}
    
	return self;
}

@end
