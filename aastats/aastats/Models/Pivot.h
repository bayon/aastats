//
//  Pivot.h
//  API1
//
//  Created by Bayon Forte on 4/11/14.
//  Copyright (c) 2014 Mocura. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pivot : NSObject

@property (nonatomic, retain) NSString *company_id;
@property (nonatomic, retain) NSString *role_id;
@property (nonatomic, retain) NSString *user_id;

- (id)initWithJsonDictionary:(NSDictionary *)dict ;

@end
 
