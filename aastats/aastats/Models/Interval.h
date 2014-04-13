//
//  Interval.h
//  API1
//
//  Created by Bayon Forte on 4/12/14.
//  Copyright (c) 2014 Mocura. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Interval : NSObject

@property (nonatomic, retain) NSString *company_id;
@property (nonatomic, retain) NSString *property_msg_count_emergency;
@property (nonatomic, retain) NSString *property_msg_count_leasing;
@property (nonatomic, retain) NSString *property_msg_count_general;
@property (nonatomic, retain) NSString *property_msg_count_courtesy;
@property (nonatomic, retain) NSString *property_avg_emergency_response_time;
@property (nonatomic, retain) NSString *property_avg_onsite_response_time;
@property (nonatomic, retain) NSString *property_avg_total_work_time;
@property (nonatomic, retain) NSString *property_avg_total_resolution_time;
@property (nonatomic, retain) NSString *portfolio_avg_emergency_response_time;
@property (nonatomic, retain) NSString *portfolio_avg_onsite_response_time;
@property (nonatomic, retain) NSString *portfolio_avg_total_work_time;
@property (nonatomic, retain) NSString *portfolio_avg_total_resolution_time;
@property (nonatomic, retain) NSString *industry_avg_emergency_response_time;
@property (nonatomic, retain) NSString *industry_avg_onsite_response_time;
@property (nonatomic, retain) NSString *industry_avg_total_work_time;
@property (nonatomic, retain) NSString *industry_avg_total_resolution_time;

- (id)initWithJsonDictionary:(NSDictionary *)dict;

@end

