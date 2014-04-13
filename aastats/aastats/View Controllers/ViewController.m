//
//  ViewController.m
//  aastats
//
//  Created by Bayon Forte on 4/13/14.
//  Copyright (c) 2014 Mocura. All rights reserved.
//

#import "ViewController.h"
#import "AsyncNetwork.h"
#import "Constants.h"
#import "Company.h"
#import "CompaniesCell.h"
#import "User.h"
#import "UserCell.h"

@interface ViewController () {
	AsyncNetwork *asyncNetwork;
	User *user;
	NSString *intervalType;
}
@property (nonatomic, retain) User *user;
@property (nonatomic, retain) NSString *intervalType;
@property (nonatomic) BOOL pinched;

@end

@implementation ViewController

@synthesize reachability = _reachability, arrayOfCompanies = _arrayOfCompanies,
companyTableView = _companyTableView, arrayOfUserModels = _arrayOfUserModels, user = _user, intervalType = _intervalType, pinched = _pinched;

@synthesize label1 = _label1;
@synthesize backgroundImageView = _backgroundImageView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

	if (self) {
		// Custom initialization
	}

	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	self.screenNumber.text = [NSString stringWithFormat:@"Screen #%d", self.index];
	self.backgroundImageView.image = [UIImage imageNamed:@"screenshot2"];
	///---
	_pinched = NO;
	UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchDetected:)];
	[self.view addGestureRecognizer:pinchRecognizer];

	_intervalType = @"today";

	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(afterUserAsyncThreadCompletes:) name:kNotifyUserSuccess object:asyncNetwork];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dataFailed) name:kNotifyUserFail object:nil];

	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(afterIntervalAsyncThreadCompletes:) name:kNotifyIntervalSuccess object:asyncNetwork];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(intervalDataFailed) name:kNotifyIntervalFail object:nil];


	[self processUsers:self];
}

- (void)pinchDetected:(UIPinchGestureRecognizer *)pinchRecognizer {
	NSLog(@"\n F I L E -> F U N C T I O N : \n %s \n", __FUNCTION__);
	_pinched = YES;
	[_companyTableView reloadData];
}

- (void)headerTapped:(UIButton *)sender {
	_pinched = NO;
	[_companyTableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	return 44;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
	UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 18)];
	/* Create custom view to display section header... */
	UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, tableView.frame.size.width, 18)];
	[label setFont:[UIFont boldSystemFontOfSize:12]];
	NSString *string = @"section header";
	[label setText:string];
	[view addSubview:label];
	UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 80.0)];
	button.alpha = 0.7;
	// [button setImage: myPNGImage forState: UIControlStateNormal];

	/* Prepare target-action */
	[button    addTarget:self action:@selector(headerTapped:)
	    forControlEvents:UIControlEventTouchUpInside];

	[view addSubview:button];


	[view setBackgroundColor:[UIColor colorWithRed:166 / 255.0 green:177 / 255.0 blue:186 / 255.0 alpha:1.0]]; //your background color...
	return view;
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
	NSString *msg =  @"Failed to get data .";
	UIAlertView *alertmsg = [[UIAlertView alloc] initWithTitle:@"No Data" message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];

	[alertmsg show];
	//[spinner stopAnimating];
}

- (void)afterUserAsyncThreadCompletes:(NSNotification *)notification {
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
		NSString *urlString =  @"http://hive.indatus.com/precompiled_reports/";

		NSString *parameterString = [NSString stringWithFormat:@"?interval=%@&company_id=%@", _intervalType, company.primary_id]; // _user.password

		[asyncNetwork getRequestToURL:urlString withParameters:parameterString withUsername:@"bwebb@indatus.com" andPassword:@"telecom1"];

		//update company here add to array of modified companies...
	}
}

/*
   $ curl -i -X POST http://snej.cloudant.com/dbname/
   HTTP/1.1 401 Unauthorized
   WWW-Authenticate: Basic realm="Cloudant Private Database"

   $ curl -i -X PUT https://domain.iriscouch.com/dbname
   HTTP/1.1 401 Unauthorized
   WWW-Authenticate: Basic realm="administrator"
 */




- (void)refreshTable {
	[_companyTableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:YES];
}

- (void)intervalDataFailed {
	NSString *msg =  @"Failed to get data .";
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



- (IBAction)selectInterval:(id)sender {
	UIButton *btnPressed = (UIButton *)sender;
	int btnTag = btnPressed.tag;

	switch (btnTag) {
		case 1:
			_intervalType = @"today";
			break;

		case 2:
			_intervalType = @"this_week";
			break;

		case 3:
			_intervalType = @"this_month";
			break;

		default:
			_intervalType = @"today";
			break;
	}
	// call table reload and then each company will need to refresh interval
	[_companyTableView reloadData];
}

/*
   -(void)refreshInterval:(NSString *)interval forCompanyId:(NSString *)companyId{
   Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
   NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
   if (networkStatus == NotReachable) {
   NSString *msg = @"Please check your network";
   UIAlertView *alertmsg = [[UIAlertView alloc] initWithTitle:@"Network" message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];

   [alertmsg show];
   }
   else {
   asyncNetwork = [[AsyncNetwork alloc]init];
   NSURL *url = [NSURL URLWithString:@"http://hive.indatus.com/precompiled_reports/"];
   NSDictionary *paramametersDictionary = [NSDictionary dictionaryWithObjectsAndKeys:interval, @"interval",
   companyId, @"company_id",  nil];
   [asyncNetwork getRequestToURL:url withParameters:paramametersDictionary];
   }
   }
 */

- (void)afterIntervalAsyncThreadCompletes:(NSNotification *)notification {
	// update each company here ? will it loop through these notifications?

	NSLog(@"\n \n afterIntervalAsyncThreadCompletes \n \n");


	// WHEN SHOUD I CALL  [self refreshTable];
}

#pragma mark - Table Delegate Methods

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
	_pinched = NO;
	// [self.navigationController pushViewController:self.editMyClassViewController animated:YES];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
