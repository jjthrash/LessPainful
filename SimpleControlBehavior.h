#import "BehaviorDelegatedTableViewController.h"
#import "BasicTableCellBehavior.h"

@interface SimpleControlBehavior : BasicTableCellBehavior {
    UIControl *control;
}

- (id)initWithLabel:(NSString*)aLabel control:(UIControl*)aControl;

@end
