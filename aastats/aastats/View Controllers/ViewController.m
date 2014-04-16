//
//  ViewController.m
//  aastats
//
//  Created by Bayon Forte on 4/13/14.
//  Copyright (c) 2014 Mocura. All rights reserved.
//

#import "ViewController.h"
#import "AsyncNetwork.h"
#import "Company.h"
#import "CompaniesCell.h"
#import "User.h"
#import "UserCell.h"

static NSString *const kEndpointPrecompiledReports = @"http://hive.indatus.com/precompiled_reports/";

@interface ViewController () {
	AsyncNetwork *asyncNetwork;
	User *user;
	NSString *intervalType;
    Boolean  pinched;
}
@property (nonatomic, retain) User *user;
@property (nonatomic, retain) NSString *intervalType;
@property (nonatomic) Boolean pinched;

@end

@implementation ViewController
@synthesize sharedManager = _sharedManager;
@synthesize reachability = _reachability, arrayOfCompanies = _arrayOfCompanies,
companyTableView = _companyTableView, arrayOfUserModels = _arrayOfUserModels, user = _user, intervalType = _intervalType, pinched = _pinched;

@synthesize label1 = _label1;
@synthesize backgroundImageView = _backgroundImageView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

	if (self) {
		// Custom initialization
        _sharedManager = [Manager sharedManager];
	}

	return self;
}
-(void)viewWillAppear:(BOOL)animated{
    //set default bg color
    self.parentViewController.view.backgroundColor = [UIColor orangeColor];
    
    
    NSLog(@"child viewWillAppear : %@",[NSString stringWithFormat:@"Screen #%d", self.index]);
    [self trackTheIndex:self.index];
    
 
}

- (void)trackTheIndex:(NSUInteger)index {
    
    
    
	switch (index) {
		case 0:
			
            
			break;
            
		case 1:
			
            
			break;
            
		case 2:
			
            
			break;
            
		default:
			break;
	}
}

- (void)viewDidLoad {
	[super viewDidLoad];
	//self.screenNumber.text = [NSString stringWithFormat:@"Screen #%d", self.index];
    
    
	//self.backgroundImageView.image = [UIImage imageNamed:@"screenshot2"];
	
	_pinched = NO;
	UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchDetected:)];
	[self.view addGestureRecognizer:pinchRecognizer];

	_intervalType = @"today";

	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(afterUserAsyncThreadCompletes:) name:kNotifyUserSuccess object:asyncNetwork];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dataFailed) name:kNotifyUserFail object:nil];

	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(afterIntervalAsyncThreadCompletes:) name:kNotifyIntervalSuccess object:asyncNetwork];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(intervalDataFailed) name:kNotifyIntervalFail object:nil];

    if(!sharedManager.userDataDownloaded){
        [self processUsers:self];
        
    }
	
}

- (void)pinchDetected:(UIPinchGestureRecognizer *)pinchRecognizer {
	NSLog(@"\n F I L E -> F U N C T I O N : \n %s \n", __FUNCTION__);
	_pinched = YES;
	[_companyTableView reloadData];
}

- (void)headerTapped:(UIButton *)sender {
    NSLog(@"\n F I L E -> F U N C T I O N : \n %s \n", __FUNCTION__);

	_pinched = NO;
	[_companyTableView reloadData];
}

#pragma mark -
#pragma mark API call
- (IBAction)processUsers:(id)sender {
	Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
	NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
	if (networkStatus == NotReachable) {
		NSString *msg = @"Please check your network";
		UIAlertView *alertmsg = [[UIAlertView alloc] initWithTitle:@"Network" message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];

		[alertmsg show];
	}
	else {
		asyncNetwork = [[AsyncNetwork alloc]init];
		NSURL *url = [NSURL URLWithString:@"http://hive.indatus.com/authenticate"];
		NSDictionary *paramametersDictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"bwebb-gemini", @"subdomain",
		                                        @"bwebb@indatus.com", @"email", @"telecom1", @"password", nil];
		[asyncNetwork postRequestToURL:url withParameters:paramametersDictionary];
	}
}

// after network call

- (void)dataFailed {
	NSString *msg =  @"user Failed to get data .";
	UIAlertView *alertmsg = [[UIAlertView alloc] initWithTitle:@"No Data" message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];

	[alertmsg show];
	//[spinner stopAnimating];
}

- (void)afterUserAsyncThreadCompletes:(NSNotification *)notification {
    
    sharedManager.userDataDownloaded = YES;
    
	_arrayOfUserModels = [notification userInfo][kArrayOfUserModels];
	_user = [[User alloc]init];
	_user = [_arrayOfUserModels objectAtIndex:0];

	_arrayOfCompanies = [_user getAllCompanies];

	/* ALL
	   for (Company *company in _arrayOfCompanies) {
	   [self processIntervals:company];
	   }
	 */

	// ONE
	Company *company = [_arrayOfCompanies objectAtIndex:0];
    //NSLog(@"\n A P I  No 2 \n ");
	//---->>>>
    [self processIntervals:company];

	//[_companyTableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:YES];
	//[spinner stopAnimating];
}

- (IBAction)processIntervals:(id)sender {
	NSLog(@"\n F I L E -> F U N C T I O N : \n %s \n", __FUNCTION__);
	Company *company = (Company *)sender;
	Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
	NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
	if (networkStatus == NotReachable) {
		NSString *msg = @"Please check your network";
		UIAlertView *alertmsg = [[UIAlertView alloc] initWithTitle:@"Network" message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
		[alertmsg show];
	}
	else {
		asyncNetwork = [[AsyncNetwork alloc]init];
		NSString *urlString =  kEndpointPrecompiledReports;
        ///////   HARD CODE INTERVAL :: FOR NOW:   L E F T   O F F    H E R E//_intervalType
		NSString *urlRequestString = [NSString stringWithFormat:@"%@%@/%@", urlString, @"this_month", company.primary_id]; // _user.password
        
		[asyncNetwork getRequestToURL:urlRequestString   withUsername:@"bwebb@indatus.com" andPassword:@"telecom1"];
        
	}
}




- (void)refreshTable {
	[_companyTableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:YES];
}

- (void)intervalDataFailed {
	NSString *msg =  @"interval Failed to get data .";
	UIAlertView *alertmsg = [[UIAlertView alloc] initWithTitle:@"No Data" message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];


	[alertmsg show];
	//[spinner stopAnimating];
}

#pragma mark -
#pragma mark Interval
/*
   Url: http://hive.indatus.com/precompiled_reports/{interval}/{company_id}

   Method: GET

   intervals:
 * today
 * yesterday
 * this_week
 * last_week
 * this_month
 * last_month
 * this_year
 * last_year

   company_id
 */


/// keep a constant vairable to hold the interval type , and based on it, int the viewWill Appear, keep color consistent.

- (IBAction)selectInterval:(id)sender {
	UIButton *btnPressed = (UIButton *)sender;
	int btnTag = btnPressed.tag;
    
    NSLog(@"\n  %d \n",btnTag);
    
	switch (btnTag) {
		case 1:
			
            self.parentViewController.view.backgroundColor = [UIColor orangeColor];
            //_companyTableView.sectionIndexBackgroundColor = [UIColor orangeColor]; //tried it
			break;

		case 2:
			
            self.parentViewController.view.backgroundColor = [UIColor blueColor];
			break;

		case 3:
			
             self.parentViewController.view.backgroundColor = [UIColor greenColor];
			break;

		default:
			//_intervalType = kIntervalToday;
            //sharedManager.currentIntervalType = kIntervalToday;
			break;
	}
	// call table reload and then each company will need to refresh interval
	[_companyTableView reloadData];
}


- (void)afterIntervalAsyncThreadCompletes:(NSNotification *)notification {
	// update each company here ? will it loop through these notifications?

	NSLog(@"\n \n afterIntervalAsyncThreadCompletes \n \n");

	// WHEN SHOUD I CALL  [self refreshTable];
}

#pragma mark - Table Delegate Methods
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0){
        return @"The Meadows";
    }
    else if (section == 1){
       return @"Arlington Place";
    }
    else if(section ==2 ){
        return @"Franklin Park Place";
    }
    return @"foo haa";
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    static NSString *header = @"customHeader";
    UITableViewHeaderFooterView *vHeader;
    vHeader = [tableView dequeueReusableHeaderFooterViewWithIdentifier:header];
    if (!vHeader) {
        vHeader = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:header];
        
    }
    vHeader.textLabel.text = [self tableView:tableView titleForHeaderInSection:section];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 44.0)];
	button.alpha = 0.1;
    button.backgroundColor = [UIColor redColor];
	// [button setImage: myPNGImage forState: UIControlStateNormal];
    
	// Prepare target-action
	[button    addTarget:self action:@selector(headerTapped:)
	    forControlEvents:UIControlEventTouchUpInside];
    [vHeader setBackgroundColor:[UIColor colorWithRed:166 / 255.0 green:177 / 255.0 blue:186 / 255.0 alpha:1.0]];
	[vHeader addSubview:button];
    
    
	 
    return vHeader;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	return 44;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 30;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	if (_pinched) {
		return 0;
	}
	else {
		return [_arrayOfCompanies count];
	}


	return [_arrayOfCompanies count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	/**/
	static NSString *CellIdentifier = @"Cell";
	CompaniesCell *cell = (CompaniesCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[CompaniesCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
	}
	Company *company = _arrayOfCompanies[indexPath.row];

	cell.leftLabel.text = company.name;
	cell.rightLabel.text = company.unit_count;
	return cell;


	/*
	   static NSString *CellIdentifier = @"UserCell";
	   UserCell *cell = (UserCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	   if (cell == nil) {
	   cell = [[UserCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
	   }
	   User *userModel = _arrayOfUserModels[indexPath.row];
	   Company *company = userModel.company;

	   NSLog(@"company :%@",company);
	   cell.leftLabel.text = company.name;
	   cell.rightLabel.text = company.unit_count;
	   return cell;
	 */
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"\n F I L E -> F U N C T I O N : \n %s \n", __FUNCTION__);
	_pinched = NO;
	// [self.navigationController pushViewController:self.editMyClassViewController animated:YES];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
