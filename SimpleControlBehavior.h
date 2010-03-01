#import "BehaviorDelegatedTableViewController.h"

@interface SimpleControlBehavior : NSObject <ViewControllerBehavior> {
    UIControl *control;
    NSString  *label;

    UITableViewCellStyle style;
}

- (id)initWithLabel:(NSString*)aLabel control:(UIControl*)aControl;
- (id)withStyle:(UITableViewCellStyle)style;

@end
