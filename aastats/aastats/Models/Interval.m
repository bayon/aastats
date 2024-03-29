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

	self = [super init];
    
    
	if (self) {
		
        //CLASS TYPE

        
        self.company_id                             = dict[@"company_id"];
		
        self.industry_avg_emergency_response_time   = dict[@"industry_avg_emergency_response_time"];
		self.industry_avg_onsite_response_time      = dict[@"industry_avg_onsite_response_time"];
		self.industry_avg_total_work_time           = dict[@"industry_avg_total_work_time"];
		self.industry_avg_total_resolution_time     = dict[@"industry_avg_total_resolution_time"];
        
        self.portfolio_avg_emergency_response_time  = dict[@"portfolio_avg_emergency_response_time"];
		self.portfolio_avg_onsite_response_time     = dict[@"portfolio_avg_onsite_response_time"];
		self.portfolio_avg_total_work_time          = dict[@"portfolio_avg_total_work_time"];
		self.portfolio_avg_total_resolution_time    = dict[@"portfolio_avg_total_resolution_time"];
        
        self.property_avg_emergency_response_time   = dict[@"property_avg_emergency_response_time"];
		self.property_avg_onsite_response_time      = dict[@"property_avg_onsite_response_time"];
		self.property_avg_total_work_time           = dict[@"property_avg_total_work_time"];
		self.property_avg_total_resolution_time     = dict[@"property_avg_total_resolution_time"];
        
        self.property_msg_count_emergency           = dict[@"property_msg_count_emergency"];
		self.property_msg_count_leasing             = dict[@"property_msg_count_leasing"];
		self.property_msg_count_general             = dict[@"property_msg_count_general"];
		self.property_msg_count_courtesy            = dict[@"property_msg_count_courtesy"];
		
        
		
        
		
        
	}
	return self;
}

@end


/*
 ERROR: [__NSArrayM objectForKeyedSubscript:]: unrecognized selector sent to instance
 Your code thinks the JSON deserializes to an object (dictionary), but in fact it deserializes to an array containing one object. Try this:
 
 */



