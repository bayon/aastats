//
//  ViewController.h
//  aastats
//
//  Created by Bayon Forte on 4/13/14.
//  Copyright (c) 2014 Mocura. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"

@interface ViewController : UIViewController
{
	Reachability *reachability;
}
@property (nonatomic, retain) Reachability *reachability;
@property (nonatomic, retain) NSMutableArray *arrayOfUserModels;
@property (nonatomic, retain) NSMutableArray *arrayOfCompanies;
@property (nonatomic, weak) IBOutlet UITableView *companyTableView;
@property (nonatomic, weak) IBOutlet UILabel *label1;

@property (assign, nonatomic) NSInteger index;
@property (strong, nonatomic) IBOutlet UILabel *screenNumber;
@property (nonatomic, retain) IBOutlet UIImageView *backgroundImageView;


- (IBAction)processUsers:(id)sender;
- (IBAction)selectInterval:(id)sender;
//-(void)refreshInterval:(NSString *)interval forCompanyId:(NSString *)companyId;



@end


// L E F T   O F F   H E R E
// finished up the models , when trying to test I didn't get any data back. connection/service/password ???
