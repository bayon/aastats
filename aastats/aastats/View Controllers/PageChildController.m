
//  PageChildController.m


#import "PageChildController.h"

@interface PageChildController ()

@end

@implementation PageChildController
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
    // Do any additional setup after loading the view from its nib.
    
    self.screenNumber.text = [NSString stringWithFormat:@"Screen #%d", self.index];
    self.backgroundImageView.image = [UIImage imageNamed:@"screenshot2"];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
