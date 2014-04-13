//
//  User.h
//  API1
//
//  Created by Bayon Forte on 4/11/14.
//  Copyright (c) 2014 Mocura. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Role.h"
#import "Company.h"
#import "Preference.h"
#import "Status.h"


@interface User : NSObject

@property (nonatomic, retain) Role *role;

@property (nonatomic, retain) Company *usersHomeCompany;

@property (nonatomic, retain) Preference *preference;
@property (nonatomic, retain) Status *status;

@property (nonatomic, retain) NSMutableArray *arrayOfCompanies;
@property (nonatomic, retain) NSMutableArray *arrayOfPreferences;
@property (nonatomic, retain) NSMutableArray *arrayOfRoles;
@property (nonatomic, retain) NSMutableArray *arrayOfStatuses;



@property (nonatomic, retain) NSString *user_id;
@property (nonatomic, retain) NSString *first_name;
@property (nonatomic, retain) NSString *last_name;
@property (nonatomic, retain) NSString *mobile_phone_number;
@property (nonatomic, retain) NSString *alt_phone_number;
@property (nonatomic, retain) NSString *alt_phone_type_id;
@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) NSString *created_at;
@property (nonatomic, retain) NSString *updated_at;
@property (nonatomic, retain) NSString *deleted_at;

-(User *)initWithJsonDictionary:(NSDictionary *)dict;

-(NSMutableArray *) getAllCompanies; 
@end

