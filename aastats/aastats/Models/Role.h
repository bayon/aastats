//
//  Role.h
//  API1
//
//  Created by Bayon Forte on 4/11/14.
//  Copyright (c) 2014 Mocura. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Permission.h"

@interface Role : NSObject

@property (nonatomic, retain) Permission *permission;

@property (nonatomic, retain) NSString *role_id;
@property (nonatomic, retain) NSString *company_id;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *description;
@property (nonatomic, retain) NSString *role_type_id;
@property (nonatomic, retain) NSString *created_at;
@property (nonatomic, retain) NSString *updated_at;
@property (nonatomic, retain) NSString *deleted_at;




-(Role *)initWithJsonDictionary:(NSDictionary *)dict;
@end


/*
 
 roles > permissions
 
 
 "roles": [
 {
 "id": "61",
 "company_id": "31",
 "name": "Account Owner",
 "description": "Highest privilege role for account",
 "role_type_id": "2",
 "created_at": "2014-02-21 23:04:56",
 "updated_at": "2014-02-21 23:04:56",
 "deleted_at": null,
 "pivot": {
 "user_id": "31",
 "role_id": "61",
 "company_id": "31"
 },
 "permissions": [
 {
 "id": "1",
 "product_id": "1",
 "name": "Manage Account",
 "description": "Manage company account information",
 "created_at": "2014-02-21 23:04:55",
 "updated_at": "2014-02-21 23:04:55",
 "pivot": {
 "role_id": "61",
 "permission_id": "1"
 }
 },
 {
 "id": "2",
 "product_id": "1",
 "name": "Manage Users",
 "description": "Create, edit and delete user accounts",
 "created_at": "2014-02-21 23:04:55",
 "updated_at": "2014-02-21 23:04:55",
 "pivot": {
 "role_id": "61",
 "permission_id": "2"
 }
 },
 {
 "id": "3",
 "product_id": "1",
 "name": "Manage Mobile Users",
 "description": "Create, edit and delete mobile user accounts",
 "created_at": "2014-02-21 23:04:55",
 "updated_at": "2014-02-21 23:04:55",
 "pivot": {
 "role_id": "61",
 "permission_id": "3"
 }
 }
 ]
 }
 ],
*/