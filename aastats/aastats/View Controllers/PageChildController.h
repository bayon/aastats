
//  PageChildController.h


#import <UIKit/UIKit.h>

@interface PageChildController : UIViewController

@property (assign, nonatomic) NSInteger index;
@property (strong, nonatomic) IBOutlet UILabel *screenNumber;
@property (nonatomic, retain) IBOutlet UIImageView *backgroundImageView;

@end
