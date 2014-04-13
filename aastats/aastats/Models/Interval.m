//
//  Interval.m
//  API1
//
//  Created by Bayon Forte on 4/12/14.
//  Copyright (c) 2014 Mocura. All rights reserved.
//

#import "Interval.h"

@implementation Interval


- (id)initWithJsonDictionary:(NSDictionary *)dict {
	NSLog(@"\n F I L E -> F U N C T I O N : \n %s \n", __FUNCTION__);

	self = [super init];
	if (self) {
		self.company_id                             = dict[@"company_id"];
		self.property_msg_count_emergency           = dict[@"property_msg_count_emergency"];
		self.property_msg_count_leasing             = dict[@"property_msg_count_leasing"];
		self.property_msg_count_general             = dict[@"property_msg_count_general"];
		self.property_msg_count_courtesy            = dict[@"property_msg_count_courtesy"];
		self.property_avg_emergency_response_time   = dict[@"property_avg_emergency_response_time"];
		self.property_avg_onsite_response_time      = dict[@"property_avg_onsite_response_time"];
		self.property_avg_total_work_time           = dict[@"property_avg_total_work_time"];
		self.property_avg_total_resolution_time     = dict[@"property_avg_total_resolution_time"];
		self.portfolio_avg_emergency_response_time  = dict[@"portfolio_avg_emergency_response_time"];
		self.portfolio_avg_onsite_response_time     = dict[@"portfolio_avg_onsite_response_time"];
		self.portfolio_avg_total_work_time          = dict[@"portfolio_avg_total_work_time"];
		self.portfolio_avg_total_resolution_time    = dict[@"portfolio_avg_total_resolution_time"];
		self.industry_avg_emergency_response_time   = dict[@"industry_avg_emergency_response_time"];
		self.industry_avg_onsite_response_time      = dict[@"industry_avg_onsite_response_time"];
		self.industry_avg_total_work_time           = dict[@"industry_avg_total_work_time"];
		self.industry_avg_total_resolution_time     = dict[@"industry_avg_total_resolution_time"];
	}

	return self;
}

@end
