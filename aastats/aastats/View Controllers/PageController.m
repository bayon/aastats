//  PageController.m



#import "PageController.h"
#import "ViewController.h"

@interface PageController ()

@end

@implementation PageController

- (void)viewDidLoad {
	[super viewDidLoad];

	self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];

	self.pageController.dataSource = self;
	[[self.pageController view] setFrame:[[self view] bounds]];

	ViewController *initialViewController = [self viewControllerAtIndex:0];

	NSArray *viewControllers = [NSArray arrayWithObject:initialViewController];

	[self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];

	[self addChildViewController:self.pageController];
	[[self view] addSubview:[self.pageController view]];
	[self.pageController didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (ViewController *)viewControllerAtIndex:(NSUInteger)index {
	ViewController *childViewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
	childViewController.index = index;

	return childViewController;
}

#pragma mark - Page View Controller
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
	//NSLog(@"\n F I L E -> F U N C T I O N : \n %s \n", __FUNCTION__);
	NSUInteger index = [(ViewController *)viewController index];

	if (index == 0) {
         
		return nil;
	}
	 
	// Decrease the index by 1 to return
	index--;

	return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
	//NSLog(@"\n F I L E -> F U N C T I O N : \n %s \n", __FUNCTION__);
	NSUInteger index = [(ViewController *)viewController index];
	 
	index++;

	if (index == 3) {
		return nil;
	}

	return [self viewControllerAtIndex:index];
}



- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
	// The number of items reflected in the page indicator.
	return 3;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
	// The selected item reflected in the page indicator.
	return 0;
}

@end
