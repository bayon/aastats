//
//  Company.m
//  API1
//
//  Created by Bayon Forte on 4/11/14.
//  Copyright (c) 2014 Mocura. All rights reserved.
//
#import "Company.h"

@implementation Company

@synthesize primary_id, subdomain, name, parent_company_id, company_status_id, company_type_id, website_url, physical_address, physical_city,
physical_postal_code, office_fax, office_phone, unit_count, corporate_contact_name, corporate_contact_title, primary_contact_email, primary_contact_name
, primary_contact_phone, primary_contact_title, sales_rep_id, billing_address, billing_city, billing_contact_email, billing_contact_name, billing_contact_phone, billing_contact_title, billing_id_number, billing_postal_code, billing_state, property_software_type_id, created_at, updated_at,
deleted_at, parent_company;

@synthesize pivot, preference, company, interval;
//@synthesize company;


- (id)init {
	self = [super init];
	if (self) {
		// default
        //default interval settings ? 
        
	}
	return self;
}

- (id)initWithJsonDictionary:(NSDictionary *)dict {
	NSLog(@"\n F I L E -> F U N C T I O N : \n %s \n", __FUNCTION__);

	self = [super init];
	if (self) {
		 
		NSDictionary *dictionaryOfPivotAtIndex0  = dict[@"pivot"];
		pivot = [[Pivot alloc] initWithJsonDictionary:dictionaryOfPivotAtIndex0];

		NSArray *arrayOfPreference  = dict[@"preference_settings"];
		if ([arrayOfPreference count] > 0) {
			NSDictionary *dictionaryOfPreference  = arrayOfPreference[0];
			preference = [[Preference alloc] initWithJsonDictionary:dictionaryOfPreference];
		}

		NSArray *arrayOfCompany  = dict[@"companies"];
		if ([arrayOfCompany count] > 0) {
			NSDictionary *dictionaryOfCompany  = arrayOfCompany[0];
			company = [[Company alloc] initWithJsonDictionary:dictionaryOfCompany];
		}


		self.primary_id = dict[@"id"];
		self.subdomain = dict[@"subdomain"];
		self.name = dict[@"name"];

		self.parent_company_id = dict[@"parent_company_id"];
		self.company_status_id = dict[@"company_status_id"];
		self.company_type_id = dict[@"company_type_id"];
		self.website_url = dict[@"website_url"];
		self.physical_address = dict[@"physical_address"];
		self.physical_city = dict[@"physical_city"];
		self.physical_state = dict[@"physical_state"];
		self.physical_postal_code = dict[@"physical_postal_code"];
		self.office_phone = dict[@"office_phone"];
		self.office_fax = dict[@"office_fax"];

		self.unit_count = dict[@"unit_count"];
		self.corporate_contact_name = dict[@"corporate_contact_name"];
		self.corporate_contact_title = dict[@"corporate_contact_title"];
		self.primary_contact_name = dict[@"primary_contact_name"];
		self.primary_contact_title = dict[@"primary_contact_title"];
		self.primary_contact_phone = dict[@"primary_contact_phone"];
		self.primary_contact_email = dict[@"primary_contact_email"];
		self.sales_rep_id = dict[@"sales_rep_id"];
		self.billing_id_number = dict[@"billing_id_number"];
		self.billing_address = dict[@"billing_address"];

		self.billing_city = dict[@"billing_city"];
		self.billing_state = dict[@"billing_state"];
		self.billing_postal_code = dict[@"billing_postal_code"];
		self.billing_contact_name = dict[@"billing_contact_name"];
		self.billing_contact_title = dict[@"billing_contact_title"];
		self.billing_contact_phone = dict[@"billing_contact_phone"];
		self.billing_contact_email = dict[@"billing_contact_email"];
		self.property_software_type_id = dict[@"property_software_type_id"];
		self.created_at = dict[@"created_at"];
		self.updated_at = dict[@"updated_at"];

		self.deleted_at = dict[@"deleted_at"];
		self.parent_company = dict[@"parent_company"];
	}
	return self;
}

@end
