#import "BehaviorDelegatedTableViewController.h"

@interface SimpleControlBehavior : NSObject <ViewControllerBehavior> {
    UIControl *control;
    NSString  *label;
}

- (id)initWithLabel:(NSString*)aLabel control:(UIControl*)aControl;

@end
